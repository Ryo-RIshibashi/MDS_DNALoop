MDS_structure<-function(file_name,chromosome,start,end){
        # import .hic data
        data<-strawr::straw("KR",as.character(file_name),as.character(chromosome),as.character(chromosome), "BP", 10000)
        data[,1]=data[,1]/10000
        data[,2]=data[,2]/10000
        
        # set data length
        start<-start
        end<-end
        data<-data[data[,1]>=start & data[,1]<=end,]
        data<-data[data[,2]>=start & data[,2]<=end,]
        data[,3][is.na(data[,3])] <- 0
        size<-end-start+1
        
        # hic matrix
        hic=matrix(0,size,size)
        zahyo<-cbind(data[,1]-start+1,data[,2]-start+1)
        hic[zahyo]<-data[,3]
        hic[lower.tri(hic)]<-0
        
        # equation(1)
        for (j in 0:(length(hic[,1])-1)){
            for (i in 1:(length(hic[,1])-j)){
                if (j>5){
                    hic[i,i+j]=hic[i,i+j]*log(j)}
            }
        }
        
        # preparation of reciprocal
        hic_reciprocal<-hic+t(hic)
        diag(hic_reciprocal) <- diag(hic_reciprocal)/2
        hic_reciprocal=hic_reciprocal+1
        hic_reciprocal<-1/hic_reciprocal
        diag(hic_reciprocal)<-0
        
        # MDS
        SVD<-svd(hic_reciprocal)
        
        #plot vector v2 and v3
        plot(SVD$u[,2:3],type="o")
        
        # as dataframe
        mat<-matrix(c(SVD$u[,2],SVD$u[,3],SVD$u[,4]),ncol = 3)
        colnames(mat) <- c("v2","v3","v4")
        data<-data.frame(mat)
        
        # save v2 and v3, v4 as .txt file
        File_name<-paste("plot.chr",as.character(chromosome),".",as.character(start),"-",as.character(end),".txt",sep="")
        write.table(data,file=File_name,row.names = FALSE)}