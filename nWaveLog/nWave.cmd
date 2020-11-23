wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/eric/Documents/VLSI/Hw3/N26091530/build/top.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/cpu0/clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/cpu0/clk} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/cpu0/clk} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/if0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg"
wvGetSignalClose -win $_nWave1
wvSelectGroup -win $_nWave1 {G2}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/if0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0"
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/cpu0/clk} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/address_byte\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/w_b\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/cpu0/clk} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/address_byte\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/w_b\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetRadix -win $_nWave1 -format Bin
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectGroup -win $_nWave1 {G3}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/memwbreg0"
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/cpu0/clk} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/address_byte\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/w_b\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/memwbreg0/result_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/cpu0/clk} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/address_byte\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/w_b\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/memwbreg0/result_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetPosition -win $_nWave1 {("G3" 1)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/if0"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/cpu_wrapper0/cpu0/memwbreg0"
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/cpu0/clk} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/address_byte\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/w_b\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/memwbreg0/result_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/memwbreg0/result_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/cpu_wrapper0/cpu0/clk} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/data_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/if0/if_id_reg/pc_out\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/address_byte\[1:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/in\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/wbconverter0/w_b\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/cpu_wrapper0/cpu0/memwbreg0/result_out\[31:0\]} \
{/top_tb/TOP/cpu_wrapper0/cpu0/memwbreg0/result_in\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetPosition -win $_nWave1 {("G3" 2)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetRadix -win $_nWave1 -format Bin
