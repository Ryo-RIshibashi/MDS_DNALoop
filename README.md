# MDS_DNALoop
Multidimensional Scaling Methods Can Reconstruct Genomic DNA Loops Using Hi-C Data Properties.
The paper was published from PLoSONE.
Citation: Ishibashi R (2023) Multidimensional scaling methods can reconstruct genomic DNA loops using Hi-C data properties. PLoS ONE 18(8): e0289651. https://doi.org/10.1371/journal.pone.0289651

# Installation
You can install 'straw' for .hic file from GitHub with:
```
install.packages("devtools")
devtools::install_github(https://github.com/aidenlab/straw.git)
```

Also, you need to install 'biomaRt' for access the main database called 'Ensembl' from GitHub with:
```
install.packages("BiocManager")
library(BiocManager)

if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("biomaRt")
```
# How to use MDS-based method
Here is an example of analyzing GSE201353_LIMA_THP1_WT_LPIF_0090_S_0.0.0_megaMap_inter.hic from GEO.

In the MDS_structure() function, enter file_name,chromosome,start,end. start,end are coordinates divided by 10 kbp resolution. The following commands reproduce the structures of chromosome 8 from 0-500,000 kbp, 500,000 kbp-1,000,000 kbp, and 1,000,000 kbp-1,463,000 kbp.
```
MDS_structure("GSM6061774_LIMA_THP1_WT_LPIF_0090_S_5.1.0_inter.hic",8,0,5000)
MDS_structure("GSM6061774_LIMA_THP1_WT_LPIF_0090_S_5.1.0_inter.hic",8,5000,10000)
MDS_structure("GSM6061774_LIMA_THP1_WT_LPIF_0090_S_5.1.0_inter.hic",8,10000,14630)
```

In loop_decision(), enter file_name, chromosome, start, and save. filename is the file created by MDS_structure() and start is the coordinates of the resolution divided by 10kbp. If you want to save the file to create a loop file, enter "1".
```
Loop_decision("plot.chr8.0-5000.txt","8",0,0)
Loop_decision("plot.chr8.5000-10000.txt","8",5000,0)
Loop_decision("plot.chr8.10000-14630.txt","8",10000,1)
```

In the Gene_acquisition() function, enter file_name, where file_name is the file created by the Loop_decision() function, to acquire the genes contained in the loop region.
```
Gene_acquisition("chr8-loop.txt","8")
```
