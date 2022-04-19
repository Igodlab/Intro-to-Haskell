module Arith4 where

-- 4. (pg. 404) Fill in the definition. Note that the first argument to our function is also a function which can be applied to values. Your second argument is a tuple, which can be used for pattern matching: 
-- read :: Read a => String -> a
-- show :: Show a => a -> String


-- id :: a -> a -- defined in standard Prelude
-- id = x
-- 
-- roundTrip :: (Show a, Read a) => a -> a
-- roundTrip a = read (show a)
--
main = do
    print (roundTrip 4)
    print (id 4)



-- 5. Next, write a pointfree version of roundTrip. (n.b., This refers to the function definition, not to its application in main.) 
--
roundTrip :: (Show a, Read a) => a -> a 
roundTrip = read . show

-- 6. We will continue to use the code in module Arith4 for this  exercise as well.  When we apply show to a value such as (1 :: Int), the 𝑎 that implements Show is Int, so GHC will use the Int instance of the Show typeclass to stringify our Int of 1. However, read expects a String argument in order to return an 𝑎. The String argument that is the first argumentto read tells the function nothing about what type the de-stringified result should be. In the type signature roundTrip currently has, it knows because the type variables are the same, so the type that is the input to show has to be the same type as the output of read. 
--
-- Your task now is to change the type of roundTrip in Arith4 to (Show a, Read b) => a -> b. How might we tell GHC which instance of Read to dispatch against the String now? Make the expression print (roundTrip 4) work. You will only need the "has the type" syntax of :: and parentheses for scoping.
--
roundTrip' :: (Show a, Read b) => a -> b
roundTrip' = read . show

main' = do
    print (roundTrip' 4 :: Int)
    print (id 4)
