-- Chapter 4
--
-- pg. 136
-- Excer ise: Mood Swing


-- doesn't work did not understand the example in the Book
module ChgMood where

data Mood = Blah | Woot deriving Show


changeMood :: Mood -> Woot
changeMood Mood = Woot
changeMood    _ = Blah
