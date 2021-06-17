-- Learn you a Haskell for good
-- pg 61

-- Chapter 7 MODULES
-- ------------------------------------------------------------------------------------------


-- easiliy import in the ghci 
import Data.List

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub


-- 

