#xinyuanyan
#venn diagram
library("VennDiagram")
library("venneuler")
#examples for xinyuan
#A <- c("C", "D", "B", "E")
#B <- c("C", "E", "B", "A")
#C <- c("C", "E", "X", "Y")


#venn.diagram(x=list(Tumor=A, Organoids=B, Primary=C), "My1.png", height = 450, 
 #            width = 450, resolution =300, imagetype="png", col="white", 
  #           fill=c(colors()[616], colors()[38], colors()[468]), alpha=c(0.6, 0.6, 0.6), lwd=c(1, 1, 1), 
   #          cex=0, cat.dist=c(-0.07, -0.07, -0.05), cat.pos=c(300, 60, 180), cat.cex=0.45)


setwd('~/Downloads')


#load data
labeldata <- read.csv("classlabel_figure.csv")

BP<-labeldata$x[1:49]
DP<-labeldata$x[50:147]
QP<-labeldata$x[148:199]
SZ<-labeldata$x[200:341]

#BP
bpcolor<-rgb(249,64,64, maxColorValue=255)
mddcolor<-rgb(173,7,227, maxColorValue=255)
qpcolor<-rgb(0,0,255, maxColorValue=255)
szcolor<-rgb(0,192,0, maxColorValue=255)
vd<-venneuler(c(BD=49,MDD=98,OCD=52,SZ=142,"BD&MDD"=6,"BD&OCD"=2,"BD&SZ"=30))

png("BP_venn.png",width = 1600,height = 1600,res = 300)
myfig<-plot(vd, col=c(bpcolor, mddcolor, qpcolor, szcolor))

print(myfig)
dev.off()


#DP
bpcolor<-rgb(249,64,64, maxColorValue=255)
mddcolor<-rgb(173,7,227, maxColorValue=255)
qpcolor<-rgb(0,0,255, maxColorValue=255)
szcolor<-rgb(0,192,0, maxColorValue=255)
vd<-venneuler(c(BD=49,MDD=98,OCD=52,SZ=142,"MDD&BD"=4,"MDD&OCD"=3,"MDD&SZ"=37))

png("DP_venn.png",width = 1600,height = 1600,res = 300)
myfig<-plot(vd, col=c(bpcolor, mddcolor, qpcolor, szcolor))

print(myfig)
dev.off()


#OCD
bpcolor<-rgb(249,64,64, maxColorValue=255)
mddcolor<-rgb(173,7,227, maxColorValue=255)
qpcolor<-rgb(0,0,255, maxColorValue=255)
szcolor<-rgb(0,192,0, maxColorValue=255)
vd<-venneuler(c(BD=49,MDD=98,OCD=52,SZ=142,"OCD&BD"=0,"OCD&MDD"=5,"OCD&SZ"=35))

png("QP_venn.png",width = 1600,height = 1600,res = 300)
myfig<-plot(vd, col=c(bpcolor, mddcolor, qpcolor, szcolor))

print(myfig)
dev.off()

#SZ
bpcolor<-rgb(249,64,64, maxColorValue=255)
mddcolor<-rgb(173,7,227, maxColorValue=255)
qpcolor<-rgb(0,0,255, maxColorValue=255)
szcolor<-rgb(0,192,0, maxColorValue=255)
vd<-venneuler(c(BD=49,MDD=98,OCD=52,SZ=142,"SZ&BD"=3,"SZ&MDD"=15,"SZ&OCD"=2))

png("SZ_venn.png",width = 1600,height = 1600,res = 300)
myfig<-plot(vd, col=c(bpcolor, mddcolor, qpcolor, szcolor))

print(myfig)
dev.off()

