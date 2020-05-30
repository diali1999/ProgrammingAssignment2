## Put comments here that give an overall description of what your
## functions do

## this function creates a special type of matrix, setinv sets the inverse of the matrix, getinv gets the inverse

makeCacheMatrix <- function(x = matrix()) {
 m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## This function returns inverse of the matrix from above.It first checks whether inverse is already calculated.If so,it gets the inverse from cache.

cacheSolve <- function(x, ...) {
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
