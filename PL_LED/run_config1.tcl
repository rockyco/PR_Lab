# Set the project folder directory
file mkdir ST_Project
set ST_PROJ [file normalize [file join [pwd] ST_Project]]

cd $ST_PROJ

#��ȡ�ļ���top.xdcֻ�����ܽ�Լ��
read_verilog ../led_top.v
read_verilog ../led_static.v
read_verilog ../led_pr1.v
read_xdc ../top.xdc

#�ۺ϶���ģ��,�����ۺ�����
synth_design -flatten_hierarchy rebuilt -top led_top -part xc7z020clg400-1
write_checkpoint top_synth.dcp

#�ۺ�RMģ�飬�����ۺ�����
synth_design -mode out_of_context -flatten_hierarchy rebuilt -top led_pr1 -part xc7z020clg400-1
write_checkpoint rp1_a_synth.dcp

#��϶�������RM�����Լ���ļ�,�����ع�����top_impl.xdc�а������ع�������pblock��Լ��
open_checkpoint top_synth.dcp
read_xdc ../top_impl.xdc
set_property HD.RECONFIGURABLE true [get_cells Inst_pr]
read_checkpoint -cell Inst_pr rp1_a_synth.dcp

#����Configuration1���ֲ��ߺ��������(��̬+��̬�߼�)��dcp(Top routed dcp��
opt_design
place_design
route_design
write_checkpoint config1_routed.dcp

#���ɶ�̬�߼��Ĳ��ֲ��ߺ�dcp(RM routed dcp)
write_checkpoint -cell Inst_pr rp1_a_route_design.dcp

#ȥ����̬�߼�(Ϊ�˼����µĶ�̬�߼�������׼��)
update_design -cell Inst_pr -black_box

#�������о�̬���ֵĲ��ֲ�����Ϣ, ��֤��̬������֮�����е�Configuration�ж��������κα仯
lock_design -level routing

#����ֻ������̬�߼���dcp(��ʱ��̬ģ��Ϊ�ں�)
write_checkpoint static_routed.dcp

#����configuration1��ƶ�Ӧ��bit�ļ���Partial bit�ļ�  
open_checkpoint config1_routed.dcp
write_bitstream -bin_file config1