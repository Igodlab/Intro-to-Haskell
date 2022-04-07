module AsPatterns where

import qualified Data.Char as DC

-- As-patterns in Haskell are a nifty way to be able to pattern match on part of something and still refer to the entire original value. Some examples:
--
-- f :: Show a => (a, b) -> IO (a, b)
-- f t@(a, _) = do
-- print a
-- return t
--
-- Use as-patterns in implementing the following functions:
--
-- 1. This should return True if (and only if) all the values in the first list appear in the second list, though they need not be contiguous.
--
isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf xt@(x:xs) yt@(y:ys)
    | x == y    = isSubseqOf xs ys
    | otherwise = isSubseqOf xt ys

-- The following are examples of how this function should work:
--
-- Prelude> isSubseqOf "blah" "blahwoot"
-- True
-- Prelude> isSubseqOf "blah" "wootblah"
-- True
-- Prelude> isSubseqOf "blah" "wboloath"
-- True
-- Prelude> isSubseqOf "blah" "wootbla"
-- False
-- Prelude> isSubseqOf "blah" "halbwoot"
-- False
-- Prelude> isSubseqOf "blah" "blawhoot"
-- True
--
-- Remember that the sub-sequence has to be in the original order!

-- 2. Split a sentence into words, then tuple each word with the capitalized form of each.
capitalizeWords :: String -> [(String, String)] 
capitalizeWords [] = []
capitalizeWords xs = map (\xt@(x:xs) -> (xt, DC.toUpper x : xs)) splitWords
  where
    splitWords = words xs

-- Prelude> capitalizeWords "hello world"
-- [("hello", "Hello"), ("world", "World")]
