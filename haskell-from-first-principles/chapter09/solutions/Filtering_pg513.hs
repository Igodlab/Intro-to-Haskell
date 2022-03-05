module Filtering where
 

-- 1. Given `filter`, how might we write a filter function that would give us all the multiples of 3 out of a list from 1-30?
multiplesOf3 = filter (\x -> x `mod` 3 == 0) [1..30]
 
  
-- 2. Recalling what we learned about function composition, how could we compose the above function with the length function to tell us *how many* multiples of 3 there are between 1 and 30?
lenMultiplesOf3 = length . filter (\x -> x `mod` 3 == 0) $ [1..3]
 
 
-- 3. Next we’re going to work on removing all articles (’the’, ’a’, and ’an’) from sentences. You want to get to something that works like this: 
-- 
-- Prelude> myFilter "the brown dog was a goof"
-- ["brown","dog","was","goof"]
-- 
-- 
-- You may recall that earlier in this chapter we asked you to write a function that separates a string into a list of strings by separating them at spaces. That is a standard library function called words. You may consider starting this exercise by using words (or your version, of course). 
-- 
-- copying `myWords` function from ./PoemLines_pg474.hs
myWords :: Char -> String -> [String]
myWords p x = case dropWhile isP x of
                "" -> []
                x' -> let (w, xs) = break isP x'
                      in w : myWords p xs
  where
    isP = (==) p -- p is a predicate or Char that triggers split

noArticles :: String -> [String]
noArticles = filter (not . arts) . myWords ' '
  where
    arts :: String -> Bool
    arts = \a -> a == "the" ||
                 a == "a"   ||
                 a == "and" ||
                 a == "an" 


