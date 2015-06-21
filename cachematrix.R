## Implementation of assignment2: the following code provides functionality to cache 
## potentially expensive computation of matrix inverse.

## makeCacheMatrix - 
## Wraps a matrix in an object that provides caching functionality for the input's matrix inverse 
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## cacheSolve
## Returns the matrix inverse of a cache-enabled matrix as implemented by 'makeCacheMatrix';  if available
## the value is retrieved from the cache, otherwise it's computed and cached.
## Assumes the original matrix a is square invertible matrix, returns error otherwise.
## 
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)) {
    # cached result available, return it
    message("getting cached data")
    return(inv)
  }
  # no cache hit, compute and cache
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  inv
}
