module Listy where

import qualified ListyInstances as LI

newtype Listy a = LI.Listy [a] deriving (Eq, Show)

instance Monoid (Listy a) where
    mempty = LI.Listy []

instance Semigroup (Listy a) where
    (<>) (LI.Listy l) (LI.Listy l') = LI.Listy $ (l <> l')
