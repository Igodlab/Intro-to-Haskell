-- 4. Rewrite waxOn as an expression with a where clause in your source file. Load it into your REPL and make sure it still works as expected. 
-- 
waxOn = x * 5
  where
    x = y ^ 2
    y = z + 8
    z = 7

-- 5
triple x = x * 3

-- 6
waxOff x = triple x

