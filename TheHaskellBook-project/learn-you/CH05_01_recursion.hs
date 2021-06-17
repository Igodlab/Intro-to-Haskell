-- Learn you a Haskell for good
-- pg 38

-- Chapter 5 RECURSION
-- ------------------------------------------------------------------------------------------


-- Fibonacci with RECURSION

fib :: (Integral a) => a -> a
fib 0 = 0
fib 1 = 1
fib x = fib (x-1) + fib (x-2)

-- -------------------------------------
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
max' :: (Ord a) => a -> a -> a
max' a b
--    | length lst /= 2 = error "list has to contain only two numbers"
    | x > y = x
    | x < y = y
    where x = a
          y = b

maxi'' :: (Ord a) => [a] -> a
maxi'' [] = error "list is empy!"
maxi'' [x] = x
maxi'' (x:xs) = max' x $ maxi'' xs -- maxi2' does the exact same thing as maxi' defined above


-- -------------------------------------
-- recreate `replicate` function, calle it replicate' & replicate2'
replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0 = []
    | otherwise = x:replicate' (n-1) x
    
-- -------------------------------------
-- replicate `take` calle it take' & take2'
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _                                 -- first check that n makes sense 
    | n <= 0 = []
take' _ [] = []                           -- checks if the list is empty
take' n (x:xs) = x:take' (n-1) xs         -- use patterns to start building the list from element 
                                          -- one to the n-th. This avoids evaluating infinte lists
                                          
-- another way to do the same as above                                  
take'' :: (Num i, Ord i) => i -> [a] -> [a]
take'' n x
    | n <= 0 = []
    | otherwise = (head x):take'' (n-1) (tail x)

                                          
-- -------------------------------------
-- recreate `reverse`, calle it reverse' & reverse2'
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

reverse'' :: [a] -> [a]
reverse'' [] = []
reverse'' x = (last x):reverse'' (init x)


-- -------------------------------------
-- recreate `repeat`, call it repeat'
repeat' :: a -> [a]
repeat' x = x:repeat' x

-- --------------------------------------
-- recreate `zip`, calle it zip'
zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs)(y:ys) = (x,y):zip' xs ys


-- --------------------------------------
-- recreate `elem` and calle it elem` & elem2
elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
    | x == a = True
    | otherwise = elem' a xs

elem'' :: (Eq a) => a -> [a] -> Bool
elem'' a [] = False
elem'' a x
    | (head x) == a = True
    | otherwise = elem'' a $ tail x
    
    
    
-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------
-- 5.4 QUICK SORT!

quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (x:xs) = 
    let smallerSorted = quicksort' [a | a <- xs, a <= x]
        biggerSorted = quicksort' [a | a <- xs, a > x]
    in smallerSorted ++ [x] ++ biggerSorted
    
    




