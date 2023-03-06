require(biomaRt)
ensembl = useEnsembl(biomart='ensembl', dataset="hsapiens_gene_ensembl", mirror = "asia")

Gene_acquisition<-function(Loop_file_name,chromosome){
        loop<-scan(Loop_file_name)
        count=0
        Loop=c()
        for (i in 1:(length(loop)-1)){
            if ((loop[i+1]-loop[i])==1){
                count=count+1
                if (i==length(loop)-1){
                    Loop=c(Loop,list(loop[(i-count+1):(i+1)]))}}
            else{
                Loop=c(Loop,list(loop[(i-count):(i)]))
                count=0}}
        l=chromosome
        genelist<-c()
        for (i in 1:length(Loop)){
            genelist<-c(genelist,getBM(attributes=c('hgnc_symbol','entrezgene_id','chromosome_name','start_position','end_position'),filters = c('chromosome_name','start','end'), values=list(l,(min(Loop[[i]]))*10000,(max(Loop[[i]]))*10000), mart = ensembl)[,1])}
        genelist<-genelist[genelist!=""]
        genelist<-genelist[!is.na(genelist)]
        
        #txt<-paste("genelist",chromosome,".txt",sep="")
        print(genelist)
        #write(genelist,file=txt)
}