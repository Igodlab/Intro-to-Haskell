module GivenTypeWriteFunction where

-- ##################################
-- # page 231: Given a type, write the function
-- # 
--
-- 1. There is only one function definition that typechecks and doesn’t go into an infinite loop when you run it.
-- 
-- i :: a -> a
-- i = undefined
-- # Ans: 
i :: a -> a
i x = x
 

-- 2. There is only one version that works.
-- 
-- c :: a -> b -> a
-- c = undefined
-- # Ans:
c :: a -> b -> a
c xa _ = xa
 

-- 3. Given alpha equivalence are c'' and c (see above) the same thing?
-- 
-- c'' :: b -> a -> b
-- c'' = ?
-- # Ans: YES it is the same thing as c (prob. 2)
c'' :: b -> a -> b
c'' = c 

-- 4. Only one version that works.
-- 
-- c' :: a -> b -> b
-- c' = undefined
-- # Ans:
c' :: a -> b -> b
c' _ xb = xb
 
 
-- 5. There are multiple possibilities, at least two of which you’ve seen in previous chapters.
-- 
-- r :: [a] -> [a]
-- r = undefined
-- # Ans: writing two possibilities: r1 & r2
r1 :: [a] -> [a] -- eg. reversing list
r1 [] = []
r1 (x:xs) = (r1 xs) ++ [x]

r2 :: [a] -> [a] -- eg. half chunk of list swap
r2 xs = (drop half xs) ++ (take half xs)
  where
    half = div (length xs) 2

 
-- 6. Only one version that will typecheck.
-- 
-- co :: (b -> c) -> (a -> b) -> a -> c
-- co = undefined
-- # Ans:
co :: (b -> c) -> (a -> b) -> a -> c
co b2c a2b xa = b2c $ a2b xa
 
 
-- 7. One version will typecheck.
-- 
-- a :: (a -> c) -> a -> a
-- a = undefined
-- # Ans:
a :: (a -> c) -> a -> a
a _ xa = xa
 
 
-- 8. One version will typecheck.
-- 
-- a' :: (a -> b) -> a -> b
-- a' = undefined
-- # Ans:
a' :: (a -> b) -> a -> b
a' a2b xa = a2b xa

