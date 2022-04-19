module MatchTheTypes where

import Data.List (sort)

-- 1. For the following definition.
i :: Num a => a
i = 1
-- b) Try replacing the type signature with the following: i :: a
-- # Ans: Not possible, there is no instance Num for a parametrically polymorphic variable `a`

-- 2.
f2 :: Float
f2 = 1.0
-- b) f :: Num a => a
-- # Ans: Not possible, because `1.0` doesn’t have instances that Num imposes eg. Int.


-- 3.
f3 :: Float
f3 = 1.0
-- b) f :: Fractional a => a
-- # Ans: It works


-- 4. Hint for the following: type :info RealFrac in your REPL.
f4 :: Float
f4 = 1.0
-- b) f :: RealFrac a => a
-- # Ans: It works because RealFrac inherits from Fractional.

-- 5.
freud :: a -> a
freud x = x
-- b) freud :: Ord a => a -> a
-- # Ans: It works but now `a` in more ad-hoc constrained to Ord typeclass

-- 6.
freud' :: a -> a
freud' x = x
-- b) freud' :: Int -> Int
-- # Ans: It works, we are just making `a` a concrete type

-- 7.
myX7 = 1 :: Int
sigmund :: Int -> Int
sigmund x = myX7
-- b) sigmund :: a -> a
-- # Ans: It doesn’t work, the interpreter expects a parametrically polymorphic variable in sigmund definition rather than Int. But if the definition is `sigmund x = x` then we can pass `myX7` as an argument and it will work.

-- 8.
myX8 = 1 :: Int
sigmund' :: Int -> Int
sigmund' x = myX8
-- b) sigmund' :: Num a => a -> a
-- # Ans: It won't work, because the interpreter expects a polymorphic value that has instance of Num. 

-- 9. You’ll need to import sort from Data.List.
jung :: Ord a => [a] -> a
jung xs = head (sort xs)
-- b) jung :: [Int] -> Int
-- # Ans: It will work, because we are simply making our values concrete and Int has instances of Ord.

-- 10.
young :: [Char] -> Char
young xs = head (sort xs)
-- b) young :: Ord a => [a] -> a
-- # Ans: it also works, this is the inverse case than prob 9. Now we are extending polymorphism of variables constrained only by the Ord typeclass.

-- 11.
mySort :: [Char] -> [Char]
mySort = sort
signifier :: [Char] -> Char
signifier xs = head (mySort xs)
-- b) signifier :: Ord a => [a] -> a
-- # Ans: It will not work, because unlike `sort`, `mySort` only works with concrete types [Char].
