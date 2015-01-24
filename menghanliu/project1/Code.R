tab <- read.csv("msleep_ggplot2.csv")
colnames(tab)
tab$sleep_total #Extracting specific columns
summary(tab$sleep_total) #Summary statistics of the column

tab1 <- tab[tab$sleep_total > 18, ] #Subsetting the data set to rows where total sleep is gt 18 h. 
mean(tab1$sleep_total) #Average total sleep greater than 18 h.
#which() function: to get a number from a logical statement
tab[which(tab$sleep_total > 18 & tab$sleep_rem < 3), ] #Display the row number of the animal which has > 18 h of total sleep and < 3 h REM sleep
#order() function: sort the data from small to large
tab[order(tab$sleep_total)[1], ] #The row of the animal with the least total sleep
#rank() function: #Taking in numeric values in a column and rank them (assigning the smallest as 1)while keeping input vector the same order
rank(tab$sleep_total) #Rank hours of total sleep
#match() function: to find the index of the first match of a vector in a second vector
idx = match(c("Cotton rat"), tab$name)
tab[idx, ]
#To count the number of repetitions of "Rodentia"
table(tab$order)
#split() function: to split a vector into a list by grouping the vector according to a factor
s = split(tab$sleep_total, tab$order) #split the total sleep by animal order
mean(s$Rodentia)
#apply() function: to apply a function repeatedly to a vector or list
lapply(s, sd) #returns a list
sapply(s, sd) #returns a vector if possible
tapply(tab$sleep_total, tab$order, sd) #tapply 3 arguments: the vector of values, a factor to group by, function to apply