mydata = na.omit(BooksData)
y = mydata$pages
x1 = mydata$weight
x2 = mydata$width
x3 = mydata$depth
x4 = mydata$height
x5 = mydata$acqdate
x6 = x2*x3*x4 #volume
#dum1=ifelse(mydata$binding=="paper",1,0)
#First look at whether or not the binding separates the data from project 1
fit1 = lm(y~x1)
summary(fit1)
plot(x1,y,pch=ifelse(dum1==1,1,4))
abline(fit1)
legend("bottom","paperback",pch=1)
legend("bottomright","hardback",pch=4)
fit2 =lm(y~x2)
plot(x2,y,pch=ifelse(dum1==1,1,4))
abline(fit2)
legend("bottom"2,"paperback",pch=1)
legend("bottomright","hardback",pch=4)
DT = cbind(x1,x2,x3,x4,x5,y)
pairs(DT)
#General linear model
fit3 = lm(y~x1+x2+x3+x4+x5)
summary(fit3)
anova(fit3)
par(mfrow=c(1,2))
#plot of residual vs predicted
plot(fit3$fitted, fit3$residuals)
abline(h=0)
# Normal probability plot of Residuals
qqnorm(fit3$residuals)
qqline(fit3$residuals)
hist(fit3$res)
#test for normality
shapiro.test(fit3$residuals)
#breusch pagan test test for non-constant variance
library(lmtest)
bptest(fit3)
#durbin-watson test for autocorrelation
dwtest(fit3)
cor(DT)
#Try ridge first
library(MASS)
myridge = lm.ridge(y~x1+x2+x3+x4+x5, data=data.frame(cbind(x1,x2,x3,x4,x5)), lambda = seq(0, 0.1, 0.0001))
plot(myridge)
select(myridge)
myridge1 = lm.ridge(y~x1+x2+x3+x4+x5, data=data.frame(cbind(x1,x2,x3,x4,x5)), lambda = 0.2 )
#Use LASSO for model selection, compare against leaps
library(glmnet)
x=as.matrix(cbind(x1,x2,x3,x4,x5,x6))
dim(x)
# (For plots on left):
fit.lasso <- glmnet(x, y, family="gaussian", alpha=1)
fit.ridge <- glmnet(x, y, family="gaussian", alpha=0)
# For plotting options, type '?plot.glmnet' in R console
plot(fit.lasso, xvar="lambda")
plot(fit.ridge,xvar="lambda")
#Additional Model Selection
library(leaps)
library(MASS)
step=stepAIC(fit3,direction="both")
leaps=regsubsets(y~x1+x2+x3+x4+x5, data=mydata,nbest=10)
summary(leaps)
library(car)
plot(leaps,scale="r2")
leaps
smallfit1 =lm(y~x2+x3+x4)
summary(smallfit1)
smallfit2 =lm(y~x2+x3)
summary(smallfit2)
library(car) #load the package car
vif(smallfit2) #variance inflation factors
avPlots(smallfit2) #added variable plots
In=influence(smallfit2)
