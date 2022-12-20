module Main (main) where

import Control.Monad (forever)   -- [1]
import Data.Char (toLower)       -- [2]
import Data.Maybe (isJust)       -- [3]
import Data.List (intersperse)   -- [4]
import System.Exit (exitSuccess) -- [5]
import System.Random (randomRIO) -- [6]



main :: IO ()
main = do
    word <- randomWord'
    runGame $ puzzle word
  where
    puzzle w = freshPuzzle (fmap toLower w)


newtype WordList = WordList [String] deriving (Eq, Show)

allWords :: IO WordList
allWords = do 
    dict <- readFile "data/dict.txt"
    return $ WordList (lines dict)

minWordLen :: Int
minWordLen = 4

maxWordLen :: Int
maxWordLen = 9

gameWords :: IO WordList 
gameWords = do 
    (WordList aw) <- allWords
    return $ WordList (filter gameLen aw)
      where
        gameLen w = let l = length (w :: String)
                    in l >= minWordLen && l < maxWordLen 

randomWord :: WordList -> IO String
randomWord (WordList wl) = do 
    randIx <- randomRIO (0, length wl - 1)
    return $ wl !! randIx

randomWord' :: IO String
randomWord' = gameWords >>= randomWord

data Puzzle = Puzzle String [Maybe Char] [Char]

instance Show Puzzle where
    show (Puzzle _ discovered guessed) = (intersperse ' ' $ fmap renderPuzzleChar discovered) ++ "\nGuessed so far: " ++ guessed

freshPuzzle :: String -> Puzzle
freshPuzzle st = let lw  = length st
                     rep = replicate lw Nothing
                 in Puzzle st rep []

charInWord :: Puzzle -> Char -> Bool
charInWord (Puzzle st _ _) c = elem c st

alreadyGuessed :: Puzzle -> Char -> Bool
alreadyGuessed (Puzzle _ _ guess) c = elem c guess

renderPuzzleChar :: Maybe Char -> Char 
renderPuzzleChar Nothing = '_'
renderPuzzleChar (Just c) = c

fillInCharacter :: Puzzle -> Char -> Puzzle
fillInCharacter (Puzzle st disc guess) c = Puzzle st newFilledInSoFar (c:guess)
  where
    zipper guessed wordChar guessChar = 
        if wordChar == guessed 
        then Just wordChar
        else guessChar

    newFilledInSoFar = zipWith (zipper c) st disc

handleGuess :: Puzzle -> Char -> IO Puzzle
handleGuess puzzle guess = do
    putStrLn $ "Your guess was: " ++ [guess]
    case (charInWord puzzle guess
        , alreadyGuessed puzzle guess) of
            (_, True) -> do
                putStrLn "You already guessed that character, pick something else!"
                return puzzle
            (True, _) -> do
                putStrLn "This character was in the word, filling in the word accordingly"
                return (fillInCharacter puzzle guess)
            (False, _) -> do
                putStrLn "This character wasn't in the word, try again."
                return (fillInCharacter puzzle guess)

gameOver :: Puzzle -> IO ()
gameOver (Puzzle wordToGuess _ guessed) =
    if (length guessed) > 17 then
        do putStrLn "You lose!"
           putStrLn $ "The word was: " ++ wordToGuess
           exitSuccess
    else return ()

gameWin :: Puzzle -> IO ()
gameWin puzzle@(Puzzle _ filledInSoFar _) = 
    if all isJust filledInSoFar then
        do putStrLn $ "Completed puzzle is: " ++ show puzzle
           putStrLn "You WIN!!!"
           exitSuccess 
    else return ()

runGame :: Puzzle -> IO ()
runGame puzzle = forever $ do 
    gameOver puzzle
    gameWin puzzle
    putStrLn $ "Current puzzle is: " ++ show puzzle
    putStr "Guess a letter: "
    guess <- getLine
    case guess of 
        [c] -> handleGuess puzzle c >>= runGame
        _   -> putStrLn "Your guess must be a single character"

