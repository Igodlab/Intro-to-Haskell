module WordNumber where

import Data.List (intercalate)

digitToWord :: Int -> String
-- digitToWord n = undefined
digitToWord = str 
  where
    str 0 = "zero"
    str 1 = "one"
    str 2 = "two"
    str 3 = "three"
    str 4 = "four"
    str 5 = "five"
    str 6 = "six"
    str 7 = "seven"
    str 8 = "eight"
    str 9 = "nine"

digits :: Int -> [Int]
-- digits n = undefined
digits 0 = []
digits n = digits (div n 10) ++ [mod n 10]

wordNumber :: Int -> String
-- wordNumber n = undefined
wordNumber = intercalate " - " . map digitToWord . digits
