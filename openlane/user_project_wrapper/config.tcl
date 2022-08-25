# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# Base Configurations. Don't Touch
# section begin

set ::env(PDK) $::env(PDK)
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

# YOU ARE NOT ALLOWED TO CHANGE ANY VARIABLES DEFINED IN THE FIXED WRAPPER CFGS 
source $::env(DESIGN_DIR)/fixed_dont_change/fixed_wrapper_cfgs.tcl

# YOU CAN CHANGE ANY VARIABLES DEFINED IN THE DEFAULT WRAPPER CFGS BY OVERRIDING THEM IN THIS CONFIG.TCL
source $::env(DESIGN_DIR)/fixed_dont_change/default_wrapper_cfgs.tcl

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) user_project_wrapper
#section end

# User Configurations
## Source Verilog Files
set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/user_project_wrapper.v"

## Clock configurations
set ::env(CLOCK_PORT) "user_clock2"
set ::env(CLOCK_NET) ""

set ::env(CLOCK_PERIOD) "10"

## Internal Macros
### Macro PDN Connections
set ::env(FP_PDN_MACRO_HOOKS) "\
	core vccd1 vssd1 vccd1 vssd1, \
	wbs_int vccd1 vssd1 vccd1 vssd1, \
	imem vccd1 vssd1 vccd1 vssd1, \
	dmem vccd1 vssd1 vccd1 vssd1"

### Macro Placement
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg

# set ::env(GLB_RT_OBS)  "
# li1	0	0	2920	3520,
# 						met1 1500 2450 2000 2950,
#                         met2 1500 2450 2000 2950,
#                         met3 1500 2450 2000 2950,
#                         met4 1500 2450 2000 2950,
# 						met1 500  300  1000 800,
#                         met2 500  300  1000 800,
#                         met3 500  300  1000 800,
#                         met4 500  300  1000 800"
set ::env(GLB_RT_OBS)  "li1  0    0   2920    3520,
						met1 1500 500  1979.78 897.5,
                        met2 1500 500  1979.78 897.5,
                        met3 1500 500  1979.78 897.5,
                        met4 1500 500  1979.78 897.5,
						met1 1200 2350 1679.78 2747.5,
                        met2 1200 2350 1679.78 2747.5,
                        met3 1200 2350 1679.78 2747.5,
                        met4 1200 2350 1679.78 2747.5"

set ::env(GLB_RT_ALLOW_CONGESTION) "1"

#Reduction in the routing capacity of the edges between the cells in the global routing graph. Values range from 0 to 1.
#1 = most reduction, 0 = least reduction 
set ::env(GLB_RT_ADJUSTMENT) 0.70

# per layer adjustment
# 0 -> 1: 1 means don't use the layer                                                        
# l2 is met1                                                                                 
set ::env(GLB_RT_L2_ADJUSTMENT) 0.6
set ::env(GLB_RT_L3_ADJUSTMENT) 0.5

# use 8 cores
set ::env(ROUTING_CORES) 8

# bail early on problems
set ::env(DRT_OPT_ITERS) 40

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/gl/warpv_core.v \
	$script_dir/../../verilog/gl/wb_interface.v \
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_sram_macros/verilog/sky130_sram_1kbyte_1rw1r_32x256_8.v"

set ::env(EXTRA_LEFS) "\
	$script_dir/../../lef/warpv_core.lef \
	$script_dir/../../lef/wb_interface.lef \
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_sram_macros/lef/sky130_sram_1kbyte_1rw1r_32x256_8.lef"

set ::env(EXTRA_GDS_FILES) "\
	$script_dir/../../gds/warpv_core.gds \
	$script_dir/../../gds/wb_interface.gds \
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_sram_macros/gds/sky130_sram_1kbyte_1rw1r_32x256_8.gds"

# set ::env(GLB_RT_MAXLAYER) 5
set ::env(RT_MAX_LAYER) {met4}

# set ::env(GLB_RT_ALLOW_CONGESTION) "1"

# #Reduction in the routing capacity of the edges between the cells in the global routing graph. Values range from 0 to 1.
# #1 = most reduction, 0 = least reduction 
# set ::env(GLB_RT_ADJUSTMENT) 0.70

# # per layer adjustment
# # 0 -> 1: 1 means don't use the layer                                                        
# # l2 is met1                                                                                 
# set ::env(GLB_RT_L2_ADJUSTMENT) 0.6
# set ::env(GLB_RT_L3_ADJUSTMENT) 0.5

# # use 8 cores
# set ::env(ROUTING_CORES) 8

# # bail early on problems
# set ::env(DRT_OPT_ITERS) 40

# disable pdn check nodes becuase it hangs with multiple power domains.
# any issue with pdn connections will be flagged with LVS so it is not a critical check.
set ::env(FP_PDN_CHECK_NODES) 0

# The following is because there are no std cells in the example wrapper project.
set ::env(SYNTH_TOP_LEVEL) 1
set ::env(PL_RANDOM_GLB_PLACEMENT) 1

set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 0
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

set ::env(FP_PDN_ENABLE_RAILS) 0

set ::env(DIODE_INSERTION_STRATEGY) 0
set ::env(FILL_INSERTION) 0
set ::env(TAP_DECAP_INSERTION) 0
set ::env(CLOCK_TREE_SYNTH) 0

set ::env(RUN_MAGIC_DRC) 0
# save some time
set ::env(RUN_KLAYOUT_XOR) 0
set ::env(RUN_KLAYOUT_DRC) 0
# no point in running DRC with magic once openram is in because it will find 3M issues
# try to turn off all DRC checking so the flow completes and use precheck for DRC instead.
set ::env(MAGIC_DRC_USE_GDS) 0
set ::env(RUN_MAGIC_DRC) 0
set ::env(QUIT_ON_MAGIC_DRC) 0
