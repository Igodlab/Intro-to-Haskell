module DetermineValidFunctor where

import GHC.Arr



-- Determine if a valid Functor can be written for the datatype provided.
--
-- 1. 
data Bool = False | True 

-- 2. 
data BoolAndSomethingElse a = False' a | True' a


-- 3. 
data BoolAndMaybeSomethingElse a = Falsish | Truish a


-- 4. Use the kinds to guide you on this one, don’t get too hung up on the details.
newtype Mu f = InF { outF :: f (Mu f) }


-- 5. Again, follow the kinds and ignore the unfamiliar parts
-- 
-- import GHC.Arr for this one
--
data D = D (Array Word Word) Int Int
