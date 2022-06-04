module SurprisingFunctor where

newtype Constant a b = Constant { getConstant :: a} deriving (Eq, Show)

-- this looks like id right?
instance Functor (Constant a) where
    fmap _ (Constant a) = Constant a

-- Wrap
data Wrap f a = Wrap (f a) deriving (Eq, Show)

instance Functor f => Functor (Wrap f) where
    fmap f (Wrap fa) = Wrap (fmap f fa)
