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

#Homework 2
