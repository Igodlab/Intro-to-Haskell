module Palindromes where

import Control.Monad
import Data.Char (isAlpha, toLower)
import System.Exit 

palindrome :: IO ()
palindrome = forever $ do
    line1 <- getLine
    let lowCap = map toLower line1 
        clean = cleanLn1 lowCap
    case (clean == reverse clean) of
        True -> putStrLn "It's a palindrome!"
        False -> do putStrLn "Nope!"
                    exitSuccess
  where
    cleanLn1 [] = []
    cleanLn1 (x:xs) | not $ isAlpha x = cleanLn1 xs
                    | otherwise       = x : cleanLn1 xs

