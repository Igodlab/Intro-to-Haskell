module FunctInstances where

import           Test.QuickCheck
import qualified Test.QuickCheck.Function as QCF

-- Implement Functor instances for the following datatypes. Use the QuickCheck properties we showed you to validate them.
-- 
-- 1. 
newtype Identity a = Identity a deriving (Show, Eq)

instance Functor Identity where
    fmap f (Identity a) = Identity (f a)

instance Arbitrary a => Arbitrary (Identity a) where
    arbitrary = do
        Identity <$> arbitrary

-- define the types for Identity for quickCheck
type IdentityId      = [Int] -> Bool
type IdentityCompose = Int2Int -> Int2Int -> [Int] -> Bool


-- 
-- 2. 
data Pair a = Pair a a deriving (Show, Eq)

instance Functor Pair where
    fmap f (Pair a a') = Pair (f a) (f a')

instance Arbitrary a => Arbitrary (Pair a) where
    arbitrary = do
        ha <- arbitrary
        elements [Pair ha ha]

type PairId      = Pair Int -> Bool
type PairCompose = Int2Int -> Int2Int -> Pair Int -> Bool

-- 
-- 3. 
data Two a b = Two a b deriving (Show, Eq)

instance Functor (Two a) where
    fmap f (Two a b) = Two a (f b)

instance ( Arbitrary a
         , Arbitrary b)
         => Arbitrary (Two a b) where
    arbitrary = do 
        ha <- arbitrary 
        Two ha <$> arbitrary

type TwoId      = Two String Int -> Bool
type TwoCompose = Str2Int -> Int2Int -> Two Char String -> Bool 
--                ^          ^              ^    ^
--                |          |              |    |
-- nice thing of QCF.Fun is that we can pattern match types

-- 
-- 4. 
data Three a b c = Three a b c deriving (Show, Eq)
    
instance Functor (Three a b) where
    fmap f (Three a b c) = Three a b (f c)

instance ( Arbitrary a
         , Arbitrary b
         , Arbitrary c)
         => Arbitrary (Three a b c) where
    arbitrary = do 
        ha <- arbitrary
        hb <- arbitrary 
        Three ha hb <$> arbitrary

type ThreeId      = Three Char [Char] String -> Bool
type ThreeCompose = Int2Str -> Str2Int -> Three Char [Char] Int -> Bool


-- 
-- 5. 
data Three' a b = Three' a b b deriving (Show, Eq)

instance Functor (Three' a) where
    fmap f (Three' a b b') = Three' a (f b) (f b')

instance ( Arbitrary a
         , Arbitrary b)
         => Arbitrary (Three' a b) where
    arbitrary = do
        ha <- arbitrary
        hb <- arbitrary
        Three' ha hb <$> arbitrary

type ThreePId      = Three' Char Float -> Bool
type ThreePCompose = Str2Int -> Int2Int -> Three' Float String -> Bool

-- 
-- 6. 
data Four a b c d = Four a b c d deriving (Show, Eq)

instance Functor (Four a b c) where
    fmap f (Four a b c d) = Four a b c (f d)

instance ( Arbitrary a 
         , Arbitrary b
         , Arbitrary c
         , Arbitrary d)
         => Arbitrary (Four a b c d) where 
    arbitrary = do
        ha <- arbitrary
        hb <- arbitrary
        hc <- arbitrary
        Four ha hb hc <$> arbitrary

type FourId      = Four Float Int Char String -> Bool
type FourCompose = Str2Int -> Int2Str -> Four Float Int Char String -> Bool

-- 
-- 7. 
data Four' a b = Four' a a a b deriving (Show, Eq)

instance Functor (Four' a) where
    fmap f (Four' a a' a'' b) = Four' a a' a'' (f b)

instance ( Arbitrary a 
         , Arbitrary b)
         => Arbitrary (Four' a b) where 
    arbitrary = do
        ha <- arbitrary
        hb <- arbitrary
        hc <- arbitrary
        Four' ha hb hc <$> arbitrary

type FourPId      = Four' Float Char -> Bool
type FourPCompose = Str2Int -> Int2Str -> Four' Float String -> Bool


-- 
-- 8. Can you implement one for this type? Why? Why not?
--
data Trivial = Trivial deriving (Show, Eq)
-- no we can't because Trivial is a nullary type, 
-- this means that it is concrete kind
--


-- Test all the types
--
functorId :: (Functor f, Eq (f a)) => f a -> Bool
functorId z = fmap id z == z

functorCompose :: (Functor f, Eq (f c)) => (a -> b) -> (b -> c) -> f a -> Bool
functorCompose f g x = fmap g (fmap f x) == fmap (g . f) x

functorCompose' :: (Functor f, Eq (f c)) => QCF.Fun a b -> QCF.Fun b c -> f a -> Bool
functorCompose' (QCF.Fun _ f) (QCF.Fun _ g) x = fmap g (fmap f x) == fmap (g . f) x

-- the following type will be used for quick checking QCF.Fun
type Int2Int = QCF.Fun Int Int
type Str2Int = QCF.Fun String Int
type Int2Str = QCF.Fun Int String

main :: IO ()
main = do
    print "problem 1: Identity"
    quickCheck (functorId       :: IdentityId)
    quickCheck (functorCompose' :: IdentityCompose)
    print "problem 2: Pair"
    quickCheck (functorId       :: PairId)
    quickCheck (functorCompose' :: PairCompose)
    print "problem 3: Two"
    quickCheck (functorId       :: TwoId)
    quickCheck (functorCompose' :: TwoCompose)
    print "problem 4: Three"
    quickCheck (functorId       :: ThreeId)
    quickCheck (functorCompose' :: ThreeCompose)
    print "problem 5: Three'"
    quickCheck (functorId       :: ThreePId)
    quickCheck (functorCompose' :: ThreePCompose)
    print "problem 6: Four"
    quickCheck (functorId       :: FourId)
    quickCheck (functorCompose' :: FourCompose)
    print "problem 7: Four'"
    quickCheck (functorId       :: FourPId)
    quickCheck (functorCompose' :: FourPCompose)

