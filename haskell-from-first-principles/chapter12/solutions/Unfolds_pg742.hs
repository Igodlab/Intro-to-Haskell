 module Unfolds where
 
-- 1. Write the function myIterate using direct recursion. Com- pare the behavior with the built-in iterate to gauge correctness. Do not look at the source or any examples of iterate so that you are forced to do this yourself.
--
myIterate :: (a -> a) -> a -> [a]
myIterate f x = x : myIterate f (f x)
 
-- 2. Write the function myUnfoldr using direct recursion. Compare with the built-in unfoldr to check your implementation. Again, don’t look at implementations of unfoldr so that you figure it out yourself. 
-- 
myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f x = case f x of
                Nothing -> []
                (Just (l, r)) -> l : myUnfoldr f r

-- 3. Rewrite myIterate into betterIterate using myUnfoldr. A hint — we used unfoldr to produce the same results as iterate earlier. Do this with diﬀerent functions and see if you can abstract the structure out.
-- 
-- It helps to have the
-- types in front of you
-- myUnfoldr :: (b -> Maybe (a, b))
-- -> b
-- -> [a]
--
betterIterate :: (a -> a) -> a -> [a]
betterIterate f = myUnfoldr (\x -> Just (x, f x)) 

-- Remember, your betterIterate should have the same results as iterate.
--
-- Prelude> take 10 $ iterate (+1) 0
-- [0,1,2,3,4,5,6,7,8,9]
-- Prelude> take 10 $ betterIterate (+1) 0
-- [0,1,2,3,4,5,6,7,8,9]
