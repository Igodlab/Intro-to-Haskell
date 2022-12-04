#!/usr/bin/env cabal
{- cabal:
build-depends: base
             , QuickCheck
             , checkers
-}

import Test.QuickCheck 
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes


-- Write instances for the following datatypes. Confused? Write out what the type should be. Use the checkers library to validate the instances.
--

-- 
-- 1. 
--
data Pair a = Pair a a deriving (Eq, Show)

instance Functor Pair where
    fmap f (Pair a a') = Pair (f a) (f a')

instance Applicative Pair where
    pure a = Pair a a
    (<*>) (Pair f f') (Pair a a') = Pair (f a) (f' a')

instance Arbitrary a => Arbitrary (Pair a) where
    arbitrary = Pair <$> arbitrary <*> arbitrary

instance (Eq a) => EqProp (Pair a) where
    (=-=) = eq

--
-- 2.
--
data Two a b = Two a b deriving (Eq, Show)

instance Functor (Two a) where
    fmap f (Two a b) = Two a (f b)

instance Monoid a => Applicative (Two a) where
    pure b = Two mempty b
    (<*>) (Two a' fb) (Two a b) = Two (a' <> a) (fb b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = Two <$> arbitrary <*> arbitrary

instance (Eq a, Eq b) => EqProp (Two a b) where
    (=-=) = eq

-- 
-- 3. 
--
data Three a b c = Three a b c deriving (Eq, Show)


instance Functor (Three a b) where
    fmap f (Three a b c) = Three a b (f c)

instance (Monoid a, Monoid b) => Applicative (Three a b) where
    pure c = Three mempty mempty c
    (<*>) (Three a' b' fc) (Three a b c) = Three (a' <> a) (b' <> b) (fc c)

instance ( Arbitrary a 
         , Arbitrary b
         , Arbitrary c
         ) => Arbitrary (Three a b c) where
    arbitrary = Three <$> arbitrary <*> arbitrary <*> arbitrary 

instance (Eq a, Eq b, Eq c) => EqProp (Three a b c) where
    (=-=) = eq


-- 
-- 4. 
--
data Three' a b = Three' a b b deriving (Eq, Show)

instance Functor (Three' a) where
    fmap f (Three' a b b') = Three' a (f b) (f b')

instance (Monoid a) => Applicative (Three' a) where
    pure b = Three' mempty b b
    (<*>) (Three' a' fb fb') (Three' a b b') = Three' (a' <> a) (fb b) (fb' b')

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where
    arbitrary = Three' <$> arbitrary <*> arbitrary <*> arbitrary

instance (Eq a, Eq b) => EqProp (Three' a b) where
    (=-=) = eq

-- 
-- 5. 
--
data Four a b c d = Four a b c d deriving (Eq, Show)

instance Functor (Four a b c) where
    fmap f (Four a b c d) = Four a b c (f d)

instance (Monoid a, Monoid b, Monoid c) => Applicative (Four a b c) where
    pure d = Four mempty mempty mempty d
    (<*>) (Four a' b' c' fd) (Four a b c d) = Four (a' <> a) (b' <> b) (c' <> c) (fd d)

instance ( Arbitrary a
         , Arbitrary b
         , Arbitrary c
         , Arbitrary d
         ) => Arbitrary (Four a b c d) where
    arbitrary = Four <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary

instance (Eq a, Eq b, Eq c, Eq d) => EqProp (Four a b c d) where
    (=-=) = eq



-- 
-- 6. 
--
data Four' a b = Four' a a a b deriving (Eq, Show)

instance Functor (Four' a) where
    fmap f (Four' a1 a2 a3 b) = Four' a1 a2 a3 (f b)

instance (Monoid a) => Applicative (Four' a) where
    pure b = Four' mempty mempty mempty b
    (<*>) (Four' a1' a2' a3' fb) (Four' a1 a2 a3 b) = Four' (a1' <> a1) (a2' <> a2) (a3' <> a3) (fb b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Four' a b) where
    arbitrary = Four' <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary

instance (Eq a, Eq b) => EqProp (Four' a b) where
    (=-=) = eq


-- define main
main :: IO ()
main = do
    putStrLn "> Testing for: Pair\n-------------------"
    quickBatch $ functor (undefined :: Pair (String, Float, Int))
    quickBatch $ applicative (undefined :: Pair (String, Float, Int))
    putStrLn "\n\n> Testing for: Two\n-------------------" 
    quickBatch $ functor (undefined :: Two (String, Float, Int) (String, Float, Int))
    quickBatch $ applicative (undefined :: Two String (String, Float, Int))
    putStrLn "\n\n> Testing for: Three\n-------------------" 
    quickBatch $ functor (undefined :: Three (String, Float, Int) 
                                             (String, Float, Int)
                                             (String, Float, Int))
    quickBatch $ applicative (undefined :: Three String
                                                 String
                                                 (String, Float, Int))
    putStrLn "\n\n> Testing for: Three'\n--------------------" 
    quickBatch $ functor (undefined :: Three' (String, Float, Int) 
                                              (String, Float, Int))
    quickBatch $ applicative (undefined :: Three' String
                                                  (String, Float, Int))
    putStrLn "\n\n> Testing for: Four\n-------------------" 
    quickBatch $ functor (undefined :: Four (String, Float, Int)
                                            (String, Float, Int)
                                            (String, Float, Int)
                                            (String, Float, Int))
    quickBatch $ applicative (undefined :: Four String
                                                String
                                                String
                                                (String, Float, Int))
    putStrLn "\n\n> Testing for: Four'\n-------------------" 
    quickBatch $ functor (undefined :: Four' (String, Float, Int)
                                             (String, Float, Int))
    quickBatch $ applicative (undefined :: Four' String
                                                 (String, Float, Int))

