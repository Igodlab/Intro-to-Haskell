-- Learn you a Haskell for good
-- pg 38

-- Chapter 5 RECURSION
-- ------------------------------------------------------------------------------------------


-- Fibonacci with RECURSION

fib :: (Integral a) => a -> a
fib 0 = 0
fib 1 = 1
fib x = fib (x-1) + fib (x-2)

-- -----------------------------------------------------------------------------------------------
-- recreate maximum value from list
-- recreate `max`, call it max' & mx2'
maxi' :: (Ord h) => [h] -> h
maxi' [] = error "Not expecting empty list"
maxi' [q] = q
maxi' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maxi' xs
    
    
-- playing more with a function that returns the maximum value
-- @mm is an auxiliary function that does the same thing as max
max' :: (Ord a) => [a] -> a
max' lst
    | length lst /= 2 = error "list has to contain only two numbers"
    | x > y = x
    | x < y = y
    where x = head lst
          y = last lst

maxi2' :: (Ord a) => [a] -> a
maxi2' [] = error "list is empy!"
maxi2' [x] = x
maxi2' (x:xs) = max' [x, maxi2' xs] -- maxi2' does the exact same thing as maxi' defined above


-- --------------------------------------------------------------------------------------------------
-- recreate `replicate` function, calle it replicate' & replicate2'

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0 = []
    | otherwise = x:replicate' (n-1) x
    
-- --------------------------------------------------------------------------------------------------
    
-- replicate `take` calle it take' & take2'
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _                                 -- first check that n makes sense 
    | n <= 0 = []
take' _ [] = []                           -- checks if the list is empty
take' n (x:xs) = x:take' (n-1) xs         -- use patterns to start building the list from element 
                                          -- one to the n-th. This avoids evaluating infinte lists
                                          
-- another way to do the same as above                                  
take2' :: (Num i, Ord i) => i -> [a] -> [a]
take2' n x
    | n <= 0 = []
    | otherwise = (head x):take2' (n-1) (tail x)

                                          
-- --------------------------------------------------------------------------------------------------
-- recreate `reverse`, calle it reverse' & reverse2'

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

reverse2' :: [a] -> [a]
reverse2' [] = []
reverse2' x = (last x):reverse2' (init x)


-- ------------------------------------------------------------------------------------------------
-- recreate `repeat`, call it repeat' & repeat2'
    



