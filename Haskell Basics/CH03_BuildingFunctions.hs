-- CHAPTER 3 
-- pg. 124

-- Building Functions
--1. Given the list-manipulation functions mentioned in this
--chapter, write functions that take the following inputs and
--return the expected outputs. Do them directly in your
--REPL and use the take and drop functions you’ve already
--seen.

-- Q2 mess up a word
prob2 w = (take 3 w) ++ (concat [(tail w), (head [w])])

-- Q3 third position of a word
prob3 :: [Char] -> Char  -- function receives a  string of characters and outputs a single char
prob3 x = x !! 2

-- Q4 input index and return letter
prob4 :: (Int, [Char]) -> Char
prob4 (n, w) = w !! (n-1)


