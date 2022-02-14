{-# LANGUAGE NoMonomorphismRestriction #-}
-- -- ##################################
-- # page 226: Determine the type
-- # 
-- # see: determineType_pg226.hs

module DetermineTheType where

example = 1

-- 2. Given

x2 = 5
y2 = x2 + 5
w2 = y2 * 10
-- What is the type of w2? 
-- Ans: w2 :: Num a => a


-- 3. Given
x3 = 5
y3 = x3 + 5
z3 y3 = y3 * 10
-- What is the type of z3?
-- Ans: z3 :: Num a => a -> a


-- 4. Given
x4 = 5
y4 = x4 + 5
f4 = 4 / y4
-- What is the type of f4?
-- Ans: f4 :: Fractional a => a


-- 5. Given
x5 = "Julie"
y5 = " <3 "
z5 = "Haskell"
f5 = x5 ++ y5 ++ z5
-- What is the type of f5?
-- Ans: f5 :: [Char]

