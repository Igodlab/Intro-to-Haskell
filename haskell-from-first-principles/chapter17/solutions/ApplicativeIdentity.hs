module ApplicativeIdentity where

-- Write an Applicative instance for Identity

newtype Identity a = Identity a deriving (Show)

instance Functor Identity where
    fmap f (Identity a) = Identity $ f a

instance Applicative Identity where
    pure = Identity
    Identity f <*> Identity x = Identity $ f x
