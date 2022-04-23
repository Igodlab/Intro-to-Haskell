module Listy where

import qualified ListyInstances as LI

newtype Listy a = Listy [a] deriving (Eq, Show)

instance Monoid (Listy a) where
    mempty = Listy []

instance Semigroup (Listy a) where
    (<>) (Listy l) (Listy l') = Listy $ (l <> l')
