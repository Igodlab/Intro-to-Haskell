-- The Haskell Book
--
-- pg. 127 problem 6


module Reverse where

rvrs :: [Char] -> Char
rvrs x = (!!) x 3


main :: IO ()
main = print (rvrs "Curry is awesome")
