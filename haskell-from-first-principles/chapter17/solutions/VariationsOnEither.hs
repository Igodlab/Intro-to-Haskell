#!usr/bin/env cabal
{- cabal:
build-depends:  base
              , QuickCheck
              , checkers
              , semigroupoids
-}

import Data.Functor.Bind.Class 
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

data Validation' e a = Failure' e | Success' a deriving (Eq, Show)

instance Functor (Validation' e) where
    fmap _ (Failure' e) = Failure' e
    fmap f (Success' a) = Success' $ f a

instance Semigroup e => Applicative (Validation' e) where
    pure = Success'
    (<*>) = (<.>)

main :: IO ()
main = do
    putStrLn "List tests"
    quickBatch $ functor (undefined :: Validation' (Int, Float, String) (Int, Float, String))
