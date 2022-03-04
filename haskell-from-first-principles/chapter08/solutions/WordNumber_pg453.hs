module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
-- digitToWord n = undefined
digitToWord n = take n ['a'..]

digits :: Int -> [Int]
-- digits n = undefined
digits 0 = []
digits x = x : digits (x -1)

wordNumber :: Int -> String
-- wordNumber n = undefined
wordNumber n = take n ['a'..]
