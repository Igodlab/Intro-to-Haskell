module Lookups where

import Data.List (elemIndex)

import GHC.Base (liftA2)

-- In the following exercises you will need to use the following terms to make the expressions typecheck:
--
-- 1. pure
-- 2. (<$>)
-- -- or fmap
-- 3. (<*>)
-- Make the following expressions typecheck.
--
--1. 
added :: Maybe Integer
added = fmap (+3) (lookup 3 $ zip [1, 2, 3] [4, 5, 6])


-- 2. 
y2 :: Maybe Integer
y2 = lookup 3 $ zip [1, 2, 3] [4, 5, 6]

z2 :: Maybe Integer
z2 = lookup 2 $ zip [1, 2, 3] [4, 5, 6]

tupled :: Maybe (Integer, Integer)
tupled = (,) <$> y2 <*> z2

tupled' :: Maybe (Integer, Integer)
tupled' = liftA2 (,) y2 z2

-- 3. 
x3 :: Maybe Int
x3 = elemIndex 3 [1, 2, 3, 4, 5]

y3 :: Maybe Int
y3 = elemIndex 4 [1, 2, 3, 4, 5]

max' :: Int -> Int -> Int
max' = max

maxed :: Maybe Int
maxed = max' <$> x3 <*> y3

maxed' :: Maybe Int
maxed' = liftA2 max' x3 y3

-- 4. 
xs = [1, 2, 3]
ys = [4, 5, 6]

x4 :: Maybe Integer
x4 = lookup 3 $ zip xs ys

y4 :: Maybe Integer
y4 = lookup 2 $ zip xs ys

summed :: Maybe Integer
summed = fmap sum $ (,) <$> x4 <*> y4
