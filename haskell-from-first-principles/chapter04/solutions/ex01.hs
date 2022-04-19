------------------------------------------
-- page 136: Mood Swing
-- 
-- Given the following datatype, answer the following questions:

data Mood = Blah | Woot deriving Show

-- exercises 1,2,3, see: ex01.txt
--
-- 4. Now we want to write the function that changes his mood. Given an input mood, it gives us the other one. Fix any mistakes and complete the function: 
-- 
-- changeMood Mood = Woot
-- changeMood    _ = Blah
-- 
-- We’re doing something here called pattern matching. We can define a function by matching on a data constructor, or value, and describing the behavior that the function should have based on which value it matches. The underscore in the second line denotes a catch-all, otherwise case. So, in the first line of the function, we’re telling it what to do in the case of a specific input. In the second one, we’re telling it what to do regardless of all potential inputs. It’s trivial when there are only two potential values of a given type, but as we deal with more complex cases, it can be convenient. 
-- Ans:
-- 
changeMood :: Mood -> Mood
changeMood m = case m of
    Blah -> Woot
    Woot -> Blah


------------------------------------------
-- page 169: Chapter Exercises
-- 
-- 8. Write a function that tells you whether or not a given String (or list) is a palindrome. Here you’ll want to use a function called reverse a predefined function that does what it sounds like.
-- 
-- reverse :: [a] -> [a]
-- reverse "blah"
-- "halb"
-- 
-- isPalindrome :: (Eq a) => [a] -> Bool
-- isPalindrome x = undefined
--
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] = True
isPalindrome xs = xs == reverse xs


-- 9. Write a function to return the absolute value of a number using if-then-else
-- 
-- myAbs :: Integer -> Integer
-- myAbs = undefined
-- 
myAbs :: Integer -> Integer
myAbs x = if x > 0 then x else (-x)

-- 10. Fill in the definition of the following function, using fst and snd:
-- 
-- f :: (a, b) -> (c, d) -> ((b, d), (a, c))
-- f = undefined
-- 
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f t1 t2 = ((snd t1, snd t2), (fst t1, fst t2))


------------------------------------------
-- page 170: Correcting Syntax
-- 
--
-- In the following examples, you’ll be shown syntactically incorrect code. Type it in and try to correct it in your text editor, validating it with GHC or GHCi.
--
-- 1. Here, we want a function that adds 1 to the length of a string argument and returns that result.
--
-- x = (+)
-- functionF xs = w 'x' 1
--   where w = length xs
--
x = (+)

functionF xs = (x) w 1
  where
    w = length xs

-- 2. This is supposed to be the identity function, id. 
-- 
-- \X = x
--
idX :: a -> a
idX x = x


