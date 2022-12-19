module Main where

import Hello
import DogsRule
import System.IO

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    putStr "Please input your alias soldier: "
    name <- getLine
    sayHello name
    dogs

