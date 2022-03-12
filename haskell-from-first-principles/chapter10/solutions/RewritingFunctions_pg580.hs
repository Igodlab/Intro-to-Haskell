module RewritingFunctions where

-- Rewriting functions using folds
--
-- 1. myOr returns True if any Bool in the list is True.
myOr :: [Bool] -> Bool
myOr = foldl1 (||) 


-- 2. myAny returns True if a -> Bool applied to any of the values in the list returns True.
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr1 (||) . map f

-- Example for validating myAny:
-- Prelude> myAny even [1, 3, 5]
-- False
--
-- Prelude> myAny odd [1, 3, 5]
-- True
--
--
--
-- 3. Write two versions of myElem. One version should use folding and the other should use any.
myElem :: Eq a => a -> [a] -> Bool
myElem xi = myAny (== xi)

myElem' :: Eq a => a -> [a] -> Bool
myElem' xi = any (== xi)

-- Prelude> myElem 1 [1..10]
-- True
--
-- Prelude> myElem 1 [2..10]
-- False
--
--
--
-- 4. Implement myReverse, don’t worry about trying to make it lazy.
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

-- Prelude> myReverse "blah"
-- "halb"
--
-- Prelude> myReverse [1..5]
-- [5,4,3,2,1]
--
--
-- 5. Write myMap in terms of foldr. It should have the same behavior as the built-in map.
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

-- detailed breakdown of myMap, eg f = ^2
--
-- myMap (^2) [1,2,3] = foldr (: . ^2) [] [1,2,3]
--                      foldr (: . ^2) [] (1:[2,3]) = (: . ^2) 1 (foldr (: . ^2) [] [2,3])
--                                                                foldr (: . ^2) [] (2:[3]) = (: . ^2) 2 (foldr (: . ^2) [] [3])
--                                                                                                        foldr (: . ^2) [] (3:[]) = (: . ^2) 3 (foldr (: . ^2) [] [])
--                                                                                                                                               = []
--                                                                                                                                 -----------------------------------
--                                                                                                                                 = (:) 6 []
--                                                                                                                                 = [6]
--                                                                                          --------------------------------------------------------------------------
--                                                                                          = (: . ^2) 2 [6]
--                                                                                          = [4, 6]
--                                                  ------------------------------------------------------------------------------------------------------------------
--                                                  = (: . ^2) 1 [4,6]                                                  
--                                                  = [1, 4, 6]
-- 

-- 6. Write myFilter in terms of foldr. It should have the same behavior as the built-in filter.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr keep []
  where
    keep x y = if f x then x : y else y
--
--
--
--
-- 7. squish flattens a list of lists into a list
squish :: [[a]] -> [a]
squish = foldr (++) [] 
--
--
--
--
-- 8. squishMap maps a function over a list and concatenates the results.
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr ((++) . f) []

-- Prelude> squishMap (\x -> [1, x, 3]) [2]
-- [1,2,3]
--
-- Prelude> let f x = "WO " ++ [x] ++ " OT "
-- Prelude> squishMap f "blah"
-- "WO b OT WO l OT WO a OT WO h OT "
--
--
--
--
-- 9. squishAgain flattens a list of lists into a list. This time re-use the squishMap function.
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id
--
--
--
--
-- 10. myMaximumBy takes a comparison function and a list and returns the greatest element of the list based on the last value that the comparison returned GT for.
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f z@(z0:zs) = foldl cmp z0 z
  where
    cmp x y = case f x y of
                        GT -> x
                        _  -> y
--
--
--
-- Prelude> myMaximumBy (\_ _ -> GT) [1..10]
-- 1
--
-- Prelude> myMaximumBy (\_ _ -> LT) [1..10]
-- 10
--
-- Prelude> myMaximumBy compare [1..10]
-- 10
--
--
--
--
-- 11. myMinimumBy takes a comparison function and a list and returns the least element of the list based on the last value that the comparison returned LT for. 
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f z@(z0:zs) = foldl cmp z0 z
  where
    cmp x y = case f x y of
                        LT -> x
                        _  -> y
--
-- Prelude> myMinimumBy (\_ _ -> GT) [1..10]
-- 10
-- 
-- Prelude> myMinimumBy (\_ _ -> LT) [1..10]
-- 1
-- 
-- Prelude> myMinimumBy compare [1..10]
-- 1
