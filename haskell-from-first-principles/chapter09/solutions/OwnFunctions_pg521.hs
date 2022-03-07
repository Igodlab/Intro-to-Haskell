module OwnFunctions where

-- Below are the outlines of some standard functions. The goal here is to write your own versions of these
--

-- 1. myOr returns True if any Bool in the list is True.
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) | x = True
            | not x = myOr xs


-- 2. myAny returns True if a -> Bool applied to any of the values in the list returns True.
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = myOr . map f

-- Example for validating myAny:
-- Prelude> myAny even [1, 3, 5]
-- False
-- Prelude> myAny odd [1, 3, 5]
-- True
-- 
--
-- 3. After you write the recursive myElem, write another version that uses any. The built-in version of elem in GHC 7.10 and newer has a type that uses Foldable instead of the list type specifically. You can ignore that and write the concrete version that works only for list. 
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem n (x:xs) | n == x    = True
                | otherwise = myElem n xs

-- Prelude> myElem 1 [1..10]
-- True
-- Prelude> myElem 1 [2..10]
-- False
--
--
--
-- 4. Implement myReverse.
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

-- Prelude> myReverse "blah"
-- "halb"
-- Prelude> myReverse [1..5]
-- [5,4,3,2,1]
--
--
--
-- 5. squish flattens a list of lists into a list 
-- (detailed explanation in ./OwnFunctions_pg521.txt)
--
squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = preSquish x $ squish xs
  where
    preSquish :: [a] -> [a] -> [a]
    preSquish [] rest = rest
    preSquish (x:xs) rest = x : preSquish xs rest


-- 6. squishMap maps a function over a list and concatenates the results.
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = squish . map f  


-- Prelude> squishMap (\x -> [1, x, 3]) [2]
-- [1,2,3]
-- Prelude> squishMap (\x -> "WO "++[x]++" HOO ") "123"
-- "WO 1 HOO WO 2 HOO WO 3 HOO "
--
--
--
-- 7. squishAgain flattens a list of lists into a list. This time re-use the squishMap function.
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id




-- 8. myMaximumBy takes a comparison function and a list and returns the greatest element of the list based on the last value that the comparison returned GT for. If you import maximumBy from Data.List, you’ll see the type is:
--
-- Foldable t => (a -> a -> Ordering) -> t a -> a
--
-- rather than
--
-- (a -> a -> Ordering) -> [a] -> a
--
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [] = error "nope bish"
myMaximumBy _ (x:[]) = x
myMaximumBy f (x1:x2:xs) | f x1 x2 == LT = myMaximumBy f (x2:xs)
                         | otherwise     = myMaximumBy f (x1:xs)


-- Prelude> let xs = [1, 53, 9001, 10]
-- Prelude> myMaximumBy compare xs
-- 9001
--
--
--
--
-- 9. myMinimumBy takes a comparison function and a list and returns the least element of the list based on the last value that the comparison returned LT for.
--
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [] = error "nope bish"
myMinimumBy _ (x:[]) = x
myMinimumBy f (x1:x2:xs) | f x1 x2 == GT = myMinimumBy f (x2:xs)
                         | otherwise     = myMinimumBy f (x1:xs)


-- Prelude> let xs = [1, 53, 9001, 10]
-- Prelude> myMinimumBy compare xs
-- 1
--
--
--
--
--
-- 10. Using the myMinimumBy and myMaximumBy functions, write your own versions of maximum and minimum. If you have GHC 7.10 or newer, you’ll see a type constructor that wants a Foldable instance instead of a list as has been the case for many functions so far.
--
myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare


myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
