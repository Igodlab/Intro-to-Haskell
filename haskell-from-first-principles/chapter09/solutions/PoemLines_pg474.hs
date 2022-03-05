module PoemLines where

-- -- 1. Using takeWhile and dropWhile, write a function that takes a string and returns a list of strings, using spaces to separate the elements of the string into words
-- --
-- -- eg. Prelude> myWords "sheryl wants fun"
-- --     ["wallfish", "wants", "fun"]
myWords :: String -> [String]
myWords x = case dropWhile isSpace x of
            "" -> []
            x' -> w : myWords x''
              where
                (w, x'') = break isSpace x'
          where
            isSpace = (==) ' '
 
 
-- -- 2. Next, write a function that takes a string and returns a list of strings, using newline separators to break up the string
-- --
-- firstSen = "Tyger Tyger, burning bright\n"
-- secondSen = "In the forests of the night\n"
-- thirdSen = "What immortal hand or eye\n"
-- fourthSen = "Could frame thy fearful\
--     \ symmetry?"
-- 
-- sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen
-- -- putStrLn sentences -- should print
-- -- Tyger Tyger, burning bright
-- -- In the forests of the night
-- -- What immortal hand or eye
-- -- Could frame thy fearful symmetry?\
-- 
-- 
-- -- Implement this
-- myLines :: String -> [String]
-- -- myLines = undefined
-- myLines
-- 
-- -- What we want 'myLines sentences'
-- -- to equal
-- shouldEqual =
--     [ "Tyger Tyger, burning bright"
--     , "In the forests of the night"
--     , "What immortal hand or eye"
--     , "Could frame thy fearful symmetry?"
--     ]
-- -- The main function here is a small test
-- -- to ensure you've written your function
-- -- correctly.
-- main :: IO ()
-- main = print $ "Are they equal? " ++ 
--                show (myLines sentences == shouldEqual)
-- 
-- 
-- -- 3. Now let’s look at what those two functions have in common. Try writing a new function that parameterizes the character you’re breaking the string argument on and rewrite myWords and myLines using it.
-- 
