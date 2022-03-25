module PityTheBool
    ( BigSmall
    , NumberOrBool
    ) where

import Data.Int (Int8)

data BigSmall = Big Bool | Small Bool deriving (Eq, Show)

data NumberOrBool = Numba Int8 | BoolyBool Bool deriving (Eq, Show)

myNumba = Numba (-128)

-- 1. What is the cardinality of this datatype? Hint: We already know Bool’s cardinality. Show your work as demonstrated earlier.
-- # Ans: Cardinality for BiggSmall is 2 + 2 = 4
--
--
-- 2. What is the cardinality of NumberOrBool?
-- # Ans: Cardinality of NumberOrBool is 2^8 + 2 = 258
--
