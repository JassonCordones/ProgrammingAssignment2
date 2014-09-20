## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function creates a special "vector" object that
## really is a list containing a function to set and create
## the value of the matrix and to set and create the value of
## the matrix inverse similar to the makeVector example.

makeCacheMatrix <- function(x = matrix()) 
{
    matrixinverse <- NULL 
    setmatrix <- function(y) 
    {
        x <<- y 
        matrixinverse <<- NULL 
    }
    getmatrix <- function() 
    {
        x 
    }
    setinverse <- function(solve) 
    {
        matrixinverse <<- solve
    }
    getinverse <- function() 
    {
        matrixinverse
    }
    list(setmatrix = setmatrix, getmatrix = getmatrix,
         setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

# This function calculates the inverse of the matrix passed 
# to the function makeCacheMatrix above, but first it checks
# if the inverse have already been calculated. if so it gets 
# the inverse from the cache and skips the computation.Otherwise
# calculates the inverse of the matrix and sets the value of the 
# inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) 
{
    matrixinverse <- x$getinverse() 
    if(!is.null(matrixinverse)) 
    {
        message("getting cached matrix") 
        return(matrixinverse) 
    }
    matrix <- x$getmatrix()  
    matrixinverse <- solve(matrix, ...) 
    x$setinverse(matrixinverse)
    matrixinverse 
        
}
# IT WORKS!!!, IT FREACK*NG WORKS!! WOOO!