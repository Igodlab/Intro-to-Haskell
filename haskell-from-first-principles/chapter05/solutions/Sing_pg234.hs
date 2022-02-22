module Sing where 
-- ##################################
-- # page 234: Fix it
-- # 
-- # see: sing_pg234.hs
-- # see: arith3broken_pg235.hs
-- # 
-- 
-- Won’t someone take pity on this poor broken code and fix it up? Be sure to check carefully for things like capitalization, parentheses, and indentation. 
-- 
-- 1. 
-- module sing where
-- fstString :: [Char] ++ [Char]
-- fstString x = x ++ " in the rain"
-- sndString :: [Char] -> Char
-- sndString x = x ++ " over the rainbow"
-- sing = if (x > y) then fstString x or sndString y
-- where x = "Singin"
-- x = "Somewhere"
-- Ans:
fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing = if (x > y) then fstString x else sndString y
  where 
    x = "Singin"
    y = "Somewhere"


 
-- 2. Now that it’s fixed, make a minor change and make it sing the other song. If you’re lucky, you’ll end up with both songs stuck in your head!
-- Ans:
sing2 = if (x < y) then fstString x else sndString y
  where 
    x = "Singin"
    y = "Somewhere"



-- 3. See:
-- -- arith3broken.hs
