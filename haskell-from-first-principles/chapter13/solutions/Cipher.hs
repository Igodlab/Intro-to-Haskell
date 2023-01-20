module Cipher where

import qualified Data.Char as DC

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

