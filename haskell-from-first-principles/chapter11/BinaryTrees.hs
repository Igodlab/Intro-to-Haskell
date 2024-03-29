module BinaryTrees where

-- pg 686: Write map function for binary trees
--
data Tree a = Empty | Node (Tree a) a (Tree a) deriving (Eq, Show, Ord)

-- insert node function
insertTree :: Ord a => a -> Tree a -> Tree a
insertTree x Empty = Node Empty x Empty
insertTree x (Node l z r) 
    | x == z = Node l x r
    | x > z  = Node l z (insertTree x r)
    | x < z  = Node (insertTree x l) z r

mapTree :: (a -> b) -> Tree a -> Tree b
mapTree _ Empty = Empty
mapTree f (Node l z r) = Node (mapTree f l) (f z) (mapTree f r)


t0 = Node (Node (Node Empty 3 (Node Empty 2 Empty )) 4 (Node Empty 6 (Node Empty 9 Empty ))) 5 (Node Empty 7 Empty)

-- test it wit t0
-- # Ans: λ> mapTree (^2) t0
--        Node (Node (Node Empty 9 (Node Empty 4 Empty)) 16 (Node Empty 36 (Node Empty 81 Empty))) 25 (Node Empty 49 Empty)
--


-- pg 688: Convert Binary Tree to List
--
preorder :: Tree a -> [a]
preorder Empty = []
preorder (Node l z r) = [z] ++ preorder l ++ preorder r

inorder :: Tree a -> [a]
inorder Empty = []
inorder (Node l z r) = inorder l ++ [z] ++ inorder r

postorder :: Tree a -> [a]
postorder Empty = []
postorder (Node l z r) = postorder l ++ postorder r ++ [z]



-- pg 690: Write Fold (right) for Binary Tree
--
-- Use the definition of foldr:
-- 
-- foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
-- foldr _ z [] = z
-- foldr f z (x:xs) = f x (foldr f z xs)
--
foldrTree :: (a -> b -> b) -> b -> Tree a -> b
foldrTree _ x Empty = x
foldrTree f x (Node l z r) = f z (foldrTree f x r)



