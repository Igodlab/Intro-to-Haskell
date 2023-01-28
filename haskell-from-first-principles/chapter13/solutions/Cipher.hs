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

caesarEncode :: IO () 
caesarEncode = do
    putStrLn "enter an Integer number:"
    nStr <- getLine 
    putStrLn "\nenter your word:"
    w <- getLine
    let n = read nStr :: Int
    putStrLn $ show (map (caesarCharEncode n) w)

caesarDecode :: IO () 
caesarDecode = do
    putStrLn "enter an Integer number:"
    nStr <- getLine 
    putStrLn "\nenter your word:"
    w <- getLine
    let n = read nStr :: Int
    putStrLn $ show (map (caesarCharDecode n) w)

-- Vignere cipher
vignereCharEncode :: DC.Char -> DC.Char -> DC.Char
vignereCharEncode n x | (not $ DC.isAlpha x) ||
                        (not $ DC.isAlpha n) = x
                      | otherwise          = let lw = length ['a'..(DC.toLower n)] - 1
                                             in caesarCharEncode lw x
  where
    lw = length ['a'..(DC.toLower x)] - 1

vignereEncodeInline :: [DC.Char] -> [DC.Char] -> [DC.Char]
vignereEncodeInline key w = iterate keyRep w
  where
    keyRep = take (length w) $ cycle key

    iterate :: [DC.Char] -> [DC.Char] -> [DC.Char]
    iterate _ [] = []
    iterate (k:ks) (x:xs) | x == ' '  = ' ' : iterate (k:ks) xs
                          | otherwise = vignereCharEncode k x : iterate ks xs

vignereEncode :: IO ()
vignereEncode = do
    putStrLn "Enter a key word:"
    k <- getLine
    putStrLn "\nEnter your word:"
    w <- getLine 
    putStrLn $ show (vignereEncodeInline k w)
