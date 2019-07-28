#Load Quantmod and PerformanceAnalytics
library(quantmod)
library(PerformanceAnalytics)

#Load AMZN data
getSymbols("AMZN")

#Look at AMZN data
head(AMZN)
summary(AMZN)

#Calculate AMZN returns and remove first row (NA value)
amzn_returns <- Return.calculate(AMZN$AMZN.Adjusted)
amzn_returns <- amzn_returns[-1,]

#Plot AMZN returns 
plot.zoo(amzn_returns)
chart.Histogram(amzn_returns, main = "Amazon Returns", col = "blue")

#Calculate mean and standard deviation of AMZN returns
mean <- mean(amzn_returns)
sd <- sd(amzn_returns)

#Calculate the Sharpe ratio of AMzN returns
amzn_Sharpe <- SharpeRatio(amzn_returns, Rf = 0.021, p = 0.95)


