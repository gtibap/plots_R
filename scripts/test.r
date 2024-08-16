library(ROCit)

sayHello <- function(){
   print('hello')
}


sayHello()

# ---------------------
labels <- c(0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1)
VAC <- c(9.6,12,19,14,18,12,17,15,12,13,12,8.2,8.3,11,5.9,4.2,4.3,5.8,5.7)
BCR <- c(2.3,2.6,NA,3.8,3.5,3.1,4.8,NA,2.7,1.6,0,2.1,0,3.9,0,1.7,1.1,1.9,2.7)
PST <- c(-4,-1,-5,-5,-3,-3,-3,-5,-6,-1,-7,-9,-9,-7,-10,-15,-8,-11,-18)

# default method empirical
roc_vac <- rocit(score = VAC, class = labels, negref = 1) 
roc_bcr <- rocit(score = BCR, class = labels, negref = 1) 
roc_pst <- rocit(score = PST, class = labels, negref = 1) 


png(file = "roc_empirical.png")  # create PNG device
plot(roc_vac, col=c("blue", "red"), lwd=c(2,1), YIndex = FALSE, cex.lab=1)
lines(roc_bcr$FPR,roc_bcr$TPR, col = "orange", lwd=2 )
lines(roc_pst$FPR,roc_pst$TPR, col = "green", lwd=2 )
title(main="ROC curve") #, cex.main=2, cex.lab=2
legend("bottomright", legend=c("Max VAC (uV)", "Delta BCR (uV)","Perceptual Sensory Threshold (mA)", "Reference Line"), col=c("blue","orange","green","red"),lty=c(1,1,1,2), lwd=c(2,2,2,1), cex=1.0)
dev.off()


# binormal method
roc_vac <- rocit(score = VAC, class = labels, negref = 1, method = "binormal") 
roc_bcr <- rocit(score = BCR, class = labels, negref = 1, method = "binormal") 
roc_pst <- rocit(score = PST, class = labels, negref = 1, method = "binormal") 

png(file = "roc_binormal.png")  # create PNG device
plot(roc_vac, col=c("blue", "red"), lwd=c(2,1), YIndex = FALSE, cex.lab=1)
lines(roc_bcr$FPR,roc_bcr$TPR, col = "orange", lwd=2 )
lines(roc_pst$FPR,roc_pst$TPR, col = "green", lwd=2 )
title(main="ROC curve") #, cex.main=2, cex.lab=2
legend("bottomright", legend=c("Max VAC (uV)", "Delta BCR (uV)","Perceptual Sensory Threshold (mA)", "Reference Line"), col=c("blue","orange","green","red"),lty=c(1,1,1,2), lwd=c(2,2,2,1), cex=1.0)
dev.off()


# binormal method
roc_vac <- rocit(score = VAC, class = labels, negref = 1, method = "nonparametric") 
roc_bcr <- rocit(score = BCR, class = labels, negref = 1, method = "nonparametric") 
roc_pst <- rocit(score = PST, class = labels, negref = 1, method = "nonparametric") 

png(file = "roc_nonparametric.png")  # create PNG device
plot(roc_vac, col=c("blue", "red"), lwd=c(2,1), YIndex = FALSE, cex.lab=1)
lines(roc_bcr$FPR,roc_bcr$TPR, col = "orange", lwd=2 )
lines(roc_pst$FPR,roc_pst$TPR, col = "green", lwd=2 )
title(main="ROC curve") #, cex.main=2, cex.lab=2
legend("bottomright", legend=c("Max VAC (uV)", "Delta BCR (uV)","Perceptual Sensory Threshold (mA)", "Reference Line"), col=c("blue","orange","green","red"),lty=c(1,1,1,2), lwd=c(2,2,2,1), cex=1.0)
dev.off()

