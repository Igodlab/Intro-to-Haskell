-- ##################################
-- # page 229: Does it compile?
-- # 
-- # see: doesItCompile_pg229.hs
-- 
-- For each set of expressions, figure out which expression, if any, causes the compiler to squawk at you (n.b. we do not mean literal squawking) and why. Fix it if you can.


module DoesItCompile where

bigNum = (^) 5 
-- wahoo = bigNum $ 10
wahoo = bigNum $ 10 -- possible fix

-- 2.
x = print
y = print "woohoo!"
z = x "hello world" -- compiles just fine

-- 3.
a3 = (+)
b3 = 5
-- c3 = b3 10
-- d3 = c3 200
c3 = a3 b3 10  -- possible fix
d3 = a3 c3 200 -- possible fix

-- 4.
a4 = 12 + b4
-- b4 = 10000 * c4
c4 = 2 -- need to define c4 for this chunk to compile
b4 = 10000 * c4

