module Cipher where

import qualified Data.Char as DC

-- Caesar cipher
caesarCharEncode :: Int -> DC.Char -> DC.Char
caesarCharEncode 0 x = x 
caesarCharEncode n x | not $ DC.isAlpha x        = x 
                 | xLow == 'z' && pm == (-1) = caesarCharEncode (n + pm) (isCap 'a')
                 | xLow == 'a' && pm == 1    = caesarCharEncode (n + pm) (isCap 'z')
                 | otherwise                 = caesarCharEncode (n + pm) $ (isCap . shift) x
  where
    xLow        = DC.toLower x
    isCap       = if (DC.isLower x) then DC.toLower else DC.toUpper
    (pm, shift) = if n >= 0 then (-1, succ) else (1, pred)


caesarCharDecode :: Int -> DC.Char -> DC.Char
caesarCharDecode n = caesarCharEncode $ negate n 

caesarEncode :: Int -> [DC.Char] -> [DC.Char]
caesarEncode n = map $ caesarCharEncode n

caesarDecode :: Int -> [DC.Char] -> [DC.Char]
caesarDecode n = map $ caesarCharDecode n

-- Vignere cipher
vignereCharEncode :: DC.Char -> DC.Char -> DC.Char
vignereCharEncode n x | not $ DC.isAlpha x = x
                      | otherwise          = let lw = length ['a'..(DC.toLower n)] - 1
                                             in caesarCharEncode lw x
  where
    lw = length ['a'..(DC.toLower x)] - 1

vignereEncode :: [DC.Char] -> [DC.Char] -> [DC.Char]
vignereEncode x y = x ++ y
