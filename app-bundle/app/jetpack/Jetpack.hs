{-# LANGUAGE DeriveAnyClass #-}

module Jetpack where

import Data.Map 

class (Eq a, Enum a, Bounded a) => Cyclic a where
    downJerk :: a -> a
    downJerk x
        | x == minBound = maxBound
        | otherwise     = pred x

    upJerk :: a -> a
    upJerk x
        | x == maxBound = minBound
        | otherwise     = succ x

data Thrust = Active | Inactive
    deriving (Eq, Show)

data Vector a = Vector a a 
    deriving (Show, Eq)

data Coordinate = Down | DownForward |  Forward | UpForward | Up
    deriving (Eq, Show, Enum, Bounded, Cyclic)

--instance Semigroup Move where
    


