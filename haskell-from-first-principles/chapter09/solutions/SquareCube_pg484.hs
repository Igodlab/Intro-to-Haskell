module SquareCube where

-- Given the following:
mySqr = [x^2 | x <- [1..5]]
myCube = [y^3 | y <- [1..5]]
 
-- 1. First write an expression that will make tuples of the outputs of mySqr and myCube.
makeTuples = [(sqr, cube) | sqr <- mySqr, cube <- myCube]


-- 2. Now alter that expression so that it only uses the x and y values that are less than 50.
lessThan50 = [(sqr, cube) | sqr <- mySqr, cube <- myCube, cube < 50 && sqr < 50]


-- 3. Apply another function to that list comprehension to determine how many tuples inhabit your output list.
nTuples :: Num a => [(a, a)] -> Int
nTuples xs = length xs
