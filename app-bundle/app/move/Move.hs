{-# LANGUAGE DeriveAnyClass #-}

module Move where

class (Eq a, Enum a, Bounded a) => Spin a where
    
