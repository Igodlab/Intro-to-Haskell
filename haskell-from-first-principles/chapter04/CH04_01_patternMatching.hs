-- Learn you a Haskell for good
-- pg 27

-- Chapter 4
-- 4.1 Parttern mathcing

factorial :: (Integral a) => a -> a
factorial n = product [1..n]

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

-- sum up to 15
sum15 :: (Integral a) => a -> a
sum15 0 = 0
sum15 x = if x <= 15 
  then x + sum15(x-1)
  else -99
  
-- sum vectors
addVectors :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors (x1,y1) (x2,y2) = (x1+x2, y1+y2)

-- define grab third element from tuple
trd :: (a,b,c) -> c
trd (_,_,z) = z

-- pg. 29
head' :: [a] -> a
head' [] = error "No pues lista vacia choco"
head' (xs:_) = xs


-- ----------------------------------------------------------------------------------------
-- PATTERNS
tell :: (Show a) => [a] -> String
tell []       = "The list is empty"
tell (x:[])   = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " & " ++ show y
tell (x:y:_)  = "The list is long, the first two elements are: " ++ show x ++ " & " ++ show y

-- length recursion
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:li) = 1 + length' li

-- pg. 30: '@'-patterns
-- x@("pattern goes here"): basically it binds the pattern as x
capital' :: String -> String
capital' "" = "No pues string vacio choco"
capital' xtot@(x:xs) = "First letter of " ++ xtot ++ " is: " ++ xs

-- GUARDS
bmiTell :: (RealFloat a) => a -> a -> (a, String)
bmiTell weight height
  | bmi <= 18.5 = (bmi,  "You're underweight, you emo, you!")
  | bmi <= 25.0 = (bmi, "You're supposedly normal. Pffft, I bet you're ugly!")
  | bmi <= 30.0 = (bmi, "You're fat! Lose some weight, fatty!")
  | otherwise = (bmi, "You're a whale, congratulations!")
  where bmi = 
            weight / height ^ 2
  
-- more on GUARDS
-- create our own compare function
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
  | a > b = GT
  | a == b = EQ
  | otherwise = LT


-- ----------------------------------------------------------------------------------------
-- WHERE vs LET
-- Where bindings are a syntactic construct that let you bind to variables at the end of a function and the whole function can see them
--
--Let bindings let you bind to variables anywhere and are expressions themselves, but are very local 

cylinderLet :: (RealFloat a) => a -> a -> a
cylinderLet r h =
  let sideArea = 2 * pi * r * h
      topArea  = pi * r ^2
  in sideArea + 2 * topArea
  
  
cylinderWhere :: (RealFloat a) => a -> a -> a
cylinderWhere r h = sideArea + 2 * topArea
  where sideArea = 2 * pi * r *h
        topArea  = pi * r^2
        
-- more with inline calculations with: let / in      
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]        


-- -----------------------------------------------------------------------------------------
-- CASE expressions (pg. 36)
-- two ways:
-- 1) using case
describeList_case :: [a] -> String
describeList_case xs = "This list is " ++ case xs of []      -> "empty"
                                                     (x1:[]) -> "singleton"
                                                     [x1,x2] -> "doubleton"
                                                     (x1:_)  -> "longer"
                                                     
-- 2) using where
describeList_where :: [a] -> String
describeList_where xs = "This list is " ++ outcome xs
  where outcome []      = "empty"
        outcome (x1:[]) = "singleton"
        outcome [x1,x2] = "doubleton"
        outcome (x1:_)  = "longer"
        
        
        
