module OtherThanList where

-- Given the BinaryTree from last chapter, complete the following exercises. Here’s that datatype again:


data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a) 
    deriving (Eq, Ord, Show)

-- 1. Write unfold for BinaryTree.
unfold' :: (a -> Maybe (a,b,a)) -> a -> BinaryTree b
unfold' f t = case f t of
                Nothing        -> Leaf
                Just (l, x, r) -> Node (unfold' f l) x (unfold' f r)


-- 2. Make a tree builder. Using the unfold function you’ve made for BinaryTree, write the following function:
treeBuild :: Integer -> BinaryTree Integer
treeBuild n | n <= 0 = Leaf
            | otherwise = unfold' f 0
          where
            f = \x -> case compare x n of 
                        LT -> Just (x + 1, x, x + 1)
                        _  -> Nothing


-- You should be producing results that look like the following:
--
-- Prelude> treeBuild 0
-- Leaf
-- Prelude> treeBuild 1
-- Node Leaf 0 Leaf
--
-- Prelude> treeBuild 2
-- Node (Node Leaf 1 Leaf)
--      0
--      (Node Leaf 1 Leaf)
--
-- Prelude> treeBuild 3
-- Node (Node (Node Leaf 2 Leaf)
--            1
--            (Node Leaf 2 Leaf))
--      0
--      (Node (Node Leaf 2 Leaf)
--            1
--            (Node Leaf 2 Leaf))
--
--
-- Or in a slightly diﬀerent representation:
--
--   0
--   0
--  / \
--  1 1
--
--   0
--  / \
--  1  1
--  /\ /\
-- 2 2 2 2
--
-- Good work.
