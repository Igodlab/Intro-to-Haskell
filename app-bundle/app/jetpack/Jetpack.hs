{-# LANGUAGE DeriveAnyClass #-}

import Data.Map 

module Jetpack where

-- class (Eq a, Enum a, Bounded a) => Spin a where

data Thrust = Active | Inactive
    deriving (Eq, Show, Enum, Bounded, Cyclic)

data Vector a = Vector a a 
    deriving (Show, Eq, Read)

data Coordinate = Down | Forward | Up
    deriving (Eq, Show, Enum, Bounded)

data Move = (Coordinate, Coordinate)
    deriving (Show, Eq, Enum, Bounded)

--instance Semigroup Move where
    


