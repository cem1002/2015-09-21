# "Fun" with vectors...
x <- c(1, 3, 5)
c(1, 3, 5) -> x  # Seems stupid, but...
x
x[1]
x[c(1, 2)]
x[1:2]  # However, direct access to elements is the hallmark of a MATLAB user
x==3
x[x==3]
x==3 | x==5 
x %in% c(3,5)
x==3 & x==5
x + 100
x^2
x + x
y <- c(2,4)
y
x + y # "Recycling" - not often actually useful!

# T and F can be used, but not a good idea. Note that TRUE and FALSE in a
# numeric context are equal to 1 and 0
z <- c(TRUE, FALSE, FALSE) 
sum(x == 3 | z) 

# Other special values: NA, Inf, NaN
1/0
0/0 # NaN often produces a warning, but not always
x2 <- c(1,2,3, NA, NaN)
mean(x2)
mean(x2, na.rm=TRUE) # NaN ignored in calculations. NA may or may not be.

# Matrices - not directly used very much by us. 
A <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)
A
A <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow=TRUE)
A
A[2,3] # "Memories of MATLAB" sauce now available at Loblaws.

# Lists are arbitrary collections of objects of various types. List elements can 
# be named, or not. 
foo <- list(some_num = c(3,6,9),
            some_chr = c("Quick", "Brown", "Fox", "Jumped", "Over"),
            c("TRUE", "FALSE"))

foo$some_num    # RECOMMENDED
foo[[1]]        # Use if you want to look like you've been forced to use MATLAB
foo$some_num[2] 
foo[[1]][2]
# Not the same thing!
foo[1]
foo['some_num'][1]

# Data frames are very special lists, in which each list element is a vector of
# the same length. A "dataset". Imported datasets will be data.frames by default

leeds <- read.csv("leeds_accidents.csv")
leeds

# Factor variables
leeds$ref_number

# Can be tricky and lead to difficulties.
(num_as_char <- "42")
as.numeric(num_as_char)  # "Coercion"
as.numeric("Actual string") # Doesn't really make sense: returns NA

leeds$ref_number[1]
as.numeric(leeds$ref_number[1]) # Should return NA?????

# R will try to guess the variable types in imported datasets, but it isn't
# always a good guesser, and will tend to call anything with a non-numeric
# character a "Factor" variable.

# Cleaner approach: import strings as strings and make them factors yourself as
# required.