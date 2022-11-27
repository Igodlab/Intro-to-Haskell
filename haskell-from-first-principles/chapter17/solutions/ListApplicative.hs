module ListApplicative where

import Test.QuickCheck 
import Test.Hspec


data List a = Nil | Cons a (List a) deriving (Eq, Show)

instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons a as) = Cons (f a) (fmap f as)

-- To define Applicative use the auxiliary operations (hints from the book), 
-- such as: i)   appendList, 
--          ii)  foldrList, 
--          iii) concatList, 
--          iv)  flatMapList
--
-- i) appendList         
appendList :: List a -> List a -> List a
appendList Nil ys = ys
appendList (Cons x xs) ys = Cons x (appendList xs ys)


-- ii) foldrList
--
-- similar to the def of foldr
--
-- foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
-- foldr _ z [] = z
-- foldr f z (x:xs) = f x (foldr f z xs)
--
foldrList :: (a -> b -> b) -> b -> List a -> b
foldrList _ z Nil = z
foldrList f z (Cons x xs) = f x (foldrList f z xs)


-- iii) concatList
concatList :: List (List a) -> List a
concatList = foldrList appendList Nil

-- iv) flatMapList
flatMapList :: (a -> List b)
            -> List a
            -> List b
flatMapList f as = (concatList . fmap f) as 


-- naive Applicative instance
--
-- instance Applicative List where
--     pure a = Cons a Nil
--     Nil <*> _   = Nil
--     _   <*> Nil = Nil
--     Cons f fs <*> Cons a as = pure (f a) `appendList` (f <$> as) `appendList` (fs <*> pure a) `appendList` (fs <*> as)

-- more sophisticated Applicative instance
--
instance Applicative List where
    pure a = Cons a Nil
    Nil <*> _   = Nil
    _   <*> Nil = Nil
    fs  <*> xs  = flatMapList (<$> xs) fs


-- test it in the repl
-- Prelude> let f = Cons (+1) (Cons (*2) Nil)
-- Prelude> let v = Cons 1 (Cons 2 Nil)
-- Prelude> f <*> v
-- Cons 2 (Cons 3 (Cons 2 (Cons 4 Nil)))
-- 
f = Cons (+1) (Cons (*2) Nil)
v = Cons 1 (Cons 2 Nil)

