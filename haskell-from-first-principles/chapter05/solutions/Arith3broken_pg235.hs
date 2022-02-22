module Arith3Broken where

-- ##################################
-- # page 234: Fix it
-- # 
-- # see: sing_pg234.hs
-- # see: arith3broken_pg235.hs
-- # 
-- 
-- Won’t someone take pity on this poor broken code and fix it up? Be sure to check carefully for things like capitalization, parentheses, and indentation. 
-- 
-- 3. 
-- main :: IO ()
-- Main = do
-- print 1 + 2
-- putStrLn 10
-- print (negate -1)
-- print ((+) 0 blah)
-- where blah = negate 1
-- Ans:
main :: IO ()
main = do 
    print $ 1 + 2
    putStrLn "10"
    print $ negate (-1)
    print $ (+) 0 blah
      where
        blah = negate 1
