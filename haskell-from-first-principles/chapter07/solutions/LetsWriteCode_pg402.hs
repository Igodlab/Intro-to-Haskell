module LetsWriteCode where

-- 1.
-- The following function returns the tens digit of an integral argument.
tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

-- a) First, rewrite it using divMod. 
tensDigit' :: Integral a => a -> a
tensDigit' x = let f n = div n 10
                   g m = divMod m 10
               in (snd . g . f) x

-- b) Does the divMod version have the same type as the original version?
-- Ans: It can, as I've written

-- c) Next, let’s change it so that we’re getting the hundreds digit instead. You could start it like this (though that may not be the only possibility):
hundredsDigit :: Integral a => a -> a
hundredsDigit x = let f n = div n 100
                      g m = divMod m 10
                  in (snd . g . f) x

-- 2.
-- Implement the function of the type a -> a -> Bool -> a once each using a case expression and once with a guard.
--
foldBool :: a -> a -> Bool -> a
-- foldBool = error "Error: Need to implement foldBool!"
foldBool x y b = case b of
                    True  -> y
                    False -> x

foldBool' :: a -> a -> Bool -> a
foldBool' x y b 
            | b == True = y
            | otherwise = x

-- The result is semantically similar to if-then-else expressions but syntactically quite diﬀerent. Here is the pattern matching version to get you started:
foldBool3 :: a -> a -> Bool -> a
foldBool3 x _ False = x
foldBool3 _ y True  = y


-- 3.
-- Fill in the definition. Note that the first argument to our function is also a function which can be applied to values. Your second argument is a tuple, which can be used for pattern matching:
g :: (a -> b) -> (a, c) -> (b, c)
-- g = undefined
g f tp = (f $ fst tp, snd tp)

-- 4.
-- See: Arith4_pg402.hs
