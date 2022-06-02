module EitherLike where

-- 1. Write a Functor instance for a datatype identical to Either. We’ll use our own datatype because Either has a Functor instance.
--
data Sum a b = First a | Second b deriving (Eq, Show)

instance Functor (Sum a) where
    fmap f (Second r) = Second (f r)
    fmap f (First l)  = First l
