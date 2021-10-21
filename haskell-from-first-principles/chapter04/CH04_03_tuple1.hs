-- The Haskell Book
--
-- pg. 


-- custom first and second element finder for tuples
fst' :: (a, b) -> a
fst' (a, b) = a

snd' :: (a, b) -> b
snd' (a, b) = b

-- another pattern matching 
tupFunc :: (Int, [a])
        -> (Int, [a])
        -> (Int, [a])
tupFunc (a,b) (c, d) = 
  ((a+c), (b ++ d))
