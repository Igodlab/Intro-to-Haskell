module Scans where

-- Scans Exercises
-- 1. Modify your fibs function to only return the first 20 Fibonacci numbers.
-- 
-- this is the old book example:
fibs :: Int -> Int
fibs 0 = 0
fibs 1 = 1
fibs n = fibs (n - 1) + fibs (n - 2)

fibLst :: Int -> [Int]
fibLst n = take n . tail $ fb
  where
    fb = 1 : scanl (+) 0 fb
-- 
-- try:
-- λ> fibLst 20
-- [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181]


-- 2. Modify fibs to return the Fibonacci numbers that are less than 100.
fibsLessThan100 :: Int -> [Int]
fibsLessThan100 n = filter (< 100) $ fibLst n

-- 3. Try to write the factorial function from Recursion as a scan. You’ll want scanl again, and your start value will be 1. Warning: this will also generate an infinite list, so you
-- may want to pass it through a take function or similar.
--
fact :: Int -> [Int]
fact n = scanl (*) 1 [1..n]
