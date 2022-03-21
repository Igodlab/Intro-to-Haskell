module PityTheBool
    ( BigSmall
    , NumberOrBool
    ) where

import Data.Int (Int8)

data BigSmall = Big Bool | Small Bool deriving (Eq, Show)

data NumberOrBool = Numba Int8 | BoolyBool Bool deriving (Eq, Show)

myNumba = Numba (-128)


