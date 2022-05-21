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
--
newtype Identity a = Identity a deriving (Eq, Show)

instance Semigroup a => Semigroup (Identity a) where
    Identity x <> Identity y = Identity $ y <> x

instance Arbitrary a => Arbitrary (Identity a) where
    arbitrary = do 
        Identity <$> arbitrary

type IdentityAssoc = Identity (Sum Int) -> Identity (Sum Int) -> Identity (Sum Int) -> Bool

-- prob 3 
--
data Two a b = Two a b deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
    Two x1 y1 <> Two x2 y2 = Two (x1 <> x2) (y1 <> y2) 

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = do
        ha <- arbitrary
        Two ha <$> arbitrary

type TwoAssoc = Two (Product Int) (Product Int) 
             -> Two (Product Int) (Product Int)
             -> Two (Product Int) (Product Int)
             -> Bool


-- prob 4
--
data Three a b c = Three a b c deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c) => Semigroup (Three a b c) where
    Three x1 y1 z1 <> Three x2 y2 z2 = Three (x1 <> x2) (y1 <> y2) (z1 <> z2)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
    arbitrary = do 
        ha <- arbitrary
        hb <- arbitrary
        Three ha hb <$> arbitrary
    
type ThreeAssoc = Three (Product Int) (Product Int) (Product Int) 
               -> Three (Product Int) (Product Int) (Product Int) 
               -> Three (Product Int) (Product Int) (Product Int) 
               -> Bool


-- prob 5. 
--
data Four a b c d = Four a b c d deriving (Eq, Show)

instance ( Semigroup a, 
           Semigroup b,
           Semigroup c,
           Semigroup d)
           => Semigroup (Four a b c d) where
    Four w1 x1 y1 z1 <> Four w2 x2 y2 z2 = Four (w1 <> w2) (x1 <> x2) (y1 <> y2) (z1 <> z2)

instance ( Arbitrary a,
           Arbitrary b,
           Arbitrary c,
           Arbitrary d)
           => Arbitrary (Four a b c d) where
    arbitrary = do 
        ha <- arbitrary
        hb <- arbitrary
        hc <- arbitrary
        Four ha hb hc <$> arbitrary
    
type FourAssoc = Four (Product Int) (Product Int) (Product Int) (Product Int)
              -> Four (Product Int) (Product Int) (Product Int) (Product Int)
              -> Four (Product Int) (Product Int) (Product Int) (Product Int)
              -> Bool


-- prob 6. 
--
-- What it should do:
-- Prelude> (BoolConj True) <> (BoolConj True)
-- BoolConj True
-- Prelude> (BoolConj True) <> (BoolConj False)
-- BoolConj False
-- 
newtype BoolConj = BoolConj Bool deriving (Eq, Show)

instance Semigroup BoolConj where
    BoolConj True <> BoolConj True = BoolConj True
    BoolConj _    <> BoolConj _    = BoolConj False

instance Arbitrary BoolConj where
    arbitrary = do
        BoolConj <$> arbitrary

type BoolConjAssoc = BoolConj -> BoolConj -> BoolConj -> Bool

-- prob 7. 
-- 
-- What it should do:
-- Prelude> (BoolDisj True) <> (BoolDisj True)
-- BoolDisj True
-- Prelude> (BoolDisj True) <> (BoolDisj False)
-- BoolDisj True
--
newtype BoolDisj = BoolDisj Bool deriving (Eq, Show)

instance Semigroup BoolDisj where
    BoolDisj False <> BoolDisj False = BoolDisj False
    BoolDisj _     <> BoolDisj _     = BoolDisj True

instance Arbitrary BoolDisj where
    arbitrary = do
        BoolDisj <$> arbitrary

type BoolDisjAssoc = BoolDisj -> BoolDisj -> BoolDisj -> Bool


-- prob 8. 
--
-- The Semigroup for Or should have the following behavior. We can think of this as having a “sticky” Snd value where it’ll hold onto the first Snd value when and if one is passed as an argument. This is similar to the First' Monoid you wrote earlier in `MaybeAnotherMonoid.hs`.
--
-- Prelude> Fst 1 <> Snd 2
-- Snd 2
-- Prelude> Fst 1 <> Fst 2
-- Fst 2
-- Prelude> Snd 1 <> Fst 2
-- Snd 1
-- Prelude> Snd 1 <> Snd 2
-- Snd 1
-- 
data Or a b = Fst a | Snd b deriving (Eq, Show)

instance Semigroup (Or a b) where
    Snd x <> _     = Snd x
    x     <> y     = y

instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
    arbitrary = do
        ha <- arbitrary
        hb <- arbitrary
        elements [Fst ha, Snd hb]

type OrAssoc = Or String String
            -> Or String String
            -> Or String String
            -> Bool

-- prob 9. 
--
-- What it should do:
-- Prelude> let f = Combine $ \n -> Sum (n + 1)
-- Prelude> let g = Combine $ \n -> Sum (n - 1)
-- Prelude> unCombine (f <> g) $ 0
-- Sum {getSum = 0}
-- Prelude> unCombine (f <> g) $ 1
-- Sum {getSum = 2}
-- Prelude> unCombine (f <> f) $ 1
-- Sum {getSum = 4}
-- Prelude> unCombine (g <> f) $ 1
-- Sum {getSum = 2}
--
-- Hint: This function will eventually be applied to a single value of type 𝑎. But you’ll have multiple functions that can produce a value of type 𝑏. How do we combine multiple values so we have a single 𝑏? This one will probably be tricky! Remember that the type of the value inside of Combine is that of a function. The type of functions should already have an Arbitrary instance that you can reuse for testing this instance.

newtype Combine a b = Combine { unCombine :: a -> b } 

instance Semigroup b => Semigroup (Combine a b) where
    Combine f <> Combine g = Combine $ \x -> f x <> g x


-- prob 10.
--
-- Hint: We can do something that seems a little more specific and natural to functions now that the input and output types are the same.

newtype Comp a = Comp {unComp :: a -> a} 


-- prob 11. 

data Validation a b = Failure a | Success b deriving (Eq, Show)

-- instance Semigroup a => Semigroup (Validation a b) where
    
    


-- Test all the above types
semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

main :: IO ()
main = do
    print "problem 1: Trivial"
    quickCheck (semigroupAssoc :: TrivAssoc)
    print "problem 2: Identity"
    quickCheck (semigroupAssoc :: IdentityAssoc)
    print "problem 3: Two"
    quickCheck (semigroupAssoc :: TwoAssoc)
    print "problem 4: Three"
    quickCheck (semigroupAssoc :: ThreeAssoc)
    print "problem 5: Four"
    quickCheck (semigroupAssoc :: FourAssoc)
    print "problem 6: BoolConj"
    quickCheck (semigroupAssoc :: BoolConjAssoc)
    print "problem 7: BoolDisj"
    quickCheck (semigroupAssoc :: BoolDisjAssoc)
    print "problem 8: Or"
    quickCheck (semigroupAssoc :: OrAssoc)

