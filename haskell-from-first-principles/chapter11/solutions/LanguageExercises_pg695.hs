module LanguageExercises where

import qualified Data.Char as DC

-- 1. Write a function that capitalizes a word.
capitalizeWord :: String -> String
capitalizeWord (x:xs) | isAlphabet = DC.toUpper x : xs
                      | otherwise  = x : capitalizeWord xs
                    where
                      isAlphabet = x `elem` ['a'..'z'] || elem x ['A'..'Z']

-- Example output.
--
-- Prelude> capitalizeWord "Chortle"
-- "Chortle"
-- Prelude> capitalizeWord "chortle"
-- "Chortle"
--
--
-- 2. Write a function that capitalizes sentences in a paragraph. Recognize when a new sentence has begun by checking for periods. Reuse the capitalizeWord function.
capitalizeParagraph :: String -> String
capitalizeParagraph [] = []
capitalizeParagraph xs = (concat . map capitalizeWord) $ sentence isDot xs
  where 
    isDot = \x -> if x == '.' then True else False

    sentence :: (Char -> Bool) -> String -> [String] 
    sentence p x = case dropWhile p x of 
                        "" -> []
                        x' -> (sent ++ ['.']) : sentence p x''
                          where
                            (sent, x'') = break p x'

-- Example result you should get from your function:
--
-- Prelude> let s = "blah. woot ha."
-- Prelude> capitalizeParagraph s
-- "Blah. Woot ha."
