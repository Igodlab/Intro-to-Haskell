module ZipListApplicative where

import Test.QuickCheck


data = List a = Nil | Cons a (List a) deriving (Eq, Show)

takeZip :: Int -> List a -> List a 
takeZip  = undefined

instance Functor List where
    fmap = undefined

instance Applicative List where
    pure = undefined
    (<*>) = undefined


newtype ZipList a = ZipList (List a) deriving (Eq, Show)

instance Eq a => EqProp (ZipList a) where
    xs =-= ys = xs `eq` ys'
      where 
        xs' = let (ZipList l) = xs
              in takeZip 3000 l
        ys' = let (ZipList l) = ys
              in takeZip 3000 l

instance Functor ZipList where
    fmap f (ZipList xs) = ZipList $ fmap f xs

instance Applicative ZipList where
    pure = undefined
    (<*>) = undefined
