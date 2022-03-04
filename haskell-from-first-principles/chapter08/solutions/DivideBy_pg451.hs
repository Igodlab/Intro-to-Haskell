module DivideBy where


data DividedResult a = Result a | DividedByZero deriving Show -- Custom data


-- correct divide by
dividedBy :: Integral a => a -> a -> (DividedResult a, DividedResult a)
dividedBy num denom = go num denom 0
  where 
    go n d count
        | denom == 0    = (DividedByZero, DividedByZero)
        | abs n < abs d = (Result count, Result n)
        | otherwise     = let sign = if (n > 0 && d > 0) || (n < 0 && d < 0) then 1 else (-1)
                          in go (sign * (abs n - abs d)) d (count + sign) 




