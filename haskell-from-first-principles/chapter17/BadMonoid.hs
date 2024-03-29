#!/usr/bin/env cabal
{- cabal:
build-depends:  base
              , QuickCheck
              , checkers
              , hspec
              , hspec-contrib
-}

-- module BadMonoid where
--

import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

import Test.Hspec


data Bull = Fools | Twoo deriving (Eq, Show)

instance Arbitrary Bull where
    arbitrary = frequency [ (1, return Fools)
                          , (1, return Twoo)
                          ]

instance Monoid Bull where
    mempty = Fools

instance Semigroup Bull where
    (<>) _ _ = Fools

instance EqProp Bull where
    (=-=) = eq

main :: IO ()
main = quickBatch (monoid Twoo)
