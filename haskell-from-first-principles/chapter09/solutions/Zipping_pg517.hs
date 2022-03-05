module Zipping where

-- 1. Write your own version of zip and ensure it behaves the same as the original.
zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

-- 2. Do what you did for zip, but now for zipWith:
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' p (x:xs) (y:ys) = p x y : zipWith' p xs ys


-- 3. Rewrite your zip in terms of the zipWith' you wrote.
zip'' :: Integral a => [a] -> [a] -> [(a, a)]
zip'' xs ys = zip' (zipWith' tup xs ys) (zipWith' tup ys xs)
  where
    tup = \m n -> m ^ n -- arbitrary operation
