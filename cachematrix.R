## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

    m <- NULL

## sets inverse to NULL--ready to receive a future value

    set <- function(y) {
        x <<- y
        m <<- NULL
    }

## creates function to set matrix, x, to new matrix, y--resets inverse, m, to NULL

    get <- function() x

## returns matrix, x

    setinverse <- function(inverse) m <<- inverse

## sets inverse, m, to inverse

    getinverse <- function() m

## returns the inverse, m

    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

## returns list containing all functions defined

}
##  This function computes the inverse of the special "matrix" returned by 

makeCacheMatrix above. If the inverse has already been calculated (and the matrix 

has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {


## function calculates inverse of matrix, x

## before that it determines if inverse already has been calculated

## if so, it returns the cached value

m <- x$getinverse()


if(!is.null(m)) {
                message("getting cached data")
                

return(m)
        }


data <- x$get()
     

## if not, it calculates the inverse of the matrix   

m <- solve(data, ...)
        

x$setinverse(m)
        

m


}
