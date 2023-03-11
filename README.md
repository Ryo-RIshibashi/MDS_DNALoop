# MDS_DNALoop
Multidimensional Scaling Methods Can Reconstruct Genomic DNA Loops Using Hi-C Data Properties.

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
