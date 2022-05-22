module MonoidExercises where

import           Data.Monoid
import qualified MonoidProperty  as MP
import           Test.QuickCheck 

-- prob. 1
--
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
    (<>) _ _ = Trivial

instance Monoid Trivial where
    mempty = Trivial

instance Arbitrary Trivial where
    arbitrary = return Trivial

type TrivAssoc = Trivial -> Trivial -> Trivial -> Bool

-- prob. 2
--
newtype Identity a = Identity a deriving (Show, Eq)

instance Semigroup a => Semigroup (Identity a) where
    Identity x <> Identity y = Identity $ x <> y

instance Monoid a => Monoid (Identity a) where
    mempty = Identity mempty

instance Arbitrary a => Arbitrary (Identity a) where
    arbitrary = do 
        Identity <$> arbitrary

type IdentityAssoc = Identity String 
                  -> Identity String
                  -> Identity String
                  -> Bool

-- prob. 3
-- 
data Two a b = Two a b deriving Show


-- prob. 3
-- 
newtype BoolConj = BoolConj Bool

-- What it should do:
--
-- Prelude> (BoolConj True) `mappend` mempty
-- BoolConj True
-- Prelude> mempty `mappend` (BoolConj False)
-- BoolConj False


-- prob 5. 
newtype BoolDisj = BoolDisj Bool 



-- What it should do:
-- Prelude> (BoolDisj True) `mappend` mempty
-- BoolDisj True
-- Prelude> mempty `mappend` (BoolDisj False)
-- BoolDisj False



-- prob. 6.
newtype Combine a b = Combine { unCombine :: (a -> b) }


-- What it should do:
--
-- Prelude> let f = Combine $ \n -> Sum (n + 1)
-- Prelude> unCombine (mappend f mempty) $ 1
-- Sum {getSum = 2}

-- prob 7.
--
-- 7. Hint: We can do something that seems a little more specific and natural to functions now that the input and output types are the same.
--
newtype Comp a = Comp (a -> a)


-- prob. 8.
--
-- This next exercise will involve doing something that will feel a bit unnatural still and you may find it difficult. If you get it and you haven’t done much FP or Haskell before, get yourself a nice beverage. We’re going to toss you the instance declaration so you don’t churn on a missing Monoid constraint you didn’t know you needed.
--
newtype Mem s a = Mem {runMem :: s -> (a,s)}
 
 
-- instance Monoid a => Monoid (Mem s a) where
--     mempty = undefined

-- Given the following code:
-- 
f' = Mem $ \s -> ("hi", s + 1)

-- main2 = do
--     let rmzero = runMem mempty 0
--         rmleft = runMem (f' <> mempty) 0
--         rmright = runMem (mempty <> f') 0
--     print $ rmleft
--     print $ rmright
--     print $ (rmzero :: (String, Int))
--     print $ rmleft == runMem f' 0
--     print $ rmright == runMem f' 0

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
    let sa  = MP.monoidAssoc
        mli = MP.monoidLeftIdentity
        mlr = MP.monoidRightIdentity
    print "prob. 1. Trivial"
    quickCheck (sa  :: TrivAssoc)
    quickCheck (mli :: Trivial -> Bool)
    quickCheck (mlr :: Trivial -> Bool)
    print "prob 2. Identity"
    quickCheck (MP.monoidAssoc         :: IdentityAssoc)
    quickCheck (MP.monoidLeftIdentity  :: Identity String -> Bool)
    quickCheck (MP.monoidRightIdentity :: Identity String -> Bool)

