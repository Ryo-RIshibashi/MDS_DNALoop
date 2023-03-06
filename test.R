MDS_structure("GSM6061774_LIMA_THP1_WT_LPIF_0090_S_5.1.0_inter.hic",8,0,5000)
MDS_structure("GSM6061774_LIMA_THP1_WT_LPIF_0090_S_5.1.0_inter.hic",8,5000,10000)
MDS_structure("GSM6061774_LIMA_THP1_WT_LPIF_0090_S_5.1.0_inter.hic",8,10000,14630)


Loop_decision("plot.chr8.0-5000.txt","8",0,0)
Loop_decision("plot.chr8.5000-10000.txt","8",5000,0)
Loop_decision("plot.chr8.10000-14630.txt","8",10000,1)

Gene_acquisition("chr8-loop.txt","8")