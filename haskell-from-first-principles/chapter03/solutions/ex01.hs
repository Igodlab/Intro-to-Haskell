module Chapter03 where
-- -----------------------------
-- page 124: Building functions
--
-- 1. see: ex01.txt
-- 
-- a) -- Given
--    "Curry is awesome"
--    -- Return
--    "Curry is awesome!"
--
-- b) -- Given
--    "Curry is awesome!"
--    -- Return
--    "y"
--
-- c) -- Given
--    "Curry is awesome!"
--    -- Return
--    "awesome!"
--
-- 2. Now take each of the above and rewrite it in a source file as a general function that could take diﬀerent string inputs as arguments but retain the same behavior. Use a variable as the argument to your (named) functions. If you’re unsure how to do this, refresh your memory by looking at the waxOff exercise from the previous chapter and the TopOrLocal module from this chapter.
--
ex02a :: [Char] -> [Char]
ex02a xs = xs ++ "!"

ex02b :: [Char] -> [Char]
ex02b _ = take 1 $ drop 4 rry
  where
    rry = "Curry"

ex02c :: [Char] -> [Char]
ex02c _ = drop 9 "Curry is awesome!"


-- 3. Write a function of type String -> Char which returns the third character in a String. Remember to give the function a name and apply it to a variable, not a specific String, so that it could be reused for diﬀerent String inputs, as demonstrated (feel free to name the function something else. Be sure to fill in the type signature and fill in the function definition after the equals sign): 
-- 
-- thirdLetter ::
-- thirdLetter x =
-- -- If you apply your function
-- -- to this value:
-- "Curry is awesome"
-- -- Your function should return
-- `r'
-- 
-- Note that programming languages conventionally start indexing things by zero, so getting the zeroth index of a string will get you the first letter. Accordingly, indexing with 3 will get you the fourth. Keep this in mind as you write this function.
--
thirdLetter :: String -> Char
thirdLetter xs = xs !! 3


-- 4. Now change that function so the string operated on is always the same and the variable represents the number of the letter you want to return (you can use “Curry is awesome!” as your string input or a diﬀerent string if you prefer).
-- 
-- letterIndex :: Int -> Char
-- letterIndex x =
-- 
letterIndex :: Int -> Char
letterIndex k = "Curry is awesome!" !! k


-- 5. Using the take and drop functions we looked at above, see if you can write a function called rvrs (an abbreviation of ‘reverse’ used because there is a function called ‘reverse’ already in Prelude, so if you call your function the same name, you’ll get an error message). rvrs should take the string “Curry is awesome” and return the result “awesome is Curry.” This may not be the most lovely Haskell code you will ever write, but it is quite possible using only what we’ve learned so far. First write it as a single function in a source file. This doesn’t need to, and shouldn’t, work for reversing the words of any sentence. You’re expected only to slice and dice this particular string with take and drop.
-- 
rvrs :: String -> String
rvrs _ = drop 9 rry ++ (take 4 $ drop 5 rry)  ++ take 5 rry
  where
    rry = "Curry is awesome"


-- 6. Let’s see if we can expand that function into a module. Why would we want to? By expanding it into a module, we can add more functions later that can interact with each other. We can also then export it to other modules if we want to and use this code in those other modules. There are diﬀerent ways you could lay it out, but for the sake of convenience, we’ll show you a sample layout so  that you can fill in the blanks 
-- 
-- module Reverse where
-- rvrs :: String -> String
-- rvrs x =
-- main :: IO ()
-- main = print ()
-- 
-- Into the parentheses after print you’ll need to fill in your function name rvrs plus the argument you’re applying rvrs to, in this case “Curry is awesome.” That rvrs function  plus its argument are now the argument to print. It’s important to put them inside the parentheses so that that function gets applied and evaluated first, and then that result is printed. Of course, we have also mentioned that you can use the $ symbol to avoid using parentheses, too. Try modifying your main function to use that instead of the parentheses. 
--

-- Ans: we are exporting all functions in the module Chapter03
