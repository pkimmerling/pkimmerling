#Homework 1
#Data compares lead concentration in ppm to % mortality in midge flies
hwdata=HW_1_2
lead=hwdata$leadconc
mort=hwdata$mortality
#Model
fit=lm(mort~lead)
fit
summary(fit)
#Visualize the things
plot(lead,mort)
abline(lm(mort~lead))
#Homework 2
par(mfrow=c(1,2))
plot(fit$fitted, fit$res) #plot of predicted values vs residuals
abline(h=0)
qqnorm(fit$res)
qqline(fit$res)

library(stats)
shapiro.test(fit$res) #for normality of residuals
library(lmtest)
bptest(fit) #for constant variance of error
#boxcox transformation
library(MASS)
boxcox(mort ~ lead, data = hwdata,
       lambda = seq(-2.0, 2.0, length = 80))
y1 = sqrt(mort)
y2 = log(mort)
fit1=lm(y1~lead)
fit2=lm(y2~lead)
plot(lead,y1)
abline(fit1)
summary(fit1)
shapiro.test(fit1$res)
bptest(fit1)
dwtest(fit1)
plot(lead,y2)
abline(fit2)
summary(fit2)
shapiro.test(fit2$res)
bptest(fit2)
dwtest(fit2) #for autocorrelation