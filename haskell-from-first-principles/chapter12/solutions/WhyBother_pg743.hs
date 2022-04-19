module WhyBother where

import Data.List

mehSum :: Num a => [a] -> a 
mehSum xs = go 0 xs
  where
    go :: Num a => a -> [a] -> a
    go n [] = n
    go n (x:xs) = (go (n + x) xs)
