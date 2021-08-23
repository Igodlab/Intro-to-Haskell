-- Chapter 8 MAKING OUR OWN TYPES & TYPECLASSES
-- ------------------------------------------------------------------------------------------

-- -------------------------------------------------------------------                     
-- ------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------
-- 8.7 TYPECLASSES 102 (pg. 105)
--

module TypeClass102 where

data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
    Red    == Red    = True
    Green  == Green  = True
    Yellow == Yellow = True
    _ == _           = False

instance Show TrafficLight where
    show Red    = "Red light"
    show Yellow = "Yellow light"
    show Green  = "Green light"

-- -------------------------------------------------------------------                     
-- ------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------
-- 8.8 YES NO TYPECLASs (pg. 110)
--

class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _  = True 

-- instances take a type constructor that is concrete (e.g. Maybe a)

instance YesNo (Maybe a) where  
    yesno (Just _) = True
    yesno Nothing  = False

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

instance YesNo (Tree a) where
    yesno Empty = False
    yesno _     = True

instance YesNo TrafficLight where
    yesno Red = False
    yesno _   = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult

-- -------------------------------------------------------------------                     
-- ------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------
-- 8.9 FUNCTOR TYPECLAS (pg. 112)
-- Functor typeclass is for things that can be mapped over
-- 

-- Functors take a type that has a type constructor (not concrete, this is the f)
-- Say we have written an instance for the typeclass Functor as
--
-- instance Functor Maybe where
--      fmap f (Just a) = Just (f a)
--      fmap f Nothing  = Nothing
--
-- Notice how we wrote instance Functor Maybe where instead of instance Functor (Maybe m) where, like we did when we were dealing with Maybe and YesNo (above).
-- Functor wants a type constructor that takes one type and not a concrete type. If you mentally replace the fs with Maybes, fmap acts like a 
-- 
-- (a -> b) -> f     a -> f     b
--
-- (a -> b) -> Maybe a -> Maybe b
--
-- for this particular type, which looks OK. But if you replace f with (Maybe m), then it would seem to act like a `(a -> b) -> Maybe m a -> Maybe m b`, which doesn't make any damn sense because Maybe takes just one type parameter.

-- example 1, with trees
--
instance Functor Tree where
    fmap f Empty = Empty
    fmap f (Node x left rigth) = Node (f x) (fmap f left) (fmap f rigth)

-- couple of functions to create trees

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x Empty = Node x Empty Empty
treeInsert x (Node y left right) 
    | x == y = Node x left right
    | x > y  = Node y left (treeInsert x right)
    | x < y  = Node y (treeInsert x left) right 

rConvert :: (Num a, Ord a) => Tree a -> a -> Either a a
rConvert (Node x lft rgt) y
    | x > y = Right x
    | otherwise = Left x

-- now try in ghci:
-- λ> let tree1 = foldr treeInsert (Node 3 Empty Empty) [4,2,7,8]
-- λ> fmap (*2) tree1
--
-- -------------------------------------------------------------------                     
-- ------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------
-- 8.10 KINDS & SOME TYPE FOO (pg. 115)
-- Functor typeclass is for things that can be mapped over
-- 
-- some weird examples with kkinds:

-- example 1
class Tofu t where
    -- | tofu takes `j a` where a is a concrete type *, so we infer that j is * -> *
    --   then, `t a j` has to be * -> (* -> *) -> *
    tofu :: j a -> t a j

data Frank a b = Frank {frankField :: b a} 
    deriving Show
  
-- try in ghci
-- λ> :t Frank {frankField = Just "hahaha"}
-- λ> :t Frank {frankField = Node 'a' Empty Empty}


instance Tofu Frank where
    -- | now make Frank an instance of Tofu
    tofu x = Frank x

-- try in ghci
-- λ> tofu (Just 'a') :: Frank Char Maybe
-- λ> tofu ["HELLO"] :: Frank [Char] []
--

-- example 2
data Pedro t k p = Pedro {yaba :: p, daba :: t k}

instance Functor (Pedro a b) where
    -- | make Pedro an instance of Functor, Functor takes kinds (* -> *) -> Constraints
    --   and Pedro has only p as a concrete constraint *, and returns a concrete kind as well
    --   Pedro kinds: something -> something -> * -> *
    fmap f (Pedro {yaba = x, daba = y}) = Pedro {yaba = f x, daba = y}


