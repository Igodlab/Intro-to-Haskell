module HeavyLifting where


-- Add fmap, parentheses, and function composition to the expression as needed for the expression to typecheck and produce the expected result. It may not always need to go in the same place, so don’t get complacent.

-- Prob 1.
--
-- a = (+1) $ read "[1]" :: Int
--
-- Expected result
--
-- Prelude> a
-- [2]
--
a = (+1) <$> read "[1]" :: [Int]

-- 2. 
--
-- b = (++ "lol") (Just ["Hi,", "Hello"])
--
-- Prelude> b
-- Just ["Hi, lol", "Hellolol"]
b = (fmap . fmap) (++ "lol") (Just ["Hi,", "Hello"])


-- 3.
-- 
-- c = (*2) (\x -> x - 2)
--
-- Prelude> c 1 
-- (-2)
c = fmap (*2) (\x -> x - 2)

-- 4.
-- 
-- d = ((return '1' ++ ) . show) (\x -> [x,1..3])
-- 
-- Prelude> d 0 
-- "1[0,1,2,3]"
--
d = fmap ((return '1' ++ ) . show) (\x -> [x,1..3])


-- 5. 
--
-- e :: IO Integer
-- e = let ioi = readIO "1" :: IO Integer
--         changed = read ("123" ++) show ioi
--     in (*3) changed
-- 
-- Prelude> e
-- 3693
--
e :: IO Integer
e = let ioi = readIO "1" :: IO Integer
        changed = fmap (read . ("123" ++) . show) ioi
    in fmap (*3) changed
