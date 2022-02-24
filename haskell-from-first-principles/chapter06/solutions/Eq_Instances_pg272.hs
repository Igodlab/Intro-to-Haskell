module EqInstances where

-- Write the Eq instance for the datatype provided.
-- 
-- 1. It’s not a typo, we’re just being cute with the name.
data TisAnInteger = TisAn Integer deriving Show

instance Eq TisAnInteger where
    (==) (TisAn x) (TisAn y) = (==) x y

-- 2.
data TwoIntegers = Two Integer Integer deriving Show

instance Eq TwoIntegers where
    (==) (Two x1 y1) (Two x2 y2) = (==) x1 x2 &&
                                   (==) y1 y2

-- 3.
data StringOrInt = TisAnInt Int | TisAString String deriving Show

instance Eq StringOrInt where
    (==) (TisAnInt x) (TisAnInt y)     = (==) x y
    (==) (TisAString x) (TisAString y) = (==) x y
    (==) (TisAnInt _) (TisAString _)   = False
    (==) (TisAString _) (TisAnInt _)   = False

-- 4.
data Pair a = Pair a a deriving Show

instance Eq a => Eq (Pair a) where
    (==) (Pair x1 y1) (Pair x2 y2) = (==) x1 x2 &&
                                     (==) y1 y2

-- 5. 
data Tuple a b = Tuple a b deriving Show

instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple x1 y1) (Tuple x2 y2) = (==) x1 x2 &&
                                       (==) y1 y2

-- 6. 
data Which a = ThisOne a | ThatOne a deriving Show

instance Eq a => Eq (Which a) where
    (==) (ThisOne x) (ThisOne y) = (==) x y
    (==) (ThatOne x) (ThatOne y) = (==) x y
    (==) (ThatOne x) (ThisOne y) = (==) x y
    (==) (ThisOne x) (ThatOne y) = (==) x y

-- 7. 
data EitherOr a b = Hello a | Goodbye deriving Show

instance (Eq a, Eq b) => Eq (EitherOr a b) where
    (==) (Hello x) (Hello x') = (==) x x'
    (==) Goodbye Goodbye      = True
    (==) _ _                  = False
