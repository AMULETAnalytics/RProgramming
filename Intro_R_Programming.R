# Introduction to R Programming Class
#
# (c) AMULET Analytics

# Slide 15 -----------------------------------------------

# <- is the assignment operator, = is almost the same. 

x <- vector()    # Empty vector assignment 
class(x)         # logical!

# Slide 18 -----------------------------------------------

x <- 1      # Integer vector with 1st element = 1
print(x)

msg <- "hello"   # Character vector, 1 element

# Slide 19 ----------------------------------------------

x <- 5
x            # Implicit printing

print(x)     # Explicity printing

# [1] 5    This means a vector of length 1 with element = 5

# Slide 20 - Printing -----------------------------------

x <- 1:20    # Use : operator to create integer sequences
x

# Slide 21 - Creating vectors ---------------------------

# Use c() concatenate function
x <- c(0.5, 0.6)       ## numeric vector, 2 elements
x <- c(TRUE, FALSE)    ## logical vector, 2 elements
x <- c(T, F)           ## logical vector, 2 elements
x <- c("a", "b", "c")  ## character vector, 3 elements
x <- 9:29              ## integer vector, 21 elements
x <- c(1+0i, 2+4i)     ## complex vector, 2 elements

# Using the vector() function
x <- vector("numeric", length = 10) # numeric vector, 10 elements

# All elements default to 0
x


# Slide 22 - Mixing objects -----------------------------

# Since vector elements MUST be of same type, coercion occurs!
y <- c(1.7, "a")  ## character vector, "1.7"
y <- c(TRUE, 2)   ## numeric vector (1,2), where TRUE=1, FALSE=0
y <- c("a", TRUE) ## character vector ("a", "TRUE")


# Slide 23 - Explicity coercion --------------------------

x <- 0:6       # 0 1 2 3 4 5 6
class(x)
#[1] "integer"

as.numeric(x)
#[1] 0 1 2 3 4 5 6
y <- as.numeric(x)
class(y)
#[1] "numeric"

as.logical(x)
#[1] FALSE TRUE TRUE TRUE TRUE TRUE TRUE

as.character(x)
#[1] "0" "1" "2" "3" "4" "5" "6"

as.complex(x)
#[1] 0+0i 1+0i 2+0i 3+0i 4+0i 5+0i 6+0i

# Slide 24 - Explicity coercion ------------------------

x <- c("a", "b", "c")
as.numeric(x)
# [1] NA NA NA
#Warning message:
#  NAs introduced by coercion

as.logical(x)
#[1] NA NA NA

# Slide 25 - Matrices ----------------------------------

m <- matrix(nrow = 2, ncol = 3)
m
#[,1] [,2] [,3]
#[1,] NA NA NA
#[2,] NA NA NA

# Return dimension attribute of matrix
dim(m)
#[1] 2 3

# Or use the attributes() function
attributes(m)
#$dim
#[1] 2 3


# Slide 26 - Matrices --------------------------------

# Assign values completing a column at a time
m <- matrix(1:6, nrow = 2, ncol = 3)
m
#     [,1] [,2] [,3]
#[1,]    1    3    5
#[2,]    2    4    6

# Another example using c()
m <- matrix(c(3,1,4,1,5,9), nrow=2, ncol=3)
m


# Slide 27 - Matrices ---------------------------------
m <- 1:10       # Design an integer vector of 10 elements
m
#[1] 1 2 3 4 5 6 7 8 9 10

# Assign to dimension attribute making object a matrix
dim(m) <- c(2, 5)    # 2 rows, 5 columns
m
#     [,1] [,2] [,3] [,4] [,5]
#[1,]    1    3    5    7    9
#[2,]    2    4    6    8   10


# Slide 28 - cbinding and rbinding -------------------

# Define two integer vectors, each with 3 elements
x <- 1:3
y <- 10:12
cbind(x, y)         # Combine by column
#     x  y
#[1,] 1 10
#[2,] 2 11
#[3,] 3 12

rbind(x, y)         # Combing by row
#  [,1] [,2] [,3]
#x    1    2    3
#y   10   11   12


# Slide 29 - Lists ------------------------------------

x <- list(1, "a", TRUE, 1 + 4i)
x             # See double brackets for elements of a list
#[[1]]
#[1] 1
#
#[[2]]
#[1] "a"
#
#[[3]]
#[1] TRUE
#
#[[4]]
#[1] 1+4i

class(x)
#[1] "list"


# Slide 31 - Factors ------------------------------------

x <- factor(c("yes", "yes", "no", "yes", "no"))
x
#[1] yes yes no  yes no 
#Levels: no yes

table(x)    # frequency of factor values
#x
# no yes 
#  2   3

class(x)
#[1] "factor"

unclass(x)   # Convert a factor to its integer codes
#[1] 2 2 1 2 1
#attr(,"levels")
#[1] "no"  "yes"

# Another example
y <- factor(c("b", "a", "a", "c", "a", "b", "c"))
unclass(y)
#[1] 2 1 1 3 1 2 3
#attr(,"levels")
#[1] "a" "b" "c"

# Slide 32 - Factors ----------------------------------

# Can also set order of levels
x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))
x
#[1] yes yes no yes no
#Levels: yes no

# Slide 34 - Missing values ---------------------------

x <- c(1, 2, NA, 10, 3)   # Numeric vector
is.na(x)                  # Only 3rd element is NA
#[1] FALSE FALSE TRUE FALSE FALSE

is.nan(x)    # Is any element "Not a Number"? NO!
#[1] FALSE FALSE FALSE FALSE FALSE

is.nan(NA)   # NA is not considered NaN
#[1] FALSE

x <- c(1, 2, NaN, NA, 4)
is.na(x)           # NA and NaN considered missing value
#[1] FALSE FALSE TRUE TRUE FALSE

is.nan(x)     # Only 1 actual Nan
#[1] FALSE FALSE TRUE FALSE FALSE


# Slide 36 - Data frames --------------------------------

x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
#  foo   bar
#1   1  TRUE
#2   2  TRUE
#3   3 FALSE
#4   4 FALSE

nrow(x)
#[1] 4

ncol(x)
#[1] 2


# Slide 37 - Names

x <- 1:3    # Create an integer vector
x
#[1] 1 2 3

names(x)    # No names for this vector object
#NULL

# Now assign some names for each element
names(x) <- c("foo", "bar", "norf")
x             # Print with names
#foo bar norf
#  1   2    3

names(x)       # Now just print the names, no values
#[1] "foo" "bar" "norf"



# Slide 38 - Names -------------------------------------

x <- list(a = 1, b = 2, c = 3)   # Create a new list with names
x
$a
[1] 1
$b
[1] 2
$c
[1] 3


# Slide 39 - Names ------------------------------------

m <- matrix(1:4, nrow = 2, ncol = 2)  # Define 2x2 matrix
m                       # Note: no names, just indexes
#     [,1] [,2]
#[1,]    1    3
#[2,]    2    4

# Assign some names
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m                       # Print matrix with names
#  c d
#a 1 3
#b 2 4


# Slide 42 - Subsetting --------------------------------

x <- c("a", "b", "c", "c", "d", "a")  # Define character vector
x[1]
#[1] "a"

x[2]
#[1] "b"

x[1:4]              # Select elements 1 through 4
#[1] "a" "b" "c" "c"

x[x > "a"]          # Select all elements with value > "a"
#[1] "b" "c" "c" "d"

u <- x > "a"        # Create a logical vector
u
#[1] FALSE TRUE TRUE TRUE TRUE FALSE

x[u]                # Use logical vector as an index for x
#[1] "b" "c" "c" "d"


# Slide 43 - Subsetting a matrix ------------------------

x <- matrix(1:6, 2, 3)
#     [,1] [,2] [,3]
#[1,]    1    3    5
#[2,]    2    4    6

x[1, 2]     # A single element
#[1] 3

x[2, 1]     # A single element
#[1] 2

x[1, ]      # first row. This notation is used all the time!!
#[1] 1 3 5

x[, 2]      # 2nd column
#[1] 3 4


# Slide 44 - Subsetting a matrix ------------------------

x <- matrix(1:6, 2, 3)
x[1, 2]       # A vector of 1 element, NOT a 1x1 matrix
#[1] 3

x[1, 2, drop = FALSE]   # Preserve dimension of x so get a matrix
     [,1]
[1,]    3


# Slide 45 - Subsetting a matrix ------------------------

x <- matrix(1:6, 2, 3)
x[1, ]                 # This is an integer vector with 3 elems
#[1] 1 3 5

# Class is "matrix"
x[1, , drop = FALSE]   # Take 1st row of matrix, create 1x3 matrix
     [,1] [,2] [,3]
[1,]    1    3    5


# Slide 46 - Subsetting lists

x <- list(foo = 1:4, bar = 0.6)
x
#$foo
#[1] 1 2 3 4
#
#$bar
#[1] 0.6

x[1]               # Class "list"
#$foo
#[1] 1 2 3 4

x[[1]]             # Class "integer" vector
#[1] 1 2 3 4

x$bar              # Class "numeric"
#[1] 0.6

x[["bar"]]         # Class "numeric"
#[1] 0.6

x["bar"]           # Class "list"
#$bar
#[1] 0.6


# Slide 47 - Subsetting lists ----------------------------

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x
$foo
[1] 1 2 3 4

$bar
[1] 0.6

$baz
[1] "hello"

# Now select out element 1 and 3
x[c(1, 3)]    # c(1,3) is a vector of element numbers
#$foo
#[1] 1 2 3 4
#$baz
#[1] "hello"


# Slide 48 - Subsetting lists ----------------------------

x <- list(foo = 1:4, bar = 0.6, baz = "hello")

name <- "foo"   # Save the name of the list element

x[[name]]       ## computed index for `foo'
#[1] 1 2 3 4

x$name          ## element `name' doesn't exist!
#NULL

x$foo
#[1] 1 2 3 4    ## element `foo' does exist


# Slide 49 - Subsetting nested elements of a list --------

x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
#$a
#$a[[1]]
#[1] 10
#
#$a[[2]]
#[1] 12
#
#$a[[3]]
#[1] 14
#
#
#$b
#[1] 3.14 2.81

class(x$a)     # First element is a list
#[1] "list"

class(x$b)     # Second element is a numeric vector
#[1] "numeric"


x[[c(1, 3)]]     # Element 3 of the list
[1] 14

x[[1]][[3]]      # Another way of doing it
[1] 14

x[[c(2, 1)]]     # First element of the vector
[1] 3.14


# Slide 50 - Partial matching ---------------------------

x <- list(aardvark = 1:5)

x$a               # "a" for aardvark
#[1] 1 2 3 4 5

x[["a"]]
#NULL

x[["a", exact = FALSE]]
#[1] 1 2 3 4 5


# Slide 51 - Removing NA values -------------------------

x <- c(1, 2, NA, 4, NA, 5)

bad <- is.na(x)
bad
#[1] FALSE FALSE  TRUE FALSE  TRUE FALSE

x[!bad]        # Introducing the bang "!" operator NOT
#[1] 1 2 4 5


# Slide 52 - Removing NA values -------------------------

x <- c(  1,   2, NA,   4, NA,  5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)   # Find where both are non-missing
good
#[1] TRUE TRUE FALSE TRUE FALSE TRUE

x[good]      # Eliminate NAs
[1] 1 2 4 5

y[good]      # Eliminate NAs
[1] "a" "b" "d" "f"


# Slide 53 - Removing NA values -----------------------

# airquality data frame found in Base R: 153x6
# rows 5, 6 are have NAs
airquality[1:6, ]     # Extract first 6 rows, all columns

# Create a logical index of complete rows
good <- complete.cases(airquality)

# Show first 6 complete rows
airquality[good, ][1:6, ]


# Slide 54 - Vectorized operations ---------------------

x <- 1:4; y <- 6:9     # Define 2 vectors of same length = 4
x + y                  # Vector addition
#[1] 7 9 11 13

x > 2
#[1] FALSE FALSE TRUE TRUE

x >= 2
#[1] FALSE TRUE TRUE TRUE

y == 8                 # Compare for equality
#[1] FALSE FALSE TRUE FALSE

x * y                  # Element wise multiplication
#[1] 6 14 24 36

x / y                  # Element wise division
#[1] 0.1666667 0.2857143 0.3750000 0.4444444


# Slide 55 - Vectorized matrix operations ----------------

x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)

x * y         ## element-wise multiplication
#     [,1] [,2]
#[1,]   10   30
#[2,]   20   40

x / y
#     [,1] [,2]
#[1,]  0.1  0.3
#[2,]  0.2  0.4

x %*% y            ## true matrix multiplication
#     [,1] [,2]
#[1,]   40   40
#[2,]   60   60


# Slide 68 - for control structure -------------------

for(i in 1:10) {
  print(i)
}


# Slide 69 - for control structure -------------------

x <- c("a", "b", "c", "d")
for(i in 1:4) {
  print(x[i])
}

# Note seq_along(x) returns a vector: 1 2 3 4
for(i in seq_along(x)) {
  print(x[i])
}

for(letter in x) {
  print(letter)
}

for(i in 1:4) print(x[i])


# Slide 70 - nested for loops ---------------------------

x <- matrix(1:6, 2, 3)   # 2x3 matrix

for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])        # Print each element
  }
}

#[1] 1
#[1] 3
#[1] 5
#[1] 2
#[1] 4
#[1] 6


# Slide 71 - while control structure ------------------

count <- 0
while(count < 10) {
  print(count)           # Print 0 .. 9
  count <- count + 1
}


# Slide 72 - while control structure --------------------

z <- 5
while(z >= 3 && z <= 10) {
  print(z)
  # Use binomial distribution: 1 observation, 1 trial, 
  # 0.5 probability of success for each trial (fair coin)
  coin <- rbinom(1, 1, 0.5)   # Random # generation, flip fair coin
  if(coin == 1) { ## random walk
    z <- z + 1
  } else {
    z <- z - 1
  }
}


# Slide 73 - repeat control structure -----------------

x0 <- 1
tol <- 1e-8   # Delta threshold to quit
repeat {
  x1 <- computeEstimate()    # Function computeEstimate() not included
  if(abs(x1 - x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}


# Slide 84 - Lazy evaluation ---------------------------

f <- function(a, b) {
  a^2        # Last expression in a function is the return value
}

f(2)    # Call the function passing a value for arg a


# Slide 85 - Lazy evaluation ---------------------------

f <- function(a, b) {
  print(a)
  print(b)
}

f(45)
#[1] 45
#Error in print(b) : argument "b" is missing, with no default


# Slide 91 - lapply -----------------------------------

# Create a list with 2 elements: integer vector of length=5
# and numeric vector of length=10
x <- list(a = 1:5, b = rnorm(10))  # Normal distribution values
x
#$a
#[1] 1 2 3 4 5
#
#$b
#[1]  1.7233800  1.1606824 -2.0491337 -0.3789917 -0.4466583  0.4138854
#[7]  1.2072786 -1.6345064 -1.1511696  0.5912451

lapply(x, mean)   # Calculate mean of both vectors
#$a
#[1] 3
#
#$b
#[1] 0.0296824


# Slide 92 - lapply -----------------------------------

# For rnorm(), mean=0 is default
# Here c uses mean=1
# Here d uses mean=5
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))

lapply(x, mean)
$a
[1] 2.5

$b
[1] 0.06082667

$c
[1] 1.467083

$d
[1] 5.074749


# Slide 93 - lapply ------------------------------------

x <- 1:4

# Generates random deviates
args(runif)     # Check out arg list for uniform distribution fcn

# Create a list object
# Element 1 has 1 random 
# Element 2 has 2 randoms
# Element 3 has 3 randoms
# Element 4 has 4 randoms
lapply(x, runif)  
[[1]]
[1] 0.2675082

[[2]]
[1] 0.2186453 0.5167968

[[3]]
[1] 0.2689506 0.1811683 0.5185761

[[4]]
[1] 0.5627829 0.1291569 0.2563676 0.7179353


# Slide 94 - lapply ---------------------------------------

x <- 1:4

# Note the ... argument is for min=0, max=10
lapply(x, runif, min = 0, max = 10)
[[1]]
[1] 3.302142

[[2]]
[1] 6.848960 7.195282

[[3]]
[1] 3.5031416 0.8465707 9.7421014

[[4]]
[1] 1.195114 3.594027 2.930794 2.766946


# Slide 95 and 96 - lapply ---------------------------------

# Define a list consisting of 2 matrices
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
$a
     [,1] [,2]
[1,]    1    3
[2,]    2    4

$b
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6

# Define a function inside of lappy() to select first column
lapply(x, function(elt) elt[,1])
$a
[1] 1 2

$b
[1] 1 2 3


# Slide 98 and 99 sapply ---------------------------------

# First let's look at the lapply result
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
$a
[1] 2.5

$b
[1] 0.06082667

$c
[1] 1.467083

$d
[1] 5.074749

# Now let's use sapply to simplify

sapply(x, mean)   # Returns a numeric vector, NOT a list
         a          b          c          d
2.50000000 0.06082667 1.46708277 5.07474950

mean(x)           # Can't use mean() for lists


# Slide 102 - apply --------------------------------------

x <- matrix(rnorm(200), 20, 10)   # Create a 20x10 matrix
dim(x) 
[1] 20 10

# Compute mean over columns (MARGIN=2 for cols, MARGIN=1 rows)
apply(x, 2, mean)
[1] -0.74303310  0.35458880  0.13481934  0.06145236  0.05091838
[6] -0.17001175 -0.33114470  0.12330392  0.16776065  0.22982988

apply(x, 1, sum)   # Compute sum for each row
[1] -0.7868339  1.2918416 -0.3977886  5.9339352  2.1263949 -1.3846887
[7] -5.5452877 -0.6641990 -4.3731139  4.4081688 -0.5479200 -4.3701294
[13]  3.4877387  3.8382023 -1.6243604  0.5771827 -3.9794925 -3.6587491
[19] -0.4479327  3.6867072


# Slide 103 - apply --------------------------------------

# Instead of doing this ...
rowSums = apply(x, 1, sum)    # MARGIN=1 for rows
rowMeans = apply(x, 1, mean)  # MARGIN=1 for rows
colSums = apply(x, 2, sum)    # MARGIN=2 for cols
colMeans = apply(x, 2, mean)  # MARGIN=2 for cols

# You can use these shortcuts
rowSums(x)
rowMeans(x)
colSums(x)
colMeans(x)


# Slide 104 - apply --------------------------------------

x <- matrix(rnorm(200), 20, 10)

# Calculate 25% and 75% percentiles
apply(x, 1, quantile, probs = c(0.25, 0.75))
[,1]       [,2]       [,3]       [,4]       [,5]       [,6]
25% -0.4739391 -0.8677358 -0.6958262 -0.1979822 -0.6930038 -0.7304902
75%  0.4367207  0.3091204  0.3277869  0.6755583  0.8138959  0.4037430
[,7]       [,8]       [,9]     [,10]      [,11]      [,12]
25% -0.5236675 -0.5798327 -0.5347041 0.5238555 -0.7548490 -1.2683917
75%  0.5993433  0.5234082  0.6125282 1.5146487 -0.1986852 -0.3488457
[,13]      [,14]      [,15]      [,16]      [,17]      [,18]
25% -0.5033292 -0.3253095 -0.2787021 -0.8012668 -1.1480751 -1.0877927
75%  0.5538329  0.5726695  0.2829677  0.7507799  0.9994819  0.2751738
[,19]      [,20]
25% -1.212010 -1.2269352
75%  1.315204  0.3881853


# Slide 105 - apply ----------------------------------------

# Create a 3-dimensional matrix
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))

# Collapse 3rd dimension
apply(a, c(1, 2), mean)
            [,1]      [,2]
[1,] -0.64619153 0.4342067
[2,]  0.09584386 0.4556951

# Another way to do it
rowMeans(a, dims = 2)
            [,1]      [,2]
[1,] -0.64619153 0.4342067
[2,]  0.09584386 0.4556951


# Slide 107 - tapply ----------------------------------------

# Define a numeric vector of length 30
x <- c(rnorm(10), runif(10), rnorm(10, 1))

# gl(n,k) generates factor levels, n=# levels, k=# replications
f <- gl(3, 10) 
f
[1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
Levels: 1 2 3

# Take group means
tapply(x, f, mean)
         1          2          3 
-0.1518069  0.5257590  0.4846167 


# Slide 108 - tapply ------------------------------------

# Use simplify=FALSE always returns "list", TRUE (default)
# always returns a scalar
z <- tapply(x, f, mean, simplify = FALSE)
z
$`1`
[1] -0.1518069

$`2`
[1] 0.525759

$`3`
[1] 0.4846167


# Slide 109 - tapply --------------------------------------=

# Calculate the MIN and MAX values
tapply(x, f, range)
$`1`
[1] -1.817712  1.013674

$`2`
[1] 0.1173772 0.9314156

$`3`
[1] -1.192308  3.340692


# Slide 111 - split ---------------------------------------

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)

# Split vector x according to factor f into a list with 
# a number of elements equal to # levels
# Also unsplit()
split(x, f)
$`1`
[1]  0.6747407  0.7809243 -1.3207132  0.1955758  1.2876734  1.3496505
[7] -1.1890280 -1.1237316  1.4768832 -1.4751009

$`2`
[1] 0.6419825 0.3419221 0.6671094 0.5453081 0.5255481 0.1115069
[7] 0.6517376 0.2380157 0.9482666 0.0627268

$`3`
[1] 1.1046428 1.4646097 1.5050529 3.1584884 0.6394136 0.9963238
[7] 1.5416058 0.8581232 1.5952700 1.0198079


# Slide 112 - split ------------------------------------------

# Same as tapply
lapply(split(x, f), mean)
$`1`
[1] 0.06568742

$`2`
[1] 0.4734124

$`3`
[1] 1.388334


# Slide 113 - splitting a data frame ---------------------

library(datasets)
head(airquality)


# Slide 114 - splitting a data frame ---------------------

# Create a list s with one element a list for each month
s <- split(airquality, airquality$Month)
s       # Check this out!
s[['7']]    # For July

# Calculate column mean for Ozone, Solar.R, Wind
# Notice some are NA because of missing data
# Good example of embedding a function in a function call
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))


# Slide 115 - splitting a data frame ---------------------

# The data set only has months May-Sept
# Missing data causes the NA
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
               5         6          7        8        9
Ozone         NA        NA         NA       NA       NA
Solar.R       NA 190.16667 216.483871       NA 167.4333
Wind    11.62258  10.26667   8.941935 8.793548  10.1800

# Now remove the NAs
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")],
                               na.rm = TRUE))
                5         6          7          8         9
Ozone    23.61538  29.44444  59.115385  59.961538  31.44828
Solar.R 181.29630 190.16667 216.483871 171.857143 167.43333
Wind     11.62258  10.26667   8.941935   8.793548  10.18000


# Slide 116 - splitting on more than one level ---------

x <- rnorm(10)
f1 <- gl(2, 5)    # 2 levels, 5 repetitions (i.e. 1 five times, etc.)
f2 <- gl(5, 2)    # 5 levels, 2 repetitions
f1
[1] 1 1 1 1 1 2 2 2 2 2
Levels: 1 2

f2
[1] 1 1 2 2 3 3 4 4 5 5
Levels: 1 2 3 4 5

# Compute factor interactions for f1 and f2
# interaction() computes a factor which represents the 
# interaction of the given factors.
# The function combines all the levels of f1 with all the levels of f2
# The result is 10 levels since 2 levels for f1 and 5 levels for f2
interaction(f1, f2)
[1] 1.1 1.1 1.2 1.2 1.3 2.3 2.4 2.4 2.5 2.5
Levels: 1.1 2.1 1.2 2.2 1.3 2.3 1.4 2.4 1.5 2.5


# Slide 117 - splitting on more than one level ------------

str(split(x, list(f1, f2)))
List of 10
$ 1.1: num [1:2] -1.237 0.127
$ 2.1: num(0) 
$ 1.2: num [1:2] -0.0287 -0.8467
$ 2.2: num(0) 
$ 1.3: num 0.124
$ 2.3: num -0.708
$ 1.4: num(0) 
$ 2.4: num [1:2] 0.957 0.187
$ 1.5: num(0) 
$ 2.5: num [1:2] 0.221 -0.602


# Slide 118 - split -------------------------------------

str(split(x, list(f1, f2), drop = TRUE))
List of 6
$ 1.1: num [1:2] -1.237 0.127
$ 1.2: num [1:2] -0.0287 -0.8467
$ 1.3: num 0.124
$ 2.3: num -0.708
$ 2.4: num [1:2] 0.957 0.187
$ 2.5: num [1:2] 0.221 -0.602


# Slide 120 - mapply -----------------------------------

# You can do this, but a lot of typing
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))

# mapply is quicker
mapply(rep, 1:4, 4:1)
[[1]]
[1] 1 1 1 1

[[2]]
[1] 2 2 2

[[3]]
[1] 3 3

[[4]]
[1] 4


# Slide 121 - vectorizing a function ------------------

noise <- function(n, mean, sd) {rnorm(n, mean, sd)}

noise(5, 1, 2)
[1] 1.3116220 2.0471980 0.4832281 1.6805600 4.2317747

noise(1:5, 1:5, 2)
[1] -1.5493211  0.2884407  4.5591684  7.3354447  7.7611830


# Slide 122 - instant vectorization -------------------

mapply(noise, 1:5, 1:5, 2)
[[1]]
[1] -2.765838

[[2]]
[1]  0.65358389 -0.01597224

[[3]]
[1] 2.831973 4.397796 5.254299

[[4]]
[1] 4.265896 1.922889 2.920904 1.604065

[[5]]
[1]  5.2431049  4.4062999  5.7596184  5.3981487 -0.7251129


# Slide 123 - instant vectorization ----------------------

# Same as above!
list(noise(1, 1, 2), noise(2, 2, 2),
     noise(3, 3, 2), noise(4, 4, 2),
     noise(5, 5, 2))


# Slide 127 - generating random numbers ------------------

x <- rnorm(10)
x
[1] 1.38380206 0.48772671 0.53403109 0.66721944
[5] 0.01585029 0.37945986 1.31096736 0.55330472
[9] 1.22090852 0.45236742

# 10 random numbers, normally distributed, mean=20, sd=2
x <- rnorm(10, 20, 2)
x
[1] 23.38812 20.16846 21.87999 20.73813 19.59020
[6] 18.73439 18.31721 22.51748 20.36966 21.04371

summary(x)


# Slide 128 - generating random numbers with seed

set.seed(1)
rnorm(5)
[1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

# Different random numbers!
rnorm(5)
[1] -0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884

# Use same seed value to generate the same random numbers
set.seed(1)
rnorm(5)
[1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078


# Slide 129 - generating Poisson data

rpois(10, 1)    # lambda (rate) =1, vector of means
[1] 0 0 1 1 2 1 1 4 1 2

rpois(10, 2)    # Now rate = 2 so slightly larger
[1] 4 1 2 0 1 1 0 1 4 1

rpois(10, 20)   # Now rate = 20
[1] 19 19 24 23 22 24 23 20 11 22

# Cummulative distribution for Poisson allows you to evaluate the 
# following probabilities:

# Probability that a Poisson random varialbe is <= 2, if rate  2
ppois(2, 2)     # Pr(x <= 2)
[1] 0.6766764

# Probability that a Poisson random varialbe is <= 4, if rate  2
ppois(4, 2)     # Pr(x <= 4)
[1] 0.947347

# Probability that a Poisson random varialbe is <= 6, if rate  2
ppois(6,2)      # Pr(x <= 6)
[1] 0.9954662


# Slide 130 - generating random numbers from a linear model

set.seed(20)
x <- rnorm(100)        # Single predictor x
e <- rnorm(100, 0, 2)  # Error term, mean=0, sd=2

# Use coefficients b1=2, b0=0.5
y <- 0.5 + 2 * x + e   # Linear model calc response y
summary(y)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-6.4080 -1.5400  0.6789  0.6893  2.9300  6.5050 

plot(x, y)    # Note the linear trend


# Slide 132 - generating random numbers from a linear model

# Now use binomial distribution - binary
set.seed(10)
# Number of observations=100, number of trials=1, prob of success each trial=0.5
x <- rbinom(100, 1, 0.5)    # All binary
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-3.4940 -0.1409  1.5770  1.4320  2.8400  6.9410 

plot(x, y)         # X is binary


# Slide 134 - generating random numbers from a generalized linear model

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
0.00    1.00    1.00    1.55    2.00    6.00 

plot(x, y)


# Slide 136 - random sampling ---------------------------------

set.seed(1)

sample(1:10, 4)    # Choose from integers 1:10, choose 4 items
[1] 3 4 5 7

sample(1:10, 4)    # No seed
[1] 3 9 8 5

sample(letters, 5) # Choose random letters
[1] "q" "b" "e" "x" "p"

sample(1:10) ## permutation
[1] 4 7 10 6 9 2 8 3 1 5

sample(1:10)
[1] 2 3 4 1 9 5 10 8 6 7

# Default is replace=FALSE, no replacement
sample(1:10, replace = TRUE) ## Sample w/replacement


# Slide 139 - Date and times in R --------------------------

x <- as.Date("1970-01-01")
x
[1] "1970-01-01"

x+1     # Allows for date arithmetic
[1] "1970-01-02"

unclass(x)
[1] 0       # The origin date

dd <- as.Date("1963-06-06")
unclass(dd)
[1] -2401   # Dates prior to 1/1/1970 are negative

unclass(as.Date("1970-01-02"))
[1] 1


# Slide 140 - Dates and times in R ------------------------

weekdays(x)
[1] "Thursday"

months(x)
[1] "January"

quarters(x)
[1] "Q1"


# Slide 141 - Dates and times in R ------------------------

x <- Sys.time()
x
[1] "2015-04-14 18:14:32 PDT"

p <- as.POSIXlt(x)
p
[1] "2015-04-14 18:14:32 PDT"

names(unclass(p))
[1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"  
[8] "yday"   "isdst"  "zone"   "gmtoff"

p$sec     # Pull out the seconds portion
[1] 32.30752


# Slide 142 - Dates and times in R ------------------------

x <- Sys.time()
x ## Already in `POSIXct' format
[1] "2015-04-14 18:18:41 PDT"

unclass(x)
[1] 1429060722

x$sec           # Error since in POSIXct format, not POSIXlt

# Coerce the value
p <- as.POSIXlt(x)
p$sec     # Now seconds is available


# Slide 143 - Dates and times in R ------------------------

datestring <- c("January 10, 2012 10:40", "December 9, 2011 09:10") 
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
[1] "2012-01-10 10:40:00 PST" "2011-12-09 09:10:00 PST"

class(x)
[1] "POSIXct" "POSIXt"

?strptime


# Slide 144 - Dates and times in R -------------------------

x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x - y    # Error!

x <- as.POSIXlt(x)
x - y
Time difference of 356.1845 days


# Slide 145 - Dates and times in R ------------------------

# Data arithmetic
x <- as.Date("2012-03-01")   # Class is "Date"
y <- as.Date("2012-02-28")   # Class is "Date"
delta <- x - y
delta
Time difference of 2 days

class(delta)
[1] "difftime"      # Special "difftime" class

# Below x,y have class "POSIXct" "POSIXt"
x <- as.POSIXct("2012-10-25 01:00:00")     # PDT
# Specify time zone with tz. GMT is UTC
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")  

y - x
Time difference of -2 hours    #


# Slide 149 Exploratory graphs --------------------------

pData <- read.csv("ss06pid.csv")

dim(pData)     # Data frame 14931x239

head(pData)    # Show first 6 rows

tail(pData)    # Show last 6 rows


# Slide 150 boxplots -------------------------------------

# AGEP variable is "integer" - goal is to view the 
# distribution of the data
boxplot(pData$AGEP,col="blue")

# Mean - solid line is center of distribution. When the mean
# is in the middle of the blue box it means it is a
# symmetric distribution

# Upper border of blue box is 75th percentile

# Lower border of blue box is 25th percentile

# Upper whisker is 1.5 x 75th percentile

# Lower whisker is 1.5 x 25th percentile


# Slide 151 - boxplots --------- --------------------------

# Now use DDRS - dressing
boxplot(pData$AGEP ~ as.factor(pData$DDRS),col="blue")

# Tilda "~" means show AGEP broken down by DDRS variable

# DDRS=1 have difficulty dressing
# DDRS=2 do not have difficulty dressing

# Interpretation of the dual boxplots is: older people have
# more difficult dressing


# Slide 152 - boxplots -----------------------------------

boxplot(pData$AGEP ~ as.factor(pData$DDRS),col=c("blue","orange"),names=c("yes","no"),varwidth=TRUE)

# Use different colors for each group

# Use varwidth=TRUE so width of box is proportional to the
# number of observations in group


# Slide 153 - barplots -----------------------------------

barplot(table(pData$CIT),col="blue")

# Shows number of observations in each class ==> CIT has
# values 1 .. 5

table(pData$CIT)   # table() useful for numeric distribution
    1     2     3     4     5 
14122    13   110   263   423 


# Slide 154 - histograms -----------------------------------

hist(pData$AGEP,col="blue")

# Shows a univariate distribution of the data


# Slide 155 - histograms -----------------------------------

hist(pData$AGEP,col="blue",breaks=100,main="Age")

# Use breaks=100 for more fine grain


# Slide 156 - scatterplots --------------------------------

# Most used type of plot for exploration. Use to visualize
# relationships between quantitative variables. 

# x axis - commuting time
# y axis - wage

# The row of data points at top likely have to do with reasons of encoding

plot(pData$JWMNP,pData$WAGP,pch=19,col="blue")  # pch=19 filled in circles


# Slide 157 - scatterplots - size matters -----------------

# Smaller magnification value with cex=0.5 you get better resolution
# for each data point. 

plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5)  # cex=0.5


# Slide 158 - scatterplots - using color -----------------------

# Very important technique to encode a 3rd variable using color
# SEX has values 1 or 2

plot(pData$JWMNP,pData$WAGP,pch=19,col=pData$SEX,cex=0.5)


# Slide 159 - scatterplots -  using size ------------------------

# Use dot size to visualize another variable
percentMaxAge <- pData$AGEP/max(pData$AGEP) # Numeric vector, len=14931
percentMaxAge[1:50]

# The size of the x, y data point will have a size = % of max age
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=percentMaxAge*0.5)

# This works better
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=percentMaxAge)


# Slide 160 - scatterplots - overlaying lines/points ------------

# Same underling plot
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5)

# dim(pData)[1] gets # rows in data frame, also nrow(pData)
# rep(100,dim(pData)[1]) gets numeric vector each element = 100
# Draws one thick grey line with x=100 consisting of 14931 data points
lines(rep(100,dim(pData)[1]),pData$WAGP,col="grey",lwd=5)

# Generate some simulated x,y points and plot them
# 20e5 - 2,000,000
points(seq(0,200,length=100),seq(0,20e5,length=100),col="red",pch=19)


# Slide 161 - scatterplots - numeric variables as factors -----------

install.packages("Hmisc")
library(Hmisc)               # Need this package for cut2()

# Cut a numeric variable into intervals
ageGroups <- cut2(pData$AGEP,g=5)    # 5 cut points
class(ageGroups)
[1] "factor" 

levels(ageGroups)
[1] "[ 0,14)" "[14,29)" "[29,45)" "[45,60)" "[60,93]"

# Use different color for each of the 5 age groups
plot(pData$JWMNP,pData$WAGP,pch=19,col=ageGroups,cex=0.5)


# Slide 162 - scatterplots - lots of points ------------------------

x <- rnorm(1e5)     # 100,000 x
y <- rnorm(1e5)     # 100,000 y
plot(x,y,pch=19)    # too many points to make sense, need sampling!


# Slide 163 - scatterplots - lots of points with sampling ----------

x <- rnorm(1e5)
y <- rnorm(1e5)

# Create a simpling index of 1,000 points instead of 100,000
sampledValues <- sample(1:1e5,size=1000,replace=FALSE)

# Now plot using the sampled index, much better!
plot(x[sampledValues],y[sampledValues],pch=19)


# Slide 164 - scatterplots - smoothScatter -------------------------

x <- rnorm(1e5)
y <- rnorm(1e5)

# Notice the outliers in the plot!
smoothScatter(x,y)     # Better depending on your preference


# Slide 165 - QQ-plots ---------------------------------------------

# Two vectors of 20 normally distributed random numbers
x <- rnorm(20); y <- rnorm(20)

# Plot quantiles of x vs. quantiles of y
qqplot(x,y)     # Do a quantile-quantile plot

# Draw a line with intercept=0 and slope=1
abline(c(0,1))


# Slide 166 - Heatmaps ---------------------------------------------

# image(x, y, z)
# x, y - locations of grid lines at which the values in z are measured
# z - a matrix containing the values to be plotted

# image() plots a matrix of data points as a grid of boxes, color coding
# the boxes based on the intensity at each location.
# Color represents intensity
image(1:10,161:236,as.matrix(pData[1:10,161:236]))


# Slide 167 - Missing values and plots ------------------------------

# Generate some test data
x <- c(NA,NA,NA,4,5,6,7,8,9,10)   # X vector has some NAs
y <- 1:10

# xlim, ylim - observations not in this range will be dropped completely
plot(x,y,pch=19,xlim=c(0,11),ylim=c(0,11))


# Slide 168 - Missing values and plots ------------------------------

x <- rnorm(100)
y <- rnorm(100)
y[x < 0] <- NA    # Insert NAs wherever x < 0

# Notice the TRUE (is NA) box has all negative x values
# and the FALSE (is not NA) box has all positive x values
boxplot(x ~ is.na(y)) # Boxplot splitting x into groups according to is.na(y)


# Slide 170 - Expository graphs: axes -------------------------------

# Label your axes with xlab, ylab and ALWAYS include units
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5,
     xlab="Travel time (min)",ylab="Last 12 month wages (dollars)")


# Slide 171 - Expository graphs: axes larger ------------------------

# Same as above, just make the axes easier to read
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5,
     xlab="Travel time (min)",ylab="Last 12 month wages (dollars)",cex.lab=2,cex.axis=1.5)


# Slide 172 - Expository graphs: legends ----------------------------

plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5,xlab="TT (min)",ylab="Wages (dollars)")

# Use legend() with x,y coords for upper/left corner of legend box 
# Might have to play around with positioning
legend(100,200000,legend="All surveyed",col="blue",pch=19,cex=0.5)


# Slide 173 - Expository graphs: legends ---------------------------

# Use color to represent 3rd variable: SEX
plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="TT (min)",ylab="Wages (dollars)",col=pData$SEX)

# Use col argument to sync up color coding for sEX and legend
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5))


# Slide 174 - Expository graphs: Titles ----------------------------

# Always use main argument to present title of the graph ... explain well!
plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="CT (min)",
     ylab="Wages (dollars)",col=pData$SEX,main="Wages earned versus commute time")
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5))


# Slide 175 - Expository graphs: Multiple Panels -------------------

# Stacking graphs is common, up to 4 otherwise too hard to read
par(mfrow=c(1,2))

# Histogram
hist(pData$JWMNP,xlab="CT (min)",col="blue",breaks=100,main="")

# Scatterplot with legend
plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="CT (min)",ylab="Wages (dollars)",col=pData$SEX)
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5))

par(mfrow=c(1,1))   # Reset panel argument


# Slide 175 (additional) - Adding text -----------------------------

par(mfrow=c(1,2))
hist(pData$JWMNP,xlab="CT (min)",col="blue",breaks=100,main="")
# Adding figure designation (a)
mtext(text="Figure (a)",side=3,line=1)

plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="CT (min)",ylab="Wages (dollars)",col=pData$SEX)
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5))
# Adding figure designation (b)
mtext(text="Figure (b)",side=3,line=1)

par(mfrow=c(1,1))   # Reset panel argument

# Slide 175 (additional) - Creating a PDF --------------------------

pdf(file="twoPanel.pdf",height=4,width=8)
par(mfrow=c(1,2))
hist(pData$JWMNP,xlab="CT (min)",col="blue",breaks=100,main="")
mtext(text="(a)",side=3,line=1)
plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="CT (min)",ylab="Wages (dollars)",col=pData$SEX)
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5))
mtext(text="(b)",side=3,line=1)
dev.off()

# Slide 175 (additional) - Creating a PNG --------------------------

png(file="twoPanel.png",height=480,width=(2*480))
par(mfrow=c(1,2))
hist(pData$JWMNP,xlab="CT (min)",col="blue",breaks=100,main="")
mtext(text="(a)",side=3,line=1)
plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="CT (min)",ylab="Wages (dollars)",col=pData$SEX)
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5))
mtext(text="(b)",side=3,line=1)
dev.off()



# Slide 176 - Linear Regression -----------------------------------

install.packages("UsingR")
library(UsingR)

data(galton)        # 928x2 just two variables: child height, parent height
summary(galton)     # Get familiar with data

# Do some EDA
par(mfrow=c(1,2))
hist(galton$child,col="blue",breaks=100)
hist(galton$parent,col="blue",breaks=100)
par(mfrow=c(1,1))

# Slide 177 - Linear Regression -----------------------------------

# Distribution of the child heights
hist(galton$child,col="blue",breaks=100)


# Slide 178 - Linear Regression -----------------------------------

hist(galton$child,col="blue",breaks=100)

# Add a mean line to the histogram. The mean shows where the distribution
# is centered.
meanChild <- mean(galton$child)
lines(rep(meanChild,100),seq(0,150,length=100),col="red",lwd=5)


# Slide 179 - Linear Regression ----------------------------------

# Scatterplot to see how data might be related. 
# An oval shaped cloud implied there might be a relationship
# NOTE: each point on the graph could actually be several stacked up pts.
plot(galton$parent,galton$child,pch=19,col="blue")


# Slide 180 - Linear Regression -----------------------------------

plot(galton$parent,galton$child,pch=19,col="blue")

# Say we know average parent = 65 inches tall, then what is child height?
# Subset 89 rows where parent height is "close to" 65
near65 <- galton[abs(galton$parent - 65)<1, ]

# Plot the subset as red dots
points(near65$parent,near65$child,pch=19,col="red")

# Draw reference line in red: x coords: 64-66, y coords: subset child hts
lines(seq(64,66,length=100),rep(mean(near65$child),100),col="red",lwd=4)


# Slide 181 - Linear Regression -----------------------------------

plot(galton$parent,galton$child,pch=19,col="blue")

# Say - average parent = 71 inches tall, then what is child height?
near71 <- galton[abs(galton$parent - 71)<1, ]
points(near71$parent,near71$child,pch=19,col="red")
lines(seq(70,72,length=100),rep(mean(near71$child),100),col="red",lwd=4)


# Slide 182 - Linear Regression ----------------------------------

plot(galton$parent,galton$child,pch=19,col="blue")

# Fit a linear model using basic least squares
# Allows you to predict child given parent
lm1 <- lm(galton$child ~ galton$parent)

# Draw the regression line through the distribution
lines(galton$parent,lm1$fitted,col="red",lwd=3)

summary(lm1)
names(lm1)

lm1$coeff

# Can use the trained linear model to preduct new child heights
# For parent = 60
predict_child <- lm1$coeff[1] + 60 * lm1$coeff[2]
predict_child
(Intercept) 
62.71897 


# Slide 183 - Linear Regression ----------------------------------

par(mfrow=c(1,2))
plot(galton$parent,galton$child,pch=19,col="blue")
lines(galton$parent,lm1$fitted,col="red",lwd=3)

# Residuals plot - shoudl all be centered around 0 line
# Residuals are the distances between the actual points and the 
# regression line. 
plot(galton$parent,lm1$residuals,col="blue",pch=19)
abline(c(0,0),col="red",lwd=3)


# Slide 187 - K-means clustering --------------------------

set.seed(1234)    # Seed, for reproducible results

par(mar=c(0,0,0,0))   # No margin, c(bottom,left,top,right)

# Create a simulated data set
# Actually two vectors x, y for coordinates of plot
# Using mean and sd args we have created 3 clusters

# NOTE: experiment with different mean and sd to see effect!
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)

# Scatterplot of data
plot(x,y,col="blue",pch=19,cex=2)

# Display integer labels (12) to the upper-right of the dot
text(x+0.05,y+0.05,labels=as.character(1:12))


# Slide 193 - K-means clustering --------------------------

dataFrame <- data.frame(x,y)

# You choose 3 centroids
# YOu can also define the max # of iterations the algorithm is to 
# perform just in case it doesn't converge. Defaults for iter.max is 10
kmeansObj <- kmeans(dataFrame,centers=3)

names(kmeansObj)   # List components of the kmeans object
[1] "cluster"      "centers"      "totss"        "withinss"    
[5] "tot.withinss" "betweenss"    "size"         "iter"        
[9] "ifault" 

# Which cluster each data point has been assigned to. 
kmeansObj$cluster    # Grouping numbers of data points
[1] 3 3 3 3 1 1 1 1 2 2 2 2

# K-means is not a deterministic algorithm. If you use the exact same
# data set with different starting centroids, it may converge to a 
# different set of clusters. So you can use the nstart arg to take
# an average. 


# Slide 194 K-means clustering ---------------------------

par(mar=rep(0.2,4))    # Set margins

# Use col arg for coloring clusters
# Use pch for the plot symbol to use (use ? pch)
# Use cex for symbol magnification (default 1)
plot(x,y,col=kmeansObj$cluster,pch=19,cex=2)

# Use centers component of kmeans object - matrix of cluster centers
kmeansObj$centers    # 3x2 matrix: x column, y column

# pch=3 is a "+" symbol, and cex=3 magnifies it. 
# lwd arg is for line width for drawing symbols
points(kmeansObj$centers,col=1:3,pch=3,cex=3,lwd=3)

