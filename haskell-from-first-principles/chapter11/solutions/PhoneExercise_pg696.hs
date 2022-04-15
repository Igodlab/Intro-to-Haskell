module PhoneExercise where

import Data.Char

-- This exercise by geophf [8] originally for 1HaskellADay [9] Thank you for letting us use this exercise!
--
-- references 
-- [8] https://twitter.com/geophf
-- [9] https://twitter.com/1haskelladay
--
-- Remember old-fashioned phone inputs for writing text where you had to press a button multiple times to get diﬀerent letters to come up? You may still have to do this when you try to search for a movie to watch using your television remote control. You’re going to write code to translate sequences of button presses into strings and vice versa.
--
-- So! Here is the layout of the phone:
--
--
--     ---------------------------
--     | 1&'(   | 2 ABC | 3 DEF  |
--     |--------|-------|--------|
--     | 4 GHI  | 5 JKL | 6 MNO  | 
--     |--------|-------|--------|
--     | 7 PQRS | 8 TUV | 9 WXYZ |
--     |--------|-------|--------|
--     | * ^    | 0 + _ | # .,   |
--     ---------------------------
--
--
-- Where star (*) gives you capitalization of the letter you’re writing to your friends, and 0 is your space bar. To represent the digit itself, you press that digit once more than the letters it represents. If you press a button one more than is required to type the digit, it wraps around to the first letter. For example, 
--
-- 2 -> '2' 
-- 22 -> 'A'
-- 222 -> 'B'
-- 2222 -> 'C'
-- 22222 -> '2'
--
-- So on and so forth. We’re going to kick this around. 
--
--
-- 1. Create a data structure that captures the phone layout above. The data structure should be able to express enough of how the layout works that you can use it to dictate the behavior of the functions in the following exercises. 
--
-- -- fill in the rest.
--
-- DaPhone [(Digit, String)] 
--           |      |
--           |      |> this represents the characters that can be accessed in button `Digit`
--           |
--           |> represents the id of the button
--
newtype DaPhone = DaPhone [(Digit, String)] deriving (Show, Read)

myPhone = DaPhone $ zip (('1' :: Digit) : "23456789*0#") ["1", "2ABC", "3DEF", "4GHI", "5JKL", "6MNO", "7PQRS", "8TUV", "9WXYZ", "*^", "0+ ", "#.,"]

-- 2. Convert the following conversations into the keypresses required to express them. We’re going to suggest types and functions to fill in order to accomplish the goal, but they’re not obligatory. If you want to do it differently, go right ahead.
--
convo :: [String]
convo = [ "Wanna play 20 questions"
        , "Ya"
        , "U 1st haha"
        , "Lol ok. Have u ever tasted alcohol"
        , "Lol ya"
        , "Wow ur cool haha. Ur turn"
        , "Ok. Do u think I am pretty Lol"
        , "Lol ya"
        , "Just making sure rofl ur turn"
        ]

-- validButtons = "1234567890*#"
type Digit = Char

--d a0 Valid presses: 1 and up
type Presses = Int

-- keyboard logic



reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps ph c | isUpper c = ('*', 1) : [countPresses c ph]
                 | otherwise = [countPresses c ph]
  where
    countPresses :: Digit -> DaPhone -> (Digit, Presses)
    countPresses d (DaPhone (x:xs)) | dUp `elem` xDig = (xId, ((length $ takeWhile (/= dUp) xDig) :: Presses) + 1)
                                    | otherwise = countPresses d (DaPhone xs)
      where
        dUp = toUpper d
        (xId, xDig) = x

                                        

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead _ [] = []
cellPhonesDead ph (x:xs) = reverseTaps ph x ++ cellPhonesDead ph xs



-- 3. How many times do digits need to be pressed for each message?
fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = undefined



-- 4. What was the most popular letter for each message? What was its cost? You’ll want to combine reverseTaps and fingerTaps to figure out what it cost in taps. reverseTaps is a list because you need to press a diﬀerent button in order to get capitals.
mostPopularLetter :: String -> Char
mostPopularLetter = undefined


-- 5. What was the most popular letter overall? What was the most popular word?
coolestLtr :: [String] -> Char
coolestLtr = undefined

coolestWord :: [String] -> String
coolestWord = undefined
