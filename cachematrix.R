## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix is a function used to create a special object that stores a matrix and caches its inverse. 
The following function set and then get the value of the matrix, set and get the value of its inverse.

makeCacheMatrix <- function(m = matrix()) {
  inverseMatrix <- NULL
  set <- function(y) {
    m <<- y
    inverseMatrix <<- NULL
  }
  get <- function() m
  setinverse <- function(inverse) inverseMatrix <<- inverse
  getinverse <- function() inverseMatrix
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## Write a short comment describing this function

cacheSolve is a function that retrieves the inverse of the matrix creates with makeCacheMatrix from the cache.


cacheSolve <- function(m, ...) {
  inverseMatrix <- m$getinverse()
  if(!is.null(inverseMatrix)) {
    message("getting cached data.")
    return(inverseMatrix)
  }
  data <- m$get()
  inverseMatrix <- solve(data)
  m$setinverse(inverseMatrix)
  inverseMatrix
}


EXAMPLE

> m<-matrix(c(1,4,2,5),2,2)
> n = makeCacheMatrix(x)
> n$get()
     [,1] [,2]
[1,]    1    2
[2,]    3    4
> cacheSolve(n)
     [,1] [,2]
[1,] -2.0  1.0
[2,]  1.5 -0.5
> 
