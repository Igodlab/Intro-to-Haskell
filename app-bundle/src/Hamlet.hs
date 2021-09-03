{-# LANGUAGE OverloadedStrings #-}

import           Data.Char
import           Data.List          (group, sort, sortBy)
import           Data.Ord           
import qualified Data.Text          as T
import qualified Data.Text.IO       as TIO
import           System.Environment
import           Control.Monad      (when)
import           Fmt

type Entry = (T.Text, Int)
type Vocabulary = [Entry]


extractVocab :: T.Text -> Vocabulary
extractVocab t = map buildEntry $ group $ sort ws
  where
    ws = map T.toCaseFold $ filter (not . T.null) $ map (T.dropAround (not . isLetter)) $ T.words t
    buildEntry xs@(x:_) = (x, length xs)
    buildEntry [] = error "unexpected"

wordsCount :: Vocabulary -> (Int, Int)
wordsCount v = (sum $ map snd v, length v)

wordsByFrequency :: Vocabulary -> Vocabulary
wordsByFrequency = sortBy (comparing $ Down . snd)

allWordsReport :: Vocabulary -> T.Text
allWordsReport v = fmt $ nameF "All the words are \n" $ unlinesF (map fst v)

wordsCountReport :: Vocabulary -> T.Text 
wordsCountReport v = fmt $
    "Total number of words : " +| nWords |+ 
    "\nTotal number of unique words : " +| uWords |+ "\n"
  where 
    (nWords, uWords) = wordsCount v

frequentWordsReport :: Vocabulary -> Int -> T.Text 
frequentWordsReport v nw = 
    fmt $ nameF  "The top words are: "
        $ blockListF' " - " fmtEntry reportData
  where
    reportData = take nw $ wordsByFrequency v
    fmtEntry (t, n) = ""+|t|+": "+|n|+""

processTextFile :: FilePath -> Bool -> Int -> IO ()
processTextFile fp allTrue n = do
    h <- TIO.readFile fp
    let text = extractVocab h
    when allTrue $ TIO.putStrLn $ allWordsReport text
    TIO.putStrLn $ wordsCountReport text
    TIO.putStrLn $ frequentWordsReport text n

main :: IO ()
main = do 
    args <- getArgs 
    case args of
        ["-a", filepath, n] -> processTextFile filepath True (read n)
        [filepath, n]       -> processTextFile filepath False (read n)
        _                   -> putStrLn "Not right input, use: -- -a filepath nLines"
