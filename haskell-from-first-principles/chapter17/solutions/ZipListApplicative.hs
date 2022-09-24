module ZipListApplicative where

import Test.QuickCheck



-- Again we have List from ./ListApplicative.hs
-- thus we re-write all helper functions to define Applicative
-- i)   appendList
-- ii)  foldrList
-- iii) concatList
-- iv)  flatMapList
--
data List a = Nil | Cons a (List a) deriving (Eq, Show)

takeList :: Int -> List a -> List a 
takeList _ Nil = Nil
takeList n (Cons x xs) | n <= 0 = Nil
                       | n == 1 = Cons x Nil
                       | otherwise = Cons x (takeList (n-1) xs)

appendList :: List a -> List a -> List a
appendList Nil ls = ls
appendList (Cons a as) ls = Cons a (appendList as ls)

foldrList :: (a -> b -> b) -> b -> List a -> b
foldrList _ x Nil = x
foldrList f x (Cons a as) = f a (foldrList f x as)

concatList :: List (List a) -> List a
concatList = foldrList appendList Nil

flatMapList :: (a -> List b) -> List a -> List b 
flatMapList f as = (concatList . fmap f) as

instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons a as) = Cons (f a) (fmap f as)

instance Applicative List where
    pure a = Cons a Nil
    _   <*> Nil = Nil
    Nil <*> _   = Nil
    (<*>) fs as = flatMapList (<$> as) fs


-- newtype ZipLst a = ZipList (List a) deriving (Eq, Show)
-- 
-- instance Eq a => EqProp (ZipList a) where
--     xs =-= ys = xs `eq` ys'
--       where 
--         xs' = let (ZipList l) = xs
--               in takeList 3000 l
--         ys' = let (ZipList l) = ys
--               in takeList 3000 l
-- 
-- instance Functor ZipList where
--     fmap f (ZipList xs) = ZipList $ fmap f xs
-- 
-- instance Applicative ZipList where
--     pure = undefined
--     (<*>) = undefined

-- The idea is to align a list of functions with a list of values and apply the first function to the first value and so on. The instance should work with infinite lists. Some examples: 
--
-- Prelude> let zl' = ZipList'
-- Prelude> let z = zl' [(+9), (*2), (+8)]
-- Prelude> let z' = zl' [1..3]
-- Prelude> z <*> z'
-- ZipList' [10,4,11]
-- Prelude> let z' = zl' (repeat 1)
-- Prelude> z <*> z'
-- ZipList' [10,2,9]
-- Note that the second z' was an infinite list. Check Prelude for functions that can give you what you need. One starts with the letter z, the other with the letter r.
