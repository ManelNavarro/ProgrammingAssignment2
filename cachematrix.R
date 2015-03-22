## Usage:
## 1) create the functions to cache matrix and inverse matrix: 
##      <cache functions vector> <- makeCacheMatrix(<your matrix>)
##
## 2) calculate the matrix inverse and store it in cache or retrieve it from cache, and return it:
##      call function cacheSolve(<cache functions vector>)


## Creates a vector of 4 functions: store matrix, retreive matrix, store inv matrix, retrieve inv matrix

makeCacheMatrix <- function(x = matrix()) {
        invm <- NULL
        set <- function(y) {
                x <<- y
                invm <<- NULL
        }
        get <- function() x
        setinv <- function(inversem) invm <<- inversem
        getinv <- function() invm
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Calculates inverse matrix if it does not exist and stores it in "invm". Otherwise retrieves cached calculation.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invm <- x$getinv()
        if(!is.null(invm)) {
                ##message("getting cached data")
                return(invm)
        }
        data <- x$get()
        invm <- solve(data, ...)
        x$setinv(invm)
        invm
}
