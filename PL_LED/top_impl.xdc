create_pblock pblock_Inst_pr
add_cells_to_pblock [get_pblocks pblock_Inst_pr] [get_cells -quiet [list Inst_pr]]
resize_pblock [get_pblocks pblock_Inst_pr] -add {SLICE_X98Y102:SLICE_X113Y112}
resize_pblock [get_pblocks pblock_Inst_pr] -add {DSP48_X4Y42:DSP48_X4Y43}
resize_pblock [get_pblocks pblock_Inst_pr] -add {RAMB18_X5Y42:RAMB18_X5Y43}
resize_pblock [get_pblocks pblock_Inst_pr] -add {RAMB36_X5Y21:RAMB36_X5Y21}
set_property RESET_AFTER_RECONFIG true [get_pblocks pblock_Inst_pr]
set_property SNAPPING_MODE ROUTING [get_pblocks pblock_Inst_pr]