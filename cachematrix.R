## Cache inverse of matrix and return it


## create list of scoping options

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) s <<- inverse
    getinverse <- function() s
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## check to see if inverse is cached. if so, return, if not, compute and return. 

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    s <- x$getinverse()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    data <- x$get()
    s <- solve(data)
    x$setinverse(s)
    s
}
