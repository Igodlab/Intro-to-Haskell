module DatabaseProcessing where

import qualified Data.Time as DT

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCtime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase = [ DbDate (UTCTime (DT.fromGregorian 1911 5 1) (DT.secondsToDiffTime 34123))
                , DbNumber 9001
                , DbString "Hello, world!"
                , DbDate (UTCTime (DT.fromGregorian 1921 5 1) (DT.secondsToDiffTime 34123))
              ]

-- 1. Write a function that filters for DbDate values and returns a list of the UTCTime values inside them.
--
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = undefined


-- 2. Write a function that filters for DbNumber values and returns a list of the Integer values inside them. 
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = undefined


-- 3. Write a function that gets the most recent date. 
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = undefined

-- 4. Write a function that sums all of the DbNumber values.
sumDb :: [DatabaseItem] -> Integer
sumDb = undefined


-- 5. Write a function that gets the average of the DbNumber values.
-- You'll probably need to use fromIntegral
-- to get from Integer to Double.
avgDb :: [DatabaseItem] -> Double
avgDb = undefined
