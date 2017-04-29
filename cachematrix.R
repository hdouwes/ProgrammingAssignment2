## Put comments here that give an overall description of what your
## functions do

## Caching the Inverse of a Matrix

## Write a short comment describing this function

## The following function takes as argument a square invertible matrix m and returns a list of functions:set,get,setinverse,getinverse
## This list is used as the input to the other function cacheSolve()

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(inv) m <<- inv
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}

## Write a short comment describing this function

## The following function computes the inverse of the special "matrix" returned makeCacheMatrix(). 
##If the inverse has already been calculated (and the matrix has not changed), then it retrieves the inverse from the cache.  

CacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m   
}
