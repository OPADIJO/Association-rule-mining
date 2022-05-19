
#import dataset 
AR<- read.csv("Cosmetics.csv", header = T, colClasses = "factor")

#inspect the dataset
names(AR)
head(AR)
tail(AR)
summary(AR)
str(AR)

#compute the sum of the colums
yes<- colSums(AR=="Yes")
yes

no<- colSums(AR=="No")
no

purchased<- rbind(yes,no)
purchased

barplot(purchased, beside= T, legend=rownames(purchased))

#finding association rules
install.packages("arules")
library(arules)
rules<- apriori(AR)
summary(rules)

#inspect the rules 
inspect(rules)

#reduce the number of rules
rules<- apriori(AR, parameter=list(minlen=2, maxlen=3, conf=0.95))
summary(rules)
inspect(rules)

#rules with "No" value are not useful so we remove them 
rules2<-apriori(AR, parameter = list(minlen=2, maxlen=3, supp=0.95), appearance = list(rhs=c("Lipstick = Yes"), default="lhs"))

#Apriori rules where Foundation is yes on the right hand side
rules<- apriori(AR, parameter = list(minlen=2, maxlen=3, conf=0.7), appearance = list(rhs=c("Foundation=Yes"),default="lhs"))
inspect (rules)               

