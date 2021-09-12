{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE StandaloneDeriving #-}

import Jetpack

import System.Environment (getArgs)
import Fmt


deriving instance Read Coordinate
deriving instance Read Thrust 

instance Buildable Coordinate where
    build DownForward = "|v"
    build Down        = "v"
    build Up          = "^"
    build UpForward   = "|^"
    build Forward     = "->"

jetpackFromFile :: FilePath -> Coordinate -> IO ()
jetpackFromFile fname c = do
    f <- readFile fname
    let thr = map read $ lines f
        cAll = moves c thr
    fmt $ nameF "All coordinates are: " (unwordsF cAll)

main :: IO ()
main = do
    args <- getArgs
    case args of 
        ["-coord", fname, coord] -> jetpackFromFile fname (read coord)
        _                        -> putStrLn "This needs fix"
