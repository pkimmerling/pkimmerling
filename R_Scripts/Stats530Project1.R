bookdata=BooksData[sample(nrow(BooksData), 50), ]
bookdata
y1=bookdata$width
y2=bookdata$weight
#y3=bookdata$pagedensity
x=bookdata$pages
#plot(x,y3)
#plot(BooksData$pages,BooksData$pagedensity)
fit1=lm(y1~x,data=bookdata)
fit1
fit2=lm(y2~x,data=bookdata)
fit2
par(mfrow=c(1,2))
plot(bookdata$pages,bookdata$width)
abline(fit1)
plot(bookdata$pages,bookdata$weight)
abline(fit2)

summary(fit1)
coefficients(fit1)

summary(fit2)
coefficients(fit2)

plot(x, fit1$res) #plot of x vs residules
abline(h=0) #abline gives the 0 lines plotted in both graphs
plot(x, fit2$res) #plot of x vs residules
abline(h=0) #abline gives the 0 lines plotted in both graphs

plot(fit1$fitted, fit1$res) #plot of predicted values vs residules
abline(h=0)
plot(fit2$fitted, fit2$res) #plot of predicted values vs residules
abline(h=0)

qqnorm(fit1$res)
qqline(fit1$res)

qqnorm(fit2$res)
qqline(fit2$res)

hist(fit1$res)
hist(fit2$res)

library(stats)
shapiro.test(fit1$res)

library(lmtest)
bptest(fit1)
dwtest(fit1)

library(stats)
shapiro.test(fit2$res)

library(lmtest)
bptest(fit2)
dwtest(fit2)

qqnorm(y1)
qqline(y1)
qqnorm(y2)
qqline(y2)

hist(y1)
hist(y2)