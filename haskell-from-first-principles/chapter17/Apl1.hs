#!/usr/bin/env cabal
{- cabal:
build-depends:  base
              , QuickCheck
              , checkers
              , hspec
              , hspec-contrib
-}

-- module Apl1 where
--
import Control.Applicative
import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes


-- ZipList is imported from Control.Applicative
-- defined as:
-- ZipList :: [a] -> ZipList a
--
instance Monoid a => Monoid (ZipList a) where
    -- mempty = ZipList [] -- yields to left & right identity laws to FAIL! 
    mempty = pure mempty 

instance Semigroup a => Semigroup (ZipList a) where
    (<>) = liftA2 (<>)


-- Fortunately Test.QuickCheck.Arbitrary defines instances for:
--
-- instance Arbitrary a => Arbitrary (ZipList a) where
--     arbitrary = ZipList <$> arbitrary
-- 
-- instance Arbitrary a => Arbitrary (Sum a) where
--     arbitrary = Sum <$> arbitrary
-- 
-- ...and Test.QuickCheck.Checkers defines an instance for:
--
-- instance Eq a => EqProp (ZipList a) where
--     (=-=) = eq
--
--
--
-- So when we run this module we get:
-- monoid:
--   left  identity: *** Failed! Falsified (after 3 tests and 2 shrinks):
-- ZipList {getZipList = [Sum {getSum = 0}]}
--   right identity: *** Failed! Falsified (after 2 tests and 2 shrinks):
-- ZipList {getZipList = [Sum {getSum = 0}]}
--   associativity:  +++ OK, passed 500 tests.
--   mappend = (<>): +++ OK, passed 500 tests.
--   mconcat:        +++ OK, passed 500 tests.


zl = ZipList [1 :: Sum Int]

main :: IO ()
main = quickBatch (monoid zl)
