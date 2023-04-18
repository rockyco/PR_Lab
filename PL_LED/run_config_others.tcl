# Set the project folder directory
set STATIC_PROJ [file normalize [file join [pwd] ST_Project]]
file mkdir PR_Project
set PR_PROJ [file normalize [file join [pwd] PR_Project]]
cd $PR_PROJ

#Configuration2
read_verilog ../led_pr2.v
synth_design -mode out_of_context -flatten_hierarchy rebuilt -top led_pr2 -part xc7z020clg400-1
write_checkpoint rp1_b_synth.dcp
open_checkpoint ${STATIC_PROJ}/static_routed.dcp
read_checkpoint -cell Inst_pr rp1_b_synth.dcp
opt_design
place_design
route_design
write_checkpoint config2_routed.dcp
write_checkpoint -cell Inst_pr rp1_b_route_design.dcp
open_checkpoint config2_routed.dcp
write_bitstream -bin_file config2

#Configuration3
read_verilog ../led_pr3.v
synth_design -mode out_of_context -flatten_hierarchy rebuilt -top led_pr3 -part xc7z020clg400-1
write_checkpoint rp1_c_synth.dcp
open_checkpoint ${STATIC_PROJ}/static_routed.dcp
read_checkpoint -cell Inst_pr rp1_c_synth.dcp
opt_design
place_design
route_design
write_checkpoint config3_routed.dcp
write_checkpoint -cell Inst_pr rp1_c_route_design.dcp
open_checkpoint config3_routed.dcp
write_bitstream -bin_file config3

#Configuration4
read_verilog ../led_pr4.v
synth_design -mode out_of_context -flatten_hierarchy rebuilt -top led_pr4 -part xc7z020clg400-1
write_checkpoint rp1_d_synth.dcp
open_checkpoint ${STATIC_PROJ}/static_routed.dcp
read_checkpoint -cell Inst_pr rp1_d_synth.dcp
opt_design
place_design
route_design
write_checkpoint config4_routed.dcp
write_checkpoint -cell Inst_pr rp1_d_route_design.dcp
open_checkpoint config4_routed.dcp
write_bitstream -bin_file config4