## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
   inv_matrix <- NULL
   get <- function() x
   set <- function(y) {
     x <<- y
     inv_matrix <<- NULL 
   }
   get_inv_matrix <- function() inv_matrix
   set_inv_matrix <- function(inv_m) inv_matrix <<- inv_m
   list(get=get, set=set, set_inv_matrix=set_inv_matrix, get_inv_matrix=get_inv_matrix)
}


## Write a short comment describing this function

cacheSolve <- function(cached_matrix, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv_matrix <- cached_matrix$get_inv_matrix()
  if (!is.null(inv_matrix)) {
    #print("getting caced")
    message("getting cached data")
    return(inv_matrix)
  }
  message("Not getting caced data")
  cached_matrix$set_inv_matrix(solve(cached_matrix$get()))
  cached_matrix$get_inv_matrix()
}

raw_matrix=rbind(c(1, -1/4), c(-1/4, 1)) 
cached_matrix <- makeCacheMatrix(raw_matrix)
cacheSolve(cached_matrix)
cacheSolve(cached_matrix)

