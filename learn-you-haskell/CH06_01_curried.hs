-- Learn you a Haskell for good
-- pg 44

-- Chapter 6 HIGHER ORDER FUNCTIONS
-- ------------------------------------------------------------------------------------------

-- Haskell functions can take functions as parameters and return functions
-- as return values. A function that does either of those is called a higher
-- order function.

-- 6.1 CURRIED FUNCTIONS
-- some basic of examples currying
multThree :: (Num a) => a -> a -> a -> a
multThree a b c  = a*b*c

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

-- ---------------------------------------------------------------------------------------------------
-- 6.2 HIGHER-ORDERISM 
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

applyThree :: (a -> a) -> a -> a
applyThree f x = f (f (f x))

-- using higher order functions recreate zipWith, calle it zipWith' : 
-- It takes a function and two lists as parameters and then
-- joins the two lists by applying the function between corresponding elements.
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = (f x y):zipWith' f xs ys

-- re-create flip function
-- Flip simply
-- takes a function and returns a function that is like our original function, only the first two    -- arguments are flipped.
flip' :: (a -> b -> f) -> (b -> a -> f)
flip' f = g
    where g x y = f y x

-- ---------------------------------------------------------------------------------------------------
-- 6.3 MAPS & FILTERS (pg. 48)

-- recreate map
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = (f x):map' f xs



-- recreate filter
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
    | f x = x:filter' f xs
    | otherwise = filter' f xs
    
  
-- recreate quicksort from chapter 5, using filter
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort (filter' (<=x) xs)
        biggerSorted = quicksort (filter' (>x) xs)
    in smallerSorted ++ [x] ++ biggerSorted

-- create a function that returns all the divisble numbers
divisibleBy' :: (Integral a) => a -> [a] -> [a]
divisibleBy' _ [] = []
divisibleBy' n (x:xs)
    | x `mod` n == 0 = x:divisibleBy' n xs
    | otherwise = divisibleBy' n xs
    
divisibleBy'' :: (Integral a) => a -> [a] -> [a]
divisibleBy'' _ [] = []
divisibleBy'' n x = filter' f x
  where f xi = xi `mod` n == 0

--    
-- -------------------------------------------------------------------------------------------------
-- 6.4 LAMBDAS


-- 6.5 Only Folds & Horses
-- implement sum using lambdas and foldl
-- a fold takes a binary function that takes two parameters

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc xi -> acc + xi) 0 xs

-- implement left fold
elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\c x -> if x == y then True else c) False ys

mapp' :: (a -> b) -> [a] -> [b]
mapp' f xs = foldr (\x acc -> f x : acc) [] xs

-- 6.7 Function Composition (.)
-- in the ghci try the following:
-- ghci$ map (abs . negate) $ take 12 [-3..]
-- ghci$ map (\xi -> abs . negate xi) $ take 12 [-3..]

-- create a function that returns the sum of all odd squares that are smaller than 10,000
oddSquareSum' :: (Integral a) => [a] -> a
oddSquareSum' x = sum (takeWhile (<10000) (filter odd (map (^2) x)))

oddSquareSum'' :: (Integral a) => [a] -> a
oddSquareSum'' x = sum . takeWhile (<10000) . filter odd . map (^2) $ x

