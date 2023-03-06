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
