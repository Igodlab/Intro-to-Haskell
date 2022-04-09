module DataChar where

import qualified Data.Char as DC

-- 1. Query the types of isUpper and toUpper.
-- λ> :t DC.isUpper 
-- DC.isUpper :: Char -> Bool
--
-- λ> :t DC.toUpper
-- DC.toUpper :: Char -> Char
--
-- 2. Given the following behaviors, which would we use to write a function that filters all the uppercase letters out of a String? Write that function such that, given the input “HbEfLrLxO,” your function will return “HELLO.” 
--
-- λ> DC.isUpper 'J'
-- True
--
-- λ> DC.toUpper 'j'
-- 'J'
-- 
onlyCapitalLetters :: String -> String
onlyCapitalLetters x = filter DC.isUpper x

-- 3. Write a function that will capitalize the first letter of a string and return the entire string. For example, if given the argument “julie,” it will return “Julie.” 
--
startCapitalized :: String -> String
startCapitalized "" = []
startCapitalized (x:xs) = DC.toUpper x : xs

-- 4. Now make a new version of that function that is recursive such that if you give it the input “woot” it will holler back at you “WOOT.” The type signature won’t change, but you will want to add a base case.
--
capitalizeRecursively :: String -> String
capitalizeRecursively "" = []
capitalizeRecursively (x:xs) = DC.toUpper x : capitalizeRecursively xs

-- 5. To do the final exercise in this section, we’ll need another standard function for lists called head. Query the type of head and experiment with it to see what it does. Now write a function that will capitalize the first letter of a String and return only that letter as the result. 
--
onlyFirstChar :: String -> Char
onlyFirstChar x = DC.toUpper $ head x

-- 6. Cool. Good work. Now rewrite it as a composed function. Then, for fun, rewrite it pointfree.
--
onlyFirstChar' :: String -> Char
onlyFirstChar' = DC.toUpper . head

