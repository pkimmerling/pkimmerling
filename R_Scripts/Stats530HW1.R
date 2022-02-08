#Data compares lead concentration in ppm to % mortality in midge flies
hwdata=HW_1_2
lead=hwdata$leadconc
mort=hwdata$mortality
#Model
fit=lm(lead~mort)
fit
summary(fit)
#Visualize the things
plot(lead,mort)
