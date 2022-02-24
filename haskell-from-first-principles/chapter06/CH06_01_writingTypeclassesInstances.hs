{-# LANGUAGE StandaloneDeriving #-}

module Days where

data DayOfWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun

data Date = Date DayOfWeek Int 

instance Eq DayOfWeek where
    (==) Mon Mon = True
    (==) Tue Tue = True
    (==) Wed Wed = True
    (==) Thu Thu = True
    (==) Fri Fri = True
    (==) Sat Sat = True
    (==) Sun Sun = True
    (==) _ _ = False

instance Eq Date where
    (==) (Date wd md) (Date wd' md') = -- wd : week day; md : month day
        wd == wd' &&
        md == md'

deriving instance Show DayOfWeek
deriving instance Show Date


f2 :: Int -> Bool
f2 x 
    | x == 2 = True
    | otherwise = False
