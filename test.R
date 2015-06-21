# initialize data
  
  a2_data_1 <- matrix(rnorm(25), 5)
  a2_data_2 <- matrix(rnorm(36), 6)
  a2_data_3 <- matrix(rnorm(81), 9)
  a2_data_4 <- matrix(rnorm(10000), 100)
  
  z1 <- makeCacheMatrix(a2_data_1)
  z2 <- makeCacheMatrix(a2_data_2)
  z3 <- makeCacheMatrix(a2_data_3)
  z4 <- makeCacheMatrix(a2_data_4)

# expect compute
  cacheSolve(z1)
  cacheSolve(z2)

# expect cache hits
  cacheSolve(z1)
  cacheSolve(z2)

# expect compute
  cacheSolve(z3)
  cacheSolve(z4)

# expect cache hits
  cacheSolve(z1)
  cacheSolve(z2)
  cacheSolve(z3)
  cacheSolve(z4)


# actually verify inverse matrices!
  
  z1c <- cacheSolve(z1) %*% z1
  z2c <- cacheSolve(z2) %*% z2
  z3c <- cacheSolve(z3) %*% z3
  z4c <- cacheSolve(z4) %*% z4

