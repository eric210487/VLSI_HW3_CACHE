wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/eric/Documents/VLSI/Hw3/N26091530/build/top.fsdb}
wvResizeWindow -win $_nWave1 961 31 958 1008
wvResizeWindow -win $_nWave1 0 23 1920 1017
wvResizeWindow -win $_nWave1 2280 74 1279 680
wvResizeWindow -win $_nWave1 1920 23 1680 987
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/data_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_in\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_out\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_read} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_write\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_in\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_out\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_read} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_write\[15:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/index\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_in\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_out\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_read} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_write\[15:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/index\[5:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/next_state\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 22793.258400 -snap {("G1" 2)}
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 28239.311040 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 24785.301205 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 23061.803406 -snap {("G2" 0)}
wvSelectGroup -win $_nWave1 {G2}
wvSetCursor -win $_nWave1 23713.125248 -snap {("G1" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 31436.299254 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 32027.499081 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 31095.607828 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 31967.377064 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 32047.539753 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 31175.770517 -snap {("G1" 5)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_in\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_out\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_read} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_write\[15:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/index\[5:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/next_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 22851.376348 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 25045.829942 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 27099.998831 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 29174.208392 -snap {("G1" 8)}
wvRestoreSignal -win $_nWave1 "/home/eric/Documents/VLSI/Hw3/N26091530/signal.rc" \
           -overWriteAutoAlias on
wvResizeWindow -win $_nWave1 1910 72 1920 1052
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetCursor -win $_nWave1 8075.170105 -snap {("G6" 0)}
wvResizeWindow -win $_nWave1 2410 76 1279 680
wvResizeWindow -win $_nWave1 1920 23 1680 987
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetCursor -win $_nWave1 52950.873965
wvSetCursor -win $_nWave1 53006.957823
wvSetCursor -win $_nWave1 52992.936859
wvSetCursor -win $_nWave1 53049.020717
wvSetCursor -win $_nWave1 52992.936859
wvSetCursor -win $_nWave1 56442.094157 -snap {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetCursor -win $_nWave1 55698.983032 -snap {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectGroup -win $_nWave1 {G6}
wvSelectGroup -win $_nWave1 {G6}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/if0/pc_reg"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/if0/pc_mux"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/if0/pc_adder"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/if0"
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/cpu_wrapper0/cpu0/id0/hazard_detector0"
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/cpu_wrapper0/cpu0/id0/idmux4inputs0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0"
wvSetPosition -win $_nWave1 {("G6" 1)}
wvSetPosition -win $_nWave1 {("G6" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_in\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_out\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_read} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_write\[15:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/index\[5:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/next_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr_reg\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSetPosition -win $_nWave1 {("G6" 1)}
wvSetPosition -win $_nWave1 {("G6" 1)}
wvSetPosition -win $_nWave1 {("G6" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_in\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_out\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_read} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_write\[15:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/index\[5:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/next_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr_reg\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSetPosition -win $_nWave1 {("G6" 1)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvExpandBus -win $_nWave1 {("G6" 1)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 8 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 3 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 4 )} 
wvSelectGroup -win $_nWave1 {I_CACHE_WRAPPER}
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 6 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 4 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 3 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 4 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 3 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 3 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSetCursor -win $_nWave1 22129.989520 -snap {("I_CACHE_CPU" 1)}
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 3 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 3 )} 
wvSetCursor -win $_nWave1 22887.121610 -snap {("I_CACHE_CPU" 4)}
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 4 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 8 )} 
wvSetPosition -win $_nWave1 {("I_CACHE_CPU" 8)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvSetPosition -win $_nWave1 {("I_CACHE_CPU" 9)}
wvSetPosition -win $_nWave1 {("I_CACHE_CPU" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_in\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_out\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_read} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_write\[15:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/index\[5:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/next_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr_reg\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_wait} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[30\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[29\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[28\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[27\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[26\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[25\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[24\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[23\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[22\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[21\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[20\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[19\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[18\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[17\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[16\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[15\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[14\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[13\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[12\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[11\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[10\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[9\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[8\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[7\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[6\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[5\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[4\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[3\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[2\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[1\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 9 )} 
wvSetPosition -win $_nWave1 {("I_CACHE_CPU" 9)}
wvSetPosition -win $_nWave1 {("I_CACHE_CPU" 9)}
wvSetPosition -win $_nWave1 {("I_CACHE_CPU" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_in\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_out\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_read} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_write\[15:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/index\[5:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/next_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr_reg\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_wait} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[30\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[29\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[28\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[27\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[26\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[25\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[24\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[23\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[22\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[21\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[20\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[19\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[18\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[17\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[16\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[15\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[14\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[13\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[12\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[11\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[10\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[9\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[8\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[7\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[6\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[5\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[4\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[3\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[2\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[1\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 9 )} 
wvSetPosition -win $_nWave1 {("I_CACHE_CPU" 9)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 22943.205468
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 3 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("I_CACHE_WRAPPER" 0)}
wvSetPosition -win $_nWave1 {("I_CACHE_CPU" 8)}
wvSetCursor -win $_nWave1 17278.735759 -snap {("I_CACHE_CPU" 7)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvUnknownSaveResult -win $_nWave1 -clear
wvSelectGroup -win $_nWave1 {G6}
wvSelectSignal -win $_nWave1 {( "I_CACHE_WRAPPER" 4 )} 
wvSetCursor -win $_nWave1 14250.207399 -snap {("I_CACHE_WRAPPER" 0)}
wvSetCursor -win $_nWave1 14488.563797 -snap {("I_CACHE_WRAPPER" 1)}
wvSetCursor -win $_nWave1 13198.635052 -snap {("I_CACHE_WRAPPER" 2)}
wvSetCursor -win $_nWave1 12820.069007
wvSetCursor -win $_nWave1 12960.278653
wvSetCursor -win $_nWave1 13002.341547
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 3 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 3 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetCursor -win $_nWave1 23111.457044
wvSetCursor -win $_nWave1 22985.268362
wvSetCursor -win $_nWave1 14768.983090 -snap {("G2" 1)}
wvSaveSignal -win $_nWave1 "/home/eric/Documents/VLSI/Hw3/N26091530/signal.rc"
wvSetCursor -win $_nWave1 18568.664504 -snap {("I_CACHE_WRAPPER" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G7" 0)}
wvSetPosition -win $_nWave1 {("I_CACHE_CPU" 8)}
wvSaveSignal -win $_nWave1 "/home/eric/Documents/VLSI/Hw3/N26091530/signal.rc"
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 8 )} 
wvSetCursor -win $_nWave1 22955.123289
wvSetCursor -win $_nWave1 504.754727
wvSetCursor -win $_nWave1 673.006302
wvSetCursor -win $_nWave1 715.069196
wvSetCursor -win $_nWave1 1990.976977
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSetCursor -win $_nWave1 22981.763121
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetPosition -win $_nWave1 {("G3" 2)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_oe} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_wait} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvSetPosition -win $_nWave1 {("G3" 3)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 3 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 3 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 3 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 2 )} 
wvSetCursor -win $_nWave1 14784.406152 -snap {("G7" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSaveSignal -win $_nWave1 "/home/eric/Documents/VLSI/Hw3/N26091530/signal.rc"
wvSetCursor -win $_nWave1 6043.035755 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 22927.782408
wvSetCursor -win $_nWave1 22997.887231
wvSetCursor -win $_nWave1 22983.866266
wvSetCursor -win $_nWave1 22899.740478
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetCursor -win $_nWave1 53949.166646
wvSetCursor -win $_nWave1 55946.453058
wvSetCursor -win $_nWave1 58021.555823
wvSetCursor -win $_nWave1 259003.671182
wvSelectGroup -win $_nWave1 {G6}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0"
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/Unnamed_\$registers_sv_21"
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 260910.522372
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetCursor -win $_nWave1 290555.047884
wvSetCursor -win $_nWave1 290442.880167
wvSetCursor -win $_nWave1 289994.209299
wvSetCursor -win $_nWave1 290008.230264
wvSetCursor -win $_nWave1 290008.230264
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvSetCursor -win $_nWave1 290863.509106
wvSetCursor -win $_nWave1 291494.452514
wvSetCursor -win $_nWave1 292111.374958
wvSetCursor -win $_nWave1 292237.563640
wvSetCursor -win $_nWave1 292616.129685
wvSetCursor -win $_nWave1 292924.590906
wvSelectSignal -win $_nWave1 {( "I_CACHE_WRAPPER" 1 )} 
wvSetCursor -win $_nWave1 314931.896986
wvSetCursor -win $_nWave1 316740.601423 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 315955.427404 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 316474.203095 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 317002.092413
wvSetCursor -win $_nWave1 317955.518008
wvSetCursor -win $_nWave1 318165.832477
wvSetCursor -win $_nWave1 318698.629133
wvSetCursor -win $_nWave1 319035.132284
wvSetCursor -win $_nWave1 318979.048426
wvSetCursor -win $_nWave1 339940.390544
wvSetCursor -win $_nWave1 471030.100380
wvSetCursor -win $_nWave1 548930.579852
wvSetCursor -win $_nWave1 549014.705639
wvSetCursor -win $_nWave1 549084.810462 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 549028.726604
wvSetCursor -win $_nWave1 549042.747569
wvSelectGroup -win $_nWave1 {G7}
wvSetCursor -win $_nWave1 398477.216817 -snap {("G7" 0)}
wvSetCursor -win $_nWave1 549000.000000
wvSetCursor -win $_nWave1 549000.000000
wvSetCursor -win $_nWave1 314971.856735
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0"
wvSetPosition -win $_nWave1 {("G6" 1)}
wvSetPosition -win $_nWave1 {("G6" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_oe} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_wait} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSetPosition -win $_nWave1 {("G6" 1)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvExpandBus -win $_nWave1 {("G6" 1)}
wvSetCursor -win $_nWave1 320493.312605 -snap {("G6" 23)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G6" 2 )} 
wvSelectSignal -win $_nWave1 {( "G6" 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           19 20 21 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G6" 13)}
wvSelectSignal -win $_nWave1 {( "G6" 3 )} 
wvSelectSignal -win $_nWave1 {( "G6" 2 )} 
wvSelectSignal -win $_nWave1 {( "G6" 3 )} 
wvSelectSignal -win $_nWave1 {( "G6" 2 )} 
wvSetCursor -win $_nWave1 55106131.015593 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 55107925.699065 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 55106074.931735 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 55107869.615207 -snap {("G2" 2)}
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 8 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G7" 0)}
wvSetPosition -win $_nWave1 {("G6" 13)}
wvSetCursor -win $_nWave1 314968.476827
wvSetCursor -win $_nWave1 315052.602615
wvSelectSignal -win $_nWave1 {( "G6" 3 )} 
wvSelectSignal -win $_nWave1 {( "G6" 2 )} 
wvSelectSignal -win $_nWave1 {( "G6" 5 )} 
wvSelectSignal -win $_nWave1 {( "G6" 2 )} 
wvSelectSignal -win $_nWave1 {( "G6" 3 )} 
wvSetCursor -win $_nWave1 340019.734327
wvSetCursor -win $_nWave1 403977.065525
wvSetCursor -win $_nWave1 530969.148448
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetCursor -win $_nWave1 526956.348371
wvSetCursor -win $_nWave1 526956.348371
wvSetCursor -win $_nWave1 530980.365219
wvSetCursor -win $_nWave1 532985.363161
wvSetCursor -win $_nWave1 534078.998402
wvSetCursor -win $_nWave1 532915.258338
wvSetCursor -win $_nWave1 533153.614737
wvSetCursor -win $_nWave1 535018.403032
wvSetCursor -win $_nWave1 535032.423997
wvSetCursor -win $_nWave1 534906.235315
wvSetCursor -win $_nWave1 536069.975379
wvSetCursor -win $_nWave1 541061.438787
wvSetCursor -win $_nWave1 540963.292034
wvSetCursor -win $_nWave1 541019.375893
wvSetCursor -win $_nWave1 541005.354928
wvSetCursor -win $_nWave1 543353.165455
wvSetCursor -win $_nWave1 543353.165455
wvSetCursor -win $_nWave1 543353.165455
wvSetCursor -win $_nWave1 543493.375101
wvSetCursor -win $_nWave1 543437.291243 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 545007.639281
wvSelectGroup -win $_nWave1 {G7}
wvSetPosition -win $_nWave1 {("G7" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0"
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_oe} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[11\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[10\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[9\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[8\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[7\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[6\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[5\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[4\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[3\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[2\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[1\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/branch} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/branch} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/func3\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/pcsrc} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r1_data\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r2_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_oe} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[11\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[10\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[9\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[8\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[7\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[6\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[5\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[4\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[3\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[2\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[1\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/branch} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/branch} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/func3\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/pcsrc} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r1_data\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r2_data\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G7" 6)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 0)}
wvSetPosition -win $_nWave1 {("G7" 5)}
wvSelectSignal -win $_nWave1 {( "G7" 2 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvSelectSignal -win $_nWave1 {( "G7" 2 )} 
wvSelectSignal -win $_nWave1 {( "G7" 3 )} 
wvSelectSignal -win $_nWave1 {( "G7" 2 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvSelectSignal -win $_nWave1 {( "G7" 3 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 3 )} 
wvSelectSignal -win $_nWave1 {( "G7" 2 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSelectSignal -win $_nWave1 {( "G6" 3 )} 
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSelectSignal -win $_nWave1 {( "G6" 2 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0"
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/idexreg0"
wvGetSignalSetScope -win $_nWave1 \
           "/top_tb/TOP/cpu_wrapper0/cpu0/id0/hazard_detector0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/idexreg0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/control0"
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_oe} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[11\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[10\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[9\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[8\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[7\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[6\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[5\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[4\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[3\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[2\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[1\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[0\]\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/branch} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/func3\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/pcsrc} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r1_data\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r2_data\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/control0/branch} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 6 )} 
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetCursor -win $_nWave1 541485.572967 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 540980.818240
wvSetCursor -win $_nWave1 544976.793159 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 544934.730265
wvSetCursor -win $_nWave1 543995.325635
wvSetCursor -win $_nWave1 543939.241777
wvSetCursor -win $_nWave1 543981.304671
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c/DA"
wvSetPosition -win $_nWave1 {("G7" 7)}
wvSetPosition -win $_nWave1 {("G7" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_oe} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[11\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[10\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[9\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[8\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[7\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[6\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[5\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[4\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[3\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[2\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[1\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[0\]\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "G6"
wvAddSignal -win $_nWave1 -group {"G7" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/branch} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/func3\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/pcsrc} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r1_data\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r2_data\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/control0/branch} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA/DO\[127:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 7 )} 
wvSetPosition -win $_nWave1 {("G7" 7)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 2047957.697666 -snap {("G2" 2)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/data_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c/DA"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c/DA"
wvSetPosition -win $_nWave1 {("G7" 7)}
wvSetPosition -win $_nWave1 {("G7" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_oe} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[11\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[10\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[9\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[8\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[7\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[6\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[5\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[4\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[3\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[2\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[1\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[0\]\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "G6"
wvAddSignal -win $_nWave1 -group {"G7" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/branch} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/func3\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/pcsrc} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r1_data\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r2_data\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/control0/branch} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA/DO\[127:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSetPosition -win $_nWave1 {("G7" 7)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 2047775.425126 -snap {("G2" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/data_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c/DA"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c/DA"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvSetPosition -win $_nWave1 {("G7" 8)}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_oe} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[11\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[10\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[9\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[8\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[7\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[6\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[5\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[4\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[3\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[2\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[1\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[0\]\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "G6"
wvAddSignal -win $_nWave1 -group {"G7" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/branch} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/func3\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/pcsrc} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r1_data\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r2_data\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/control0/branch} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA/DO\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_write\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 8 )} 
wvSetPosition -win $_nWave1 {("G7" 8)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 2164096.151870 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 2162539.824796 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 2162960.453735 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 2161922.902353 -snap {("I_CACHE_CPU" 1)}
wvSetCursor -win $_nWave1 2160731.120359 -snap {("I_CACHE_CPU" 2)}
wvSetCursor -win $_nWave1 2162091.153928 -snap {("I_CACHE_CPU" 2)}
wvSetCursor -win $_nWave1 2162301.468398 -snap {("I_CACHE_CPU" 2)}
wvSetCursor -win $_nWave1 2158964.478816 -snap {("G7" 7)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/data_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c/DA"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c/DA"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c/DA"
wvSetPosition -win $_nWave1 {("G7" 9)}
wvSetPosition -win $_nWave1 {("G7" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_oe} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[11\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[10\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[9\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[8\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[7\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[6\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[5\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[4\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[3\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[2\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[1\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[0\]\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "G6"
wvAddSignal -win $_nWave1 -group {"G7" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/branch} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/func3\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/pcsrc} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r1_data\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r2_data\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/control0/branch} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA/DO\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_write\[15:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA/A\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 9 )} 
wvSetPosition -win $_nWave1 {("G7" 9)}
wvSetPosition -win $_nWave1 {("G7" 9)}
wvSetPosition -win $_nWave1 {("G7" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_oe} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[11\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[10\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[9\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[8\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[7\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[6\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[5\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[4\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[3\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[2\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[1\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[0\]\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "G6"
wvAddSignal -win $_nWave1 -group {"G7" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/branch} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/func3\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/pcsrc} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r1_data\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0/r2_data\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/control0/branch} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA/DO\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_write\[15:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA/A\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 9 )} 
wvSetPosition -win $_nWave1 {("G7" 9)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "G7" 9 )} 
wvSelectSignal -win $_nWave1 {( "G7" 7 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 3 )} 
wvSelectSignal -win $_nWave1 {( "G7" 6 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 0)}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 0)}
wvSetPosition -win $_nWave1 {("G7" 7)}
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 0)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSelectSignal -win $_nWave1 {( "G7" 3 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 0)}
wvSetPosition -win $_nWave1 {("G7" 5)}
wvSelectSignal -win $_nWave1 {( "G7" 2 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 0)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 0)}
wvSetPosition -win $_nWave1 {("G7" 3)}
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvSetCursor -win $_nWave1 2154379.623383
wvSetCursor -win $_nWave1 2154505.812065
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvSelectSignal -win $_nWave1 {( "G7" 2 )} 
wvSelectSignal -win $_nWave1 {( "G7" 3 )} 
wvSelectSignal -win $_nWave1 {( "G7" 2 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/comparison0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/data_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c/DA"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c/DA"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/inst_c"
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/i_do\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_oe} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_CPU" \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/curr_state\[3:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/count_wire\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/core_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/i_stall} \
}
wvAddSignal -win $_nWave1 -group {"I_CACHE_WRAPPER" \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_addr\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_type\[2:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_req} \
{/top_tb/TOP/cpu_wrapper0/inst_c/I_wait} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[11\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[10\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[9\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[8\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[7\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[6\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[5\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[4\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[3\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[2\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[1\]\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/id0/registers0/reg_\[0\]\[31:0\]} \
}
wvCollapseGroup -win $_nWave1 "G6"
wvAddSignal -win $_nWave1 -group {"G7" \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA/DO\[127:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_write\[15:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA/A\[5:0\]} \
{/top_tb/TOP/cpu_wrapper0/inst_c/DA_read} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetCursor -win $_nWave1 2161456.004230
wvSetCursor -win $_nWave1 2162549.639471
wvSetCursor -win $_nWave1 2162437.471754
wvSetCursor -win $_nWave1 2161343.836513
wvSetCursor -win $_nWave1 2161343.836513
wvSetCursor -win $_nWave1 2161484.046160
wvSetCursor -win $_nWave1 2160474.536707
wvSetCursor -win $_nWave1 2160530.620565
wvSetCursor -win $_nWave1 2160474.536707
wvSetCursor -win $_nWave1 2162353.345967
wvSelectSignal -win $_nWave1 {( "I_CACHE_CPU" 1 )} 
wvSetCursor -win $_nWave1 2162465.513684
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 2164260.197156 -snap {("G7" 1)}
wvSetCursor -win $_nWave1 2164204.113297 -snap {("I_CACHE_CPU" 1)}
wvSetCursor -win $_nWave1 2164105.966545 -snap {("I_CACHE_CPU" 2)}
wvSetCursor -win $_nWave1 2164105.966545 -snap {("I_CACHE_CPU" 1)}
wvSetCursor -win $_nWave1 2163040.373233 -snap {("I_CACHE_CPU" 1)}
wvSetCursor -win $_nWave1 2162844.079729 -snap {("I_CACHE_CPU" 3)}
wvSetCursor -win $_nWave1 2162872.121658 -snap {("I_CACHE_CPU" 2)}
wvSetCursor -win $_nWave1 2162914.184552 -snap {("I_CACHE_CPU" 1)}
wvSetCursor -win $_nWave1 2162942.226481 -snap {("I_CACHE_CPU" 3)}
wvSetCursor -win $_nWave1 2162956.247446 -snap {("I_CACHE_CPU" 2)}
wvSetCursor -win $_nWave1 2162816.037799 -snap {("I_CACHE_CPU" 1)}
wvSetCursor -win $_nWave1 2163923.694005 -snap {("I_CACHE_CPU" 3)}
wvSetCursor -win $_nWave1 2163923.694005 -snap {("I_CACHE_CPU" 2)}
wvSetCursor -win $_nWave1 2164007.819793 -snap {("I_CACHE_CPU" 1)}
wvSetCursor -win $_nWave1 2163993.798828 -snap {("I_CACHE_CPU" 3)}
wvSetCursor -win $_nWave1 2163993.798828 -snap {("I_CACHE_CPU" 2)}
wvSetCursor -win $_nWave1 2164091.945580 -snap {("I_CACHE_CPU" 1)}
wvSetCursor -win $_nWave1 2165059.392140 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 2164877.119600 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 2164877.119600 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 2164877.119600 -snap {("G2" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetCursor -win $_nWave1 2164063.903651 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 2164077.924616 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 2164035.861722 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 2163895.652076 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 2163881.631111 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 2163895.652076 -snap {("G3" 1)}
wvSelectGroup -win $_nWave1 {G2}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvRenameGroup -win $_nWave1 {G2} {ID}
wvSelectGroup -win $_nWave1 {G3}
wvRenameGroup -win $_nWave1 {G3} {IF}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
