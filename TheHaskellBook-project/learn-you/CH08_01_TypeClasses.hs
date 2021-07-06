-- Learn you a Haskell for good
-- pg 61

-- Chapter 8 MAKING OUR OWN TYPES & TYPECLASSES
-- ------------------------------------------------------------------------------------------


module CH08.Shape
    ( Point(..)
    , Shape(..)
    , surface
    ) where

-- lets import Data.Map as qualified (used in ex3 in section 8.5)
import qualified Data.Map as Map


-- 8.1 Algebraic data types
-- define our own datatypes
-- define and create a value constructor and a function to calculate surface area
data Shape' = Circle' Float Float Float | Rectangle' Float Float Float Float 
    deriving (Show)  -- deriving (Show) -- allows ghci to be able to print/display the datatype on ghci

surface' :: Shape' -> Float
surface' (Circle' _ _ r) = pi*r^2
surface' (Rectangle' x1 y1 x2 y2) = (abs $ x2-x1) * (abs $ y2-y1)


-- define a datatype that allows to play with cartesian concepts like points, vectors, etc..
data Point = Point Float Float
    deriving (Show)

data Shape = Circle Point Float | Rectangle Point Point
    deriving (Show)
    
surface :: Shape -> Float
surface (Circle _ r) = pi*r^2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = rect_area
    where rect_area = (abs $ x2-x1)*(abs $ y2-y1)
    
-- -------------------------------------------------------------------                     
-- ------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------
-- 8.2 Record Syntax
-- creating a data type that describes a person. The
-- info that we want to store about that person is: first name, last name, age,
-- height, phone number, and favorite ice-cream flavor. I don't know about
-- you, but that's all I ever want to know about a person. Let's give it a go!
    
data Person' = Person' { firstName'      :: String
                       , lastName'       :: String
                       , age'            :: Int
                       , height'         :: Float
                       , phoneNumber'    :: Int
                       , iceCreamFlavor' :: String
                       } deriving (Show)

-- -------------------------------------------------------------------                     
-- ------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------
-- 8.3 Type Parameters (pg. 90)
-- important to differentiate between type-constructor and value-constructor
-- data myData = myData x y z deriving(...)
--      --^          --^
--  type-crtor    value-crtor
--
-- part before the `=` is the type-constructor & constructors after it are value-constructors


-- implement vectors, the following is a parameterized way of defining it
data Vector a = Vector a a a deriving (Show)

vSum :: (Num a) => Vector a -> Vector a -> Vector a
(Vector i j k) `vSum` (Vector l m n) = Vector (i+l) (j+m) (k+n)

vDot :: (Num a) => Vector a -> Vector a -> a
(Vector i j k) `vDot` (Vector l m n) = (i*l) + (j*m) + (k*n)


-- -------------------------------------------------------------------                     
-- ------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------
-- 8.4 Derived Instances
-- 
data Person = Person { firstName :: String
                     , lastName  :: String
                     , age       :: Int
                     } deriving (Eq, Show, Read)

-- note we added Eq typeclass, so we can create type-instances to interact with our
-- "interface" (the typeclass `Person` interface) 
-- 
-- eg.
-- ghci$ person1 `elem` [person4, person6, person4, person1]
-- True



-- -------------------------------------------------------------------                     
-- ------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------
-- 8.5 Type Synonyms (pg. 98)
-- as the name suggests we can also define types that are synonyms
--
--eg. i) define the variable `phoneBook`
phoneBook :: [(String, String)]
phoneBook = [ ("betty","555-2938")
            , ("bonnie","452-2928")
            , ("patsy", "493-2928")
            , ("lucille", "205-2928")
            , ("wendy", "939-8282")
            , ("penny", "853-2492")
            ]

-- ii) create a type-synonym with capital P, `PhoneBook`
-- type PhoneBook = [(String, String)] -- we will redefine this in iii)

-- iii) create more type-synonyms for strings 
type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]

-- iv) So now, when we implement a function that takes a name and a number and sees if that name
-- and number combination is in our phonebook, we can give it a very pretty and descriptive type
-- declaration.
--
--
inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook nm pnum pbk = (nm, pnum) `elem` pbk

-- example 2.- Type declaration can also be parameterized 
-- 
type AssocList k v = [(k, v)]

keyValues = [ ('A', 1)
            , ('B', 2)
            , ('C', 3)
            , ('D', 4)
            ]

--getValues :: (Eq k) => AssocList k v -> Maybe v
--getValues k v 
--    | () `elem` keyValues = Maybe 667
--    | otherwise = Nothing


-- example 3.- more type constructors
-- Map from locker numbers to a pair of whether the locker is in use or not
data LockerState = Taken | Free deriving (Show, Eq)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup n lm = case Map.lookup n lm of
    Nothing -> Left $ "Locker number: " ++ show n ++ " doesn't exist!"
    Just (state, code) -> if state /= Taken
                          then Right code
                          else Left $ "Locker " ++ show n ++ " is already " ++ show(state)

lockers :: LockerMap
lockers = Map.fromList
    [ (100,(Taken,"ZD39I"))
    , (101,(Free,"JAH3I"))
    , (103,(Free,"IQSA9"))
    , (105,(Free,"QOTSA"))
    , (109,(Taken,"893JJ"))
    , (110,(Taken,"99292"))
    ]




-- -------------------------------------------------------------------                     
-- ------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------
-- 8.6 Recursive data structures (pg. 101)
-- as the name suggests we can also define types that are synonyms

-- lets implement our own list
-- it is also possible to define our own infix operators
--
data List a = Empty | Elem {listHead :: a, listTail :: List a} deriving (Show, Read, Eq, Ord)

infixr 5 :-:
data List' a = Empty' | a :-: (List' a) deriving (Show, Read, Eq, Ord)

-- example 2
infixr 5 ++++

(++++) :: [a] -> [a] -> [a]
[] ++++ ys     = ys
(x:xs) ++++ ys = x : (xs ++++ ys)

-- BINARY SEARCH TREE
-- Traditionally binary trees have nodes to the left as smaller values and nodes to the right as larger
--
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Eq, Read)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert n EmptyTree = singleton n
treeInsert n (Node a left right)
    | n == a = Node n left right
    | n < a  = Node a (treeInsert n left) right
    | n > a  = Node a left (treeInsert n right)

treeElem :: (Ord a) => a -> Tree a ->Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a  = treeElem x left
    | x > a  = treeElem x right





-- we'll make a function to build our trees














