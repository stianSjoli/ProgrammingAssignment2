## Put comments here that give an overall description of what your
## functions do
#used the example in the assignment 

#the function creates a vector of functions "a matrix object", where 
# they manipulate a normal Matrix within the scope of the function 
#because of <<- the inverse calculation will also take effect on x outside the function 

makeCacheMatrix <- function(x = matrix()) {
	inverse <- NULL
	setMatrix <- function(newM) {
		m <<- newM
		inverse <<- NULL
	}
	getMatrix <- function() m
	setInverse <- function(inv) inverse <<- inv
	getInverse <- function() inverse
	c(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse,
		getInverse = getInverse)
}


#The function solves the inverse of x if it is not already calculated. This is an example of memoization 
#if it is already calculated it will go to the else and returned the chached value
#note that I let solve() handle the empty matrix case, which I could have checked for
cacheSolve <- function(x, ...) {
	m <- x$getMatrix()
    inverseMatrix <- x$getInverse()
	if (is.null(inverseMatrix)){
		x$setInverse(solve(m, ...)) #if X is a square invertible matrix, then solve(X) returns its inverse.
        inverseMatrix
	} else inverseMatrix
        ## Return a matrix that is the inverse of 'x'
}
