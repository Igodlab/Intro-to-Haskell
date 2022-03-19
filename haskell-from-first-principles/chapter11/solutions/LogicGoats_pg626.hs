{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module LogicGoats where

class TooMany a where
    tooMany :: a -> Bool

instance TooMany Int where
    tooMany = flip (<) 42

newtype Goats = Goats Int deriving (Eq, Show, TooMany)


