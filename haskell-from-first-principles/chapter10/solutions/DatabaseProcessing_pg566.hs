module DatabaseProcessing where

import qualified Data.Time as DT

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate DT.UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase = [ DbDate (DT.UTCTime (DT.fromGregorian 1911 5 1) (DT.secondsToDiffTime 34123))
                , DbNumber 9001
                , DbString "Hello, world!"
                , DbNumber 133
                , DbDate (DT.UTCTime (DT.fromGregorian 1921 5 1) (DT.secondsToDiffTime 34123))
              ]

-- 1. Write a function that filters for DbDate values and returns a list of the DT.UTCTime values inside them.
filterDbDate :: [DatabaseItem] -> [DT.UTCTime]
filterDbDate xs = [i | (DbDate i) <- xs]

filterDbDate' :: [DatabaseItem] -> [DT.UTCTime]
filterDbDate' [] = []
filterDbDate' (x:xs) = case x of 
                        (DbDate i) -> i : filterDbDate' xs
                        _          -> filterDbDate' xs


-- 2. Write a function that filters for DbNumber values and returns a list of the Integer values inside them. 
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber xs = [i | (DbNumber i) <- xs]


-- 3. Write a function that gets the most recent date. 
mostRecent :: [DatabaseItem] -> DT.UTCTime
mostRecent = maximum . filterDbDate

-- 4. Write a function that sums all of the DbNumber values.
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber


-- 5. Write a function that gets the average of the DbNumber values.
-- You'll probably need to use fromIntegral
-- to get from Integer to Double.
avgDb :: [DatabaseItem] -> Double
avgDb xs = (/) (sumX xs) (nX xs)
  where
    sumX = fromIntegral . sum . filterDbNumber
    nX   = fromIntegral . length . filterDbNumber

