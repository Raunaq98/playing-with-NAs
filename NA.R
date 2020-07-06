# create a vector containing 1000 draws from a standard normal distribution

y <- rnorm(1000)

# create a vector containing 1000 NAs

z <- rep(NA, times = 1000)
print(z)

#[1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[39] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[77] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[115] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[153] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[191] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[229] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[267] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[305] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[343] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[381] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[419] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[457] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[495] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[533] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[571] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[609] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[647] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[685] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[723] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[761] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[799] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[837] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[875] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[913] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[951] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
#[989] NA NA NA NA NA NA NA NA NA NA NA NA

# select 100 elements at random from these 2000 values (combining y and z) such that 
#we don't know how many NAs we'll wind up with or what positions they'll occupy in our final vector

my_data <- sample(c(y,z),100)
#finding NA positions

my_na <- is.na(my_data)

print(my_na)

#[1]  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE
#[20]  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE
#[39]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE
#[58] FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
#[77]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE
#[96] FALSE  TRUE FALSE  TRUE  TRUE

# if we take the sum of a bunch of TRUEs and FALSEs, we get the total number of TRUEs.


sum(my_na)
#[1] 55

###### REMOVING NAS FROM VECTORS

faulty_data <- c(1,2,NA,5,6,NA,9)  # created a vector that has NAs
print(faulty_data)

fault <- is.na(faulty_data)   #created vector "fault" that contains fault flags for previous vector
print(fault)

corrected_data <- faulty_data[!fault]
print(corrected_data) #printed original vector without the faults

temporary1<- c( -1, -5,0,NA, 7,NA,-3,NA,9)
# we want the data that is positive as well as free of NA

temporary1[ !is.na(temporary1) & temporary1 > 0]


##### SUBSET OF TWO VECTORS WHILE REMOVING NAS

temp1 <- c(1,2,3,NA,5,NA,7,8,9,10)
temp2 <- c(11,NA,NA,14,NA,16,NA,NA,NA,20)
print(temp1)
print(temp2)

good<- complete.cases(temp1,temp2)     # this functions gives positions at which both vectors are present
print(good)

#   [1]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE TRUE

temp1[good]    #gives elements of temp1 that have some corresponding element in temp2
# [1]  1 10
temp2[good]    #gives elements of temp2 that have some corresponding element in temp1
# [1] 11 20


#### REMOVING NAS FROM DATA FRAMES

# using a pre loaded data set "airquality"

air<- airquality[1:6,]

#     Ozone Solar.R  Wind Temp Month Day
#  1    41     190   7.4   67     5   1
#  2    36     118   8.0   72     5   2
#  3    12     149  12.6   74     5   3
#  4    18     313  11.5   62     5   4
#  5    NA      NA  14.3   56     5   5
#  6    28      NA  14.9   66     5   6

correct<-complete.cases(air)
air[correct,]
#look at nested list subsetting to understand
# basically it wants rows that are good AND the rows 1:6

#     Ozone Solar.R   Wind Temp  Month Day
#  1    41     190    7.4   67     5   1
#  2    36     118    8.0   72     5   2
#  3    12     149   12.6   74     5   3
#  4    18     313   11.5   62     5   4