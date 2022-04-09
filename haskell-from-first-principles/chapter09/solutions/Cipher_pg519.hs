module Cipher where

import qualified Data.Char as DC

-- A Caesar cipher is a simple substitution cipher, in which each letter is replaced by the letter that is a fixed number of places down the alphabet from it. You will find variations on this all over the place — you can shift leftward or rightward, for any number of spaces. A rightward shift of 3 means that ’A’ will become ’D’ and ’B’ will become ’E,’ for example. If you did a leftward shift of 5, then ’a’ would become ’v’ and so forth.
--
-- Your goal in this exercise is to write a basic Caesar cipher  that shifts rightward. You can start by having the number of spaces to shift fixed, but it’s more challenging to write a cipher
--
-- that allows you to vary the number of shifts so that you can encode your secret messages diﬀerently each time. Here are some tips:
--
-- *Cipher> :t chr
-- chr :: Int -> Char
-- *Cipher> :t ord
-- ord :: Char -> Int
--
-- data LowerCase = Char
-- 
-- instance Enum LowerCase where
--     fromEnum 
--     pred 'a' = 'z'
--     succ 'z' = 'a'
--
--
-- encoder:
caesarEncode :: Int -> Char -> Char
caesarEncode 0 x = x
caesarEncode n x | x == 'a' && pm == 1    = caesarEncode (n + pm) 'z'
                 | x == 'z' && pm == (-1) = caesarEncode (n + pm) 'a'
                 | x == 'A' && pm == 1    = caesarEncode (n + pm) 'Z'
                 | x == 'Z' && pm == (-1) = caesarEncode (n + pm) 'A'
                 | otherwise              = caesarEncode (n + pm) (shft x)
  where
    (pm, shft) = if n < 0 then (1, pred) else (-1, succ)

-- decoder:
caesarDecode :: Int -> Char -> Char
caesarDecode 0 x = x
caesarDecode n x | x == 'a' && pm == 1    = caesarDecode (n - pm) 'z'
                 | x == 'z' && pm == (-1) = caesarDecode (n - pm) 'a'
                 | x == 'A' && pm == 1    = caesarDecode (n - pm) 'Z'
                 | x == 'Z' && pm == (-1) = caesarDecode (n - pm) 'A'
                 | otherwise              = caesarDecode (n - pm) (shft x)
  where
    (pm, shft) = if n > 0 then (1, pred) else (-1, succ)
