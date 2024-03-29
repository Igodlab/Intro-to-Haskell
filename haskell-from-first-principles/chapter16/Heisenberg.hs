module Heisenberg where

data Two a b = Two a b deriving (Eq, Show)

data Or a b = First a | Second b deriving (Eq, Show)


instance Functor (Or b) where
    fmap _ (First a)  = First a
    fmap f (Second b) = Second (f b)

instance Functor (Two a) where
    fmap f (Two a b) = Two a (f b)
