-- pg. 127
-- Q5 reverse the sentence "Curry is awesome", also create a module
module Reverse where

prob5 :: [Char] -> [Char]
prob5 w = concat [(drop 9 w), take 4 (drop 5 w), (take 5 w)]
  
main :: IO()
main = print (prob5 "Curry is awesome")
