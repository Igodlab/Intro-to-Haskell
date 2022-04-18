module ValidateWord where

import qualified Data.Char as DC

 -- Use the Maybe type to write a function that counts the number of vowels in a string and the number of consonants. If the number of vowels exceeds the number of consonants, the function returns Nothing. In many human languages, vowels rarely exceed the number of consonants so when they do, it may indicate the input isn’t a word (that is, a valid input to your dataset):
 --
 
newtype Word' = Word' String deriving (Eq, Show)

mkWord :: String -> Maybe Word'
mkWord xs | vow > cons = Just (Word' $ show vow)
          | otherwise = Nothing
  where
    vowels = "aeiouAEIUO"
    consonants = foldr (\x acc -> if not (elem x vowels) then x : acc else acc) [] $ ['a'..'z'] ++ ['A'..'Z']

    vow  = countElem vowels xs
    cons = countElem consonants xs

    countElem set ys = foldr (\x acc -> if elem x set then 1 + acc else acc) 0 ys

            
