module Possibly where

-- Write a Functor instance for a datatype identical to Maybe. We’ll use our own datatype because Maybe already has a Functor instance and we cannot make a duplicate one.  
-- 
data Possibly a = LolNope | Yeppers a deriving (Eq, Show)

instance Functor Possibly where
    fmap _ LolNope = LolNope
    fmap f (Yeppers x) = Yeppers $ f x

-- test it 
--
incLift :: (Functor f, Num a) => f a -> f a
incLift = fmap (+1)

showLift :: (Functor f, Show a) => f a -> f String
showLift = fmap show

