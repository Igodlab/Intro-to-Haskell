module ToyRecursionExamples where

-- normal factorial
fact :: Integer -> Integer
fact 0 = 1
fact x = x * fact (x - 1)

-- odd factorial-ish that also takes decimal numbers
factIsh :: (Num a, Ord a) => a -> a
factIsh x 
    | x <= 0    = 1
    | otherwise = x * factIsh (x - 1)


-- Fibonacci
fib :: Integer -> [Integer]
fib x = (map fibN . enumFromTo 0) x -- inneficient because it loops twice
  where
    fibN :: Integer -> Integer
    fibN 0 = 0
    fibN 1 = 1
    fibN x = fibN (x - 1) + fibN (x - 2)


