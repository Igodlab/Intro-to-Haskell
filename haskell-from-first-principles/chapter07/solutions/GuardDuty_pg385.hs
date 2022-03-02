module GuardDuty where

avgGrade :: (Fractional a, Ord a)
         => a -> Char
avgGrade x
           | y >= 0.9 = 'A'
           | y >= 0.8 = 'B'
           | y >= 0.7 = 'C'
           | y >= 0.59 = 'D'
           | y < 0.59 = 'F'
         where y = x / 100

-- 1. It is probably clear to you why you wouldn’t put an otherwise in your top-most guard, but try it with avgGrade anyway and see what happens. It’ll be more clear if you rewrite it as an otherwise match: | otherwise = 'F'. What happens now if you pass a 90 as an argument? 75? 60?
--
avgGrade' :: (Fractional a, Ord a)
          => a -> Char
avgGrade' x
           | otherwise = 'F' -- defaults to 'F' regardless of the value of x
           | y >= 0.9 = 'A'
           | y >= 0.8 = 'B'
           | y >= 0.7 = 'C'
           | y >= 0.59 = 'D'
         where y = x / 100

-- 2. What happens if you take avgGrade as it is written and reorder the guards? Does it still typecheck and work the same? Try moving | y >= 0.7 = 'C' and passing it the argument 90, which should be an ‘A.’ Does it return an ‘A’? 
--
avgGrade'' :: (Fractional a, Ord a)
           => a -> Char
avgGrade'' x
           | y >= 0.7 = 'C'  -- reordering guards for Ordering cases must follow ascending/descending order
           | y >= 0.9 = 'A'
           | y >= 0.8 = 'B'
           | y >= 0.59 = 'D'
           | y < 0.59 = 'F'
         where y = x / 100

-- 3.
-- 
pal xs
    | xs == reverse xs = True
    | otherwise        = False

-- 5.
-- 
numbers x
    | x < 0  = -1
    | x == 0 = 0 
    | x > 0  = 1
