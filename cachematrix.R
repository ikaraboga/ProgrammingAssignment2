## makeCacheMatrix creates a matrix that can cache its inverse

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        
        inv<- NULL ## initialize inversion matrix as NULL
        setMat<- function(y){
                x<<-y        ##set the matrix globally
                inv<<- NULL
        }
        getMat<- function() x  ##get the matrix
        setInv<- function(solveM) inv<<- solveM  ##set the inversed matrix
        getInv<- function() inv   #get the inversed matrix
    list(setMat = setMat, getMat = getMat, setInv = setInv, getInv = getInv)    
        
}
        ##this function returns a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
        inv<- x$getInv() ## assign the inversed matrix value to "inv"
        if (!is.null(inv)){ ## if the value is not null (FALSE) then we have already the inversed matrix use this data 
             message("getting cache matrix")
                return(inv) ## get the value from above function
        } 
       ## makeCacheMatrix(x)
        read<-x$getMat() ##otherwise we don't have the inversed matrix we should do it here
        inv<- solve(read) ## inverse the matrix
          x$setInv(inv) ## Assign the inversed matrix to x
          inv ##
}
