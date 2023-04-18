# Set the project folder directory
file mkdir ST_Project
set ST_PROJ [file normalize [file join [pwd] ST_Project]]

cd $ST_PROJ

#读取文件，top.xdc只包含管脚约束
read_verilog ../led_top.v
read_verilog ../led_static.v
read_verilog ../led_pr1.v
read_xdc ../top.xdc

#综合顶层模块,导出综合网表
synth_design -flatten_hierarchy rebuilt -top led_top -part xc7z020clg400-1
write_checkpoint top_synth.dcp

#综合RM模块，导出综合网表
synth_design -mode out_of_context -flatten_hierarchy rebuilt -top led_pr1 -part xc7z020clg400-1
write_checkpoint rp1_a_synth.dcp

#组合顶层网表、RM网表和约束文件,定义重构区，top_impl.xdc中包含了重构区创建pblock的约束
open_checkpoint top_synth.dcp
read_xdc ../top_impl.xdc
set_property HD.RECONFIGURABLE true [get_cells Inst_pr]
read_checkpoint -cell Inst_pr rp1_a_synth.dcp

#生成Configuration1布局布线后完整设计(静态+动态逻辑)的dcp(Top routed dcp）
opt_design
place_design
route_design
write_checkpoint config1_routed.dcp

#生成动态逻辑的布局布线后dcp(RM routed dcp)
write_checkpoint -cell Inst_pr rp1_a_route_design.dcp

#去掉动态逻辑(为了加入新的动态逻辑网表做准备)
update_design -cell Inst_pr -black_box

#锁定所有静态部分的布局布线信息, 保证静态部分在之后所有的Configuration中都不再有任何变化
lock_design -level routing

#生成只包含静态逻辑的dcp(此时动态模块为黑盒)
write_checkpoint static_routed.dcp

#生成configuration1设计对应的bit文件与Partial bit文件  
open_checkpoint config1_routed.dcp
write_bitstream -bin_file config1