module ConstantInstance where

newtype Constant a b = Constant {getConstant :: a} deriving (Eq, Ord, Show)

instance Functor (Constant a) where
    fmap _ (Constant a) = Constant a 

instance (Semigroup a, Monoid a) => Applicative (Constant a) where
    pure _ = Constant mempty 
    Constant x <*> Constant y = Constant $ x <> y 
