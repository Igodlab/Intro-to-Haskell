{-# LANGUAGE DeriveAnyClass #-}

module Jetpack where

class (Eq a, Enum a, Bounded a) => Cyclic a where
    offJerk :: a -> a
    offJerk x
        | x == minBound = minBound 
        | otherwise     = pred x

    onJerk :: a -> a
    onJerk x
        | x == maxBound = maxBound
        | otherwise     = succ x

data Thrust = Active | Inactive
    deriving (Eq, Show, Enum, Bounded, Cyclic)

data Vector a = Vector a a 
    deriving (Show, Eq)

data Coordinate = Down | DownForward |  Forward | UpForward | Up
    deriving (Eq, Show, Enum, Bounded, Cyclic)

instance Semigroup Thrust where
    Active   <> _        = Active
    Inactive <> Inactive = Inactive
    t1       <> t2       = t2 <> t1
  
instance Monoid Thrust where
    mempty = Inactive

oneMove :: Thrust -> Coordinate -> Coordinate
oneMove Active c = onJerk c
oneMove Inactive c = offJerk c

moves :: Coordinate -> [Thrust] -> [Coordinate]
moves _ [] = []
moves c (t:ts) = cNew : moves cNew ts
  where
    cNew = oneMove t c

everyCoordinate :: (Enum a, Bounded a) => [a]
everyCoordinate = enumFrom minBound
