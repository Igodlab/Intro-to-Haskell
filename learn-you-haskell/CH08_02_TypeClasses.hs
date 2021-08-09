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
    yesNo :: a -> Bool

instance YesNo [a] where
    yesNo [] = False
    yesNo _  = True 

-- instances take a type constructor that is concrete (e.g. Maybe a)

instance YesNo (Maybe a) where  
    yesNo (Just _) = True
    yesNo Nothing  = False

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

instance YesNo (Tree a) where
    yesNo Empty = False
    yesNo _     = True

instance YesNo TrafficLight where
    yesNo Red = False
    yesNo _   = True

-- -------------------------------------------------------------------                     
-- ------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------
-- 8.8 YES NO TYPECLASs (pg. 112)
-- Functor typeclass is for things that can be mapped over
-- 


-- Functors take a type that has a type constructor (not concrete)
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

