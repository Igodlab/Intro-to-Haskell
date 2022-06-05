module DetermineValidFunctor where

import GHC.Arr



-- Determine if a valid Functor can be written for the datatype provided.
--
-- 1. 
data Bool = False | True 
-- 
-- no! because Bool is not a higher-kinded polymorphic datatype
--


-- 2. 
data BoolAndSomethingElse a = False' a | True' a

instance Functor BoolAndSomethingElse where
    fmap f (False' a) = False' $ f a
    fmap f (True' a)  = True' $ f a

-- 3. 
data BoolAndMaybeSomethingElse a = Falsish | Truish a

instance Functor BoolAndMaybeSomethingElse where
    fmap _ Falsish    = Falsish 
    fmap f (Truish a) = Truish $ f a


-- 4. Use the kinds to guide you on this one, don’t get too hung up on the details.
newtype Mu f = InF { outF :: f (Mu f) }

-- No! because Mu is of kind (* -> *) -> *
--
-- instance Functor Mu where
--     fmap f (InF ou) = InF (fmap f ou)
--
--

-- 5. Again, follow the kinds and ignore the unfamiliar parts
-- 
-- import GHC.Arr for this one
--
data D = D (Array Word Word) Int Int

-- No! because D is of concrete kind.
