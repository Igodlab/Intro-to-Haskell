module Main (main) where

import Control.Monad (forever)   -- [1]
import Data.Char (toLower)       -- [2]
import Data.Maybe (isJust)       -- [3]
import Data.List (intersperse)   -- [4]
import System.Exit (exitSuccess) -- [5]
import System.Random (randomRIO) -- [6]



main :: IO ()
main = do
    undefined


type WordList = [String]

allWords :: IO WordList
allWords = do 
    dict <- readFile "../data/dict.txt"
    return (lines dict)

minWordLen = 5 :: Int
maxWordLen = 9 :: Int

gameWords :: IO WordList 
gameWords = do 
    aw <- allWords
    return (filter gameLen aw)
      where
        gameLen w = let l = length (w :: String)
                    in l >= minWordLen && l < maxWordLen 

randomWord :: WordList -> IO String
randomWord wl = do 
    randIx <- randomRIO (0, length wl - 1)
    return $ wl !! randIx

randomWord' :: IO String
randomWord' = gameWords >>= randomWord

data Puzzle = Puzzle String [Maybe Char] [Char]

instance Show Puzzle where
    show (Puzzle _ discovered guessed) = (intersperse ' ' $ (fmap renderPuzzleChar discovered) ++ "Guessed so far: " ++ guessed)

freshPuzzle :: String -> Puzzle
freshPuzzle = undefined 

chainInWord :: Puzzle -> Char -> Bool
chainInWord = undefined 

alreadyGuessed :: String -> Char -> Bool
alreadyGuessed = undefined

renderPuzzleChar :: Maybe Char -> Char 
renderPuzzleChar = undefined


