module MonoidExercises where

import           SemigroupExercises hiding (main)
import           Data.Semigroup
import qualified MonoidProperty     as MP
import           Test.QuickCheck 

-- prob. 1
--
instance Monoid Trivial where
    mempty = Trivial

-- prob. 2
--
instance Monoid a => Monoid (Identity a) where
    mempty = Identity mempty

-- prob. 3
-- 
instance (Monoid a, Monoid b) => Monoid (Two a b) where
    mempty = Two mempty mempty

type TwoIdentity = Identity (Sum Int) -> Bool 

-- prob. 4
-- 
instance Monoid BoolConj where
    mempty = BoolConj True

type BoolConjIdentity = BoolConj -> Bool 

-- What it should do:
--
-- Prelude> (BoolConj True) `mappend` mempty
-- BoolConj True
-- Prelude> mempty `mappend` (BoolConj False)
-- BoolConj False


-- prob 5. 
instance Monoid BoolDisj where
    mempty = BoolDisj False

type BoolDisjIdentity = BoolConj -> Bool 

-- What it should do:
-- Prelude> (BoolDisj True) `mappend` mempty
-- BoolDisj True
-- Prelude> mempty `mappend` (BoolDisj False)
-- BoolDisj False



-- prob. 6.
--
instance Monoid b => Monoid (Combine a b) where
    mempty = Combine mempty

-- What it should do:
--
-- Prelude> let f = Combine $ \n -> Sum (n + 1)
-- Prelude> unCombine (mappend f mempty) $ 1
-- Sum {getSum = 2}

-- prob 7.
--
-- 7. Hint: We can do something that seems a little more specific and natural to functions now that the input and output types are the same.
--
instance Monoid a => Monoid (Comp a) where
    mempty = Comp mempty

-- prob. 8.
--
-- This next exercise will involve doing something that will feel a bit unnatural still and you may find it difficult. If you get it and you haven’t done much FP or Haskell before, get yourself a nice beverage. We’re going to toss you the instance declaration so you don’t churn on a missing Monoid constraint you didn’t know you needed.
--
newtype Mem s a = Mem {runMem :: s -> (a,s)}
 
instance Semigroup a => Semigroup (Mem s a) where
    Mem f <> Mem g = Mem h
      where
        h hs = (fa <> ga, gs)
          where
            (fa, fs) = f hs
            (ga, gs) = g fs

instance Monoid a => Monoid (Mem s a) where
    mempty = Mem $ \hs -> (mempty, hs)

-- Given the following code:
-- 
f' = Mem $ \s -> ("hi", s + 1)

-- A correct Monoid for Mem should, given the above code, get the following output:
--
-- Prelude> main
-- ("hi",1)
-- ("hi",1)
-- ("",0)
-- True
-- True
-- Make certain your instance has output like the above, this is sanity-checking the Monoid identity laws for you! It’s not a proof and it’s not even as good as property testing, but it’ll catch the most common mistakes people make. 
--

-- test all
--



main :: IO ()
main = do
    print "prob. 1. Trivial"
    quickCheck (semigroupAssoc         :: TrivAssoc)
    quickCheck (MP.monoidLeftIdentity  :: Trivial -> Bool)
    quickCheck (MP.monoidRightIdentity :: Trivial -> Bool)
    print "prob 2. Identity"
    quickCheck (semigroupAssoc         :: IdentityAssoc)
    quickCheck (MP.monoidLeftIdentity  :: Identity String -> Bool)
    quickCheck (MP.monoidRightIdentity :: Identity String -> Bool)
    print "prob 3. Two"
    quickCheck (semigroupAssoc         :: TwoAssoc)
    quickCheck (MP.monoidLeftIdentity  :: TwoIdentity)
    quickCheck (MP.monoidRightIdentity :: TwoIdentity)
    print "prob 4. BoolConj"
    quickCheck (semigroupAssoc         :: BoolConjAssoc)
    quickCheck (MP.monoidLeftIdentity  :: BoolConjIdentity )
    quickCheck (MP.monoidRightIdentity :: BoolConjIdentity )
    print "prob 5. BoolDisj"
    quickCheck (semigroupAssoc         :: BoolDisjAssoc)
    quickCheck (MP.monoidLeftIdentity  :: BoolDisjIdentity)
    quickCheck (MP.monoidRightIdentity :: BoolDisjIdentity)
    print "prob 8. Mem"
    let rmzero = runMem mempty 0
        rmleft = runMem (f' <> mempty) 0
        rmright = runMem (mempty <> f') 0
    print $ rmleft
    print $ rmright
    print $ (rmzero :: (String, Int))
    print $ rmleft == runMem f' 0
    print $ rmright == runMem f' 0
