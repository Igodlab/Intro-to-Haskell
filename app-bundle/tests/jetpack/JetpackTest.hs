{-# StandaloneDeriving #-}

import System.Exit (exitFailure)
import Data.List (sort, nub)
import Control.Monad (replicateM, when)
import System.Random 
import System.Random.Stateful (uniformM, uniformRM)

import Jetpack

instance UniformRange Thrust where
    uniformRM (lo, hi) rng = do
        res <- uniformRM (fromEnum lo :: Int, fromEnum hi) rng
        pure $ toEnum res

instance Uniform Thrust where
    uniformM rng = uniformRM (minBound, maxBound) rng

uniformIO :: Uniform a => IO a
uniformIO = getStdRandom uniform

uniformsIO :: Uniform a => Int -> IO [a]
uniformsIO n = replicateM n uniformIO

randomThrusts :: Int -> IO [Thrust]
randomThrusts = randomThrusts 

deriving instance Ord Thrust

testAllThrusts :: [Thrust] -> Bool
testAllThrusts t = and [moves c t == moves c t | c <- everyCoordinate]

main :: IO ()
main = do
    rt <- randomThrusts 11
    when (not $ testAllThrusts)
        exitFailure

