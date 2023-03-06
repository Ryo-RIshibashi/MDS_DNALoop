Loop_decision<-function(file_name,chromosome,start,save){
    structure<-read.table(as.character(file_name),header = TRUE, sep = "")
    dist<-apply(apply(structure,2,diff),1,function(i){
        return(i[1]^2+i[2]^2)
    })
    
    #Smoothing
    Smooth<-10
    st_len<-length(structure[,1])
    dist_10<-c()
    for (j in 1:(st_len-Smooth-1)){
        dist_10<-c(dist_10,mean(dist[j:(j+Smooth)]))
    }
    
    first<-c()
    last<-c()
    for (i in 0:(Smooth/2-1)){
        first<-c(first,c(mean(dist[1:(Smooth-(5-i))])))
        last<-c(last,c(mean(dist[(st_len-((Smooth-i-1))):(st_len-1)])))
    }
    dist_10<-c(first,dist_10,last)
    
    # Plot of DNA Loop 
    len<-c(1:((st_len-1)))
    #plot(len,dist_10,type="o")
    #points(len,rep(2*mean(dist_10),(length(dist_10))),col=2)
    
    
    start=0
    DNA_Loop<-len[dist_10>=mean(dist_10)*2]
    count=0
    loop=c()
    
    # separate DNA Loops
    for (i in 1:(length(DNA_Loop)-1)){
        if ((DNA_Loop[i+1]-DNA_Loop[i])==1){
            count=count+1
            if (i==length(DNA_Loop)-1){
                loop=c(loop,list(DNA_Loop[(i-count+1):(i+1)]))}}
        else{
            loop=c(loop,list(DNA_Loop[(i-count):(i)]))
            count=0}}
    loop_front=list()
    loop_back=list()
    for (i in 1:length(loop)){
        loop_front[[i]]=min(loop[[i]])
        loop_back[[i]]=max(loop[[i]])
    }
    
    # determine the front loop root
    Loop_front=list()
    for (i in 1:length(loop_front)){
        j=0
        if (loop_front[[i]]==1){
            Loop_front[[i]]=c(1)
            next}
        while (dist_10[loop_front[[i]]-(j+1)]<dist_10[loop_front[[i]]-j]){
            j=j+1
            if ((loop_front[[i]]-(j+1))==0){
                break
            }}
        Loop_front[[i]]=c((loop_front[[i]]-(j)):(loop_front[[i]]))}
    
    # determine the back loop root
    Loop_back=list()
    for (i in 1:length(loop_back)){
        j=0
        if ((loop_back[[i]])==(length(len))){
            Loop_back[[i]]=c(length(len))
            break}
        while (dist_10[loop_back[[i]]+(j+1)]<dist_10[loop_back[[i]]+j]){
            j=j+1
            if ((loop_back[[i]]+(j))==(length(len))){
                Loop_back[[i]]=c(length(len))
                break}}
        Loop_back[[i]]=c((loop_back[[i]]+1):(loop_back[[i]]+(j)))}
    
    Loop<-list()
    for (i in 1:length(loop_back)){
        Loop[[i]]<-c(min(Loop_front[[i]]):max(Loop_back[[i]]))
    }
    
    # plot loop roots
    #for (i in Loop){
    #    points(i,dist_10[i],col=2)}
    
    
    Loop <- lapply(Loop, function(i){
        return(i+start)})
    if (start==0){
        All_loop<-c()
        All_loop<-c(All_loop,Loop)
    }else {
        All_loop<-c(All_loop,Loop)}
    All_loop
    
    All_Loop<-c()
    for (i in 1:length(All_loop)){
        All_Loop<-c(All_Loop,All_loop[[i]])
    }
    
    All_Loop<-unique(All_Loop)
    All_Loop<-All_Loop[-which(All_Loop %in% (DNA_Loop+start))]
    resolution=10000
    print(All_Loop*resolution)
    #save as .txt file
    if (save==1){
        File=paste("chr",as.character(chromosome),"-loop.txt",sep="")
        write(All_Loop,file=File)    
    }
}
