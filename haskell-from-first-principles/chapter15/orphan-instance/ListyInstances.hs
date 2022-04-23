module ListyInstances where

import Data.Monoid 

data Listy' a = Listy' [a] deriving (Eq, Show)

instance Monoid (Listy' a) where
    mempty = Listy' []

instance Semigroup (Listy' a) where
    (<>) (Listy' l) (Listy' l') = Listy' $ (l <> l')
