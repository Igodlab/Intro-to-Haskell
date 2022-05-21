module SemigroupExercises where

import Test.QuickCheck
import Data.Semigroup

data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
    (<>) _ _ = Trivial

instance Arbitrary Trivial where
    arbitrary = return Trivial

type TrivAssoc = Trivial -> Trivial -> Trivial -> Bool


-- prob 2
newtype Identity a = Identity a deriving (Eq, Show)

instance Semigroup a => Semigroup (Identity a) where
    Identity x <> Identity y = Identity $ y <> x

instance Arbitrary a => Arbitrary (Identity a) where
    arbitrary = do 
        h <- arbitrary
        return $ Identity h

type IdentityAssoc = Identity (Sum Int) -> Identity (Sum Int) -> Identity (Sum Int) -> Bool

-- prob 3 
data Two a b = Two a b deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
    Two x1 y1 <> Two x2 y2 = Two (x1 <> x2) (y1 <> y2) 

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = do
        ha <- arbitrary
        hb <- arbitrary
        return $ Two ha hb

type TwoAssoc = Two (Product Int) (Product Int) 
             -> Two (Product Int) (Product Int)
             -> Two (Product Int) (Product Int)
             -> Bool


-- test all the above types
semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

main :: IO ()
main = do
    quickCheck (semigroupAssoc :: TrivAssoc)
    quickCheck (semigroupAssoc :: IdentityAssoc)
    quickCheck (semigroupAssoc :: TwoAssoc)

