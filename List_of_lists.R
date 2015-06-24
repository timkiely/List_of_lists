

# This script gives a simple demonstration of using lists within lists in R
# We we generate some dummy data, create an empty list then loop through the list 
# to fill it with data. After that, we will extract certain parts of the list back into 
# a single dataframe. 'final.data' is our output object, which is a dataframe 
# created from elements of our list-of-lists

# I'm making some dummy data. Two dataframe(the data inside the frames is irrelevant for this example)

test.data <- data.frame("Prev_Status"=sample(c("High","Low"),size=10,replace=T)
                        ,"Cur_Status"= sample(c("High","Low"),size=10,replace=T)
                        ,"Color_Status"=sample(c("Green","Yellow","Red"),replace=T,size=10)
                        ,stringsAsFactors = F)


other.data <- data.frame("month"=seq.Date(from=as.Date("2014-01-01"), to=as.Date("2014-12-31"),by="month")
                       ,"AUC"=sample(seq(from=0,to=1,by=0.01),12))




# I'm creating an empty list with 10 elements
empty.list<-as.list(seq(1:10))

str(empty.list)

# For each of the 10 elements in the empty list, I will add both data frames:

for(i in 1:length(empty.list)){
  empty.list[[i]]<-list(test.data,other.data)
}

full.list<-empty.list

str(full.list)

# "full list" is now a list of lists,
# it has 10 elements at the top level,
# and each level has two data frames

# You can access the different parts of a list using subsetting:
# the double brackets allow you to access the top layer of a list [[]] 
# and  the single brakcets allows you to access individual elements inside the top
# layer []


# for example:

# Access the first top level element in full.list
full.list[[1]] # should return two dataframes

# Access the second element in the first top level:
full.list[[1]][2] #should return just the second data frame in the first top level element


# Now, let's pull all the first elements into a single dataframe
# and add an identifier variable telling us where it came from

# we create an empty data frame first, then fill it using a loop...
final.data<-data.frame()


for(j in 1:length(full.list)){
  wanted.data<-as.data.frame(full.list[[j]][1]) # <- pick off the 1st elements of the jth top level item
  wanted.data$origin<-j # <- add an origin variable, will jsut tell us 1-10
  final.data<-rbind(final.data,wanted.data) # <- finally, row bind the looped data with what has already been created
}


head(final.data)




