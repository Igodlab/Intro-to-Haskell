module Palindromes where

import Control.Monad
import Data.Char (isAlpha, toLower)
import System.Exit 

palindrome :: IO ()
palindrome = forever $ do
    line1 <- getLine
    let lowCap = map toLower line1 
        clean = filter isAlpha lowCap
    case (clean == reverse clean) of
        True -> putStrLn "It's a palindrome!"
        False -> do putStrLn "Nope!"
                    exitSuccess
