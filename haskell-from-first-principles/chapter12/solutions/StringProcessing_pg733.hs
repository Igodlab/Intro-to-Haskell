module StringProcessing where

import Data.Char (isAlpha)
-- 1. Write a recursive function named replaceThe which takes a text/string, breaks it into words and replaces each instance of “the” with “a”. It’s intended only to replace exactly the word “the”. notThe is a suggested helper function for accomplishing this.
-- 
-- example GHCi session
-- above the functions
-- >>> notThe "the"
-- Nothing
-- >>> notThe "blahtheblah"
-- Just "blahtheblah"
-- >>> notThe "woot"
-- Just "woot"

notThe :: String -> Maybe String
notThe xs | xs == "the" = Nothing
          | otherwise   = Just xs

-- >>> replaceThe "the cow loves us"
-- "a cow loves us"
replaceThe :: String -> String
replaceThe [] = []
replaceThe st = case x of
                  Nothing  -> "a " ++ replaceThe xs
                  (Just z) -> z ++ " " ++ replaceThe xs
  where
    wordsX  = words st
    x = (notThe . head) wordsX
    xs = concatMap (++ " ") $ tail wordsX


-- 2. Write a recursive function that takes a text/string, breaks it into words, and counts the number of instances of ”the” followed by a vowel-initial word.
-- 
-- >>> countTheBeforeVowel "the cow"
-- 0
-- >>> countTheBeforeVowel "the evil cow"
-- 1
--
countTheBeforeVowel :: String -> Integer
countTheBeforeVowel [] = 0
countTheBeforeVowel st 
    | x == Nothing && length wordsX <= 1 = 0
    | x == Nothing && elem (head xs) "aeiouAEIOU" = 1 + countTheBeforeVowel xs
    | otherwise = 0 + countTheBeforeVowel xs
  where
    wordsX  = words st
    x  = (notThe . head) wordsX
    xs = concatMap (++ " ") $ tail wordsX
                    

-- 3. Return the number of letters that are vowels in a word. Hint: it’s helpful to break this into steps. Add any helper functions necessary to achieve your objectives.
--
-- a) Test for vowelhood
-- b) Return the vowels of a string
-- c) Count the number of elements returned
--
-- >>> countVowels "the cow"
-- 2
-- >>> countVowels "Mikolajczak"
-- 4

countVowels :: String -> Integer
countVowels = foldr (\x acc -> if elem x "aeiouAEIOU" then acc + 1 else acc) 0 



