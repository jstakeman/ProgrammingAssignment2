## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## makeCacheMatrix makes a list capable of holding a matrix and getting or setting it's inverse

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
      x <<- y
      inverse <<- NULL
    }
    get <- function() x
    setInverse <- function(i) inverse <<- i
    getInverse <- function() inverse
    list( set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}



## cacheSolve gets the inverse if it is available and calculates and sets the inverse if it is not

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getInverse()
        if(!is.null(i)) {
          message('getting cached data')
          return(i)
        }
        i <- solve(x$get)
        x$setInverse(i)
        i
}
