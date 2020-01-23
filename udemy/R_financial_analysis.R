#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution

#Calculate profit for each month by substracting monthly expenses from monthly revenue
profit <- revenue - expenses
profit

#Calculate Tax as 30% of profit.
#Round the value to 2 decimal places.
tax <- round((0.30 * profit),2)
tax

#Calculate net profit by deducting tax from profit.
profit.after.tax <- profit - tax
profit.after.tax

#Calculate profit margin by dividing profit after tax by revenue.
#Round the value to 2 decimal points.
#Multiply by 100 to get the % value.
profit.margin <- round((profit.after.tax / revenue),2) * 100
profit.margin

#Calculate mean profit after tax for the 12 months
mean_pat <- mean(profit.after.tax)
mean_pat

#Determine months where profit after tax was greater than the mean profit after tax
good.months <- profit.after.tax > mean_pat
good.months

#Bad months are not good months
bad.months <- !good.months
bad.months

#Determine best month as max of profit after tax
best.month <- profit.after.tax == max(profit.after.tax)
best.month

#Determine worst month as min of profit after tax
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month

#Convert all calculations to Units of $1000.
revenue.1000 <- round(revenue / 1000,0)
expenses.1000 <- round(expenses / 1000,0)
profit.1000 <- round(profit / 1000,0)
profit.after.tax.1000 <- round(profit.after.tax / 1000,0)

#Print all results
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month