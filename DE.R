a=list.files(pattern=".cntTable")
mat=matrix(nrow=nrow(read.table(a[1],header=TRUE,row.names=1,sep="\t")))
for(i in a){
temp=read.table(i,header=TRUE,row.names=1,sep="\t")
mat=cbind(mat,temp)
}
mat=mat[,-1]
mat=mat[-which(rowSums(mat)==0),]
colnames(mat)=sapply(a,FUN=function(x){
paste(strsplit(strsplit(x,"[.]")[[1]][1],"_")[[1]],collapse="")
})
library(docker4seq)
path=getwd()
condition=c("TAZE","VALE")
control="DMSO"
dir.create(paste(path,"/DE",sep=""))
for(i in condition){
dir.create(paste(path,"/DE/",i,sep=""))
temp=mat[,c(grep(i,colnames(mat)),grep(control,colnames(mat)))]
colnames(temp)=c(paste(colnames(mat)[grep(i,colnames(mat))],"_COV1",sep=""),paste(colnames(mat)[grep(control,colnames(mat))],"_COV0",sep=""))
write.table(temp,paste(path,"/DE/",i,"/",i,"_",control,".txt",sep=""),col.names=NA,sep="\t")
pca(experiment.table=paste(path,"/DE/",i,"/",i,"_",control,".txt",sep=""), type=c("counts"),
                covariatesInNames=TRUE, samplesName=TRUE, principal.components=c(1,2),
                legend.position=c("bottomleft"), pdf = TRUE, output.folder=paste(path,"/DE/",i,sep=""))
wrapperDeseq2(paste(path,"/DE/",i,sep=""), group=c("docker"),paste(path,"/DE/",i,"/",i,"_",control,".txt",sep=""), log2fc=1, fdr=0.1, ref.covar="COV0", type=c("gene"), batch=FALSE)
setwd("./..")
}

