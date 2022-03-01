module C4test where

import Data.Char (toUpper)

type Writer a = (a, String) 

-- define composition as an infix operator
(>=>) :: (a -> Writer b) -> (b -> Writer c) -> (a -> Writer c)
g >=> f = \x ->
    let (y, s1) = g x
        (z, s2) = f y
    in (z, s1 ++ s2)

-- define identitiy
return :: a -> Writer a
return x = (x, "")

-- functions
upCase :: String -> Writer String
upCase s = (map toUpper s, "upCase")

toWords :: String -> Writer [String]
toWords xs = (words xs, "toWords")

-- compose functions
process :: String -> Writer [String]
process = upCase >=> toWords
