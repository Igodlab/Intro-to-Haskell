NOTE: To get λ type SHIFT + CTRL + u followed by 03bb.


# page 191: Type Matching

Match the function to its type signature.

```haskell
-- 1. Functions:
a) not    -- 2c)
b) length -- 2d)
c) concat -- 2b)
d) head   -- 2a)
e) (<)    -- 2e)


-- 2. Type signatures:
a) _ :: [a] -> a                -- 1d)
b) _ :: [[a]] -> [a]            -- 1c)
c) _ :: Bool -> Bool            -- 1a)
d) _ :: [a] -> Int              -- 1b)
e) _ :: Ord a => a -> a -> Bool -- 1e)
```

##################################
# page 205: Type Arguments
# 

Given a function and its type, tell us what type results from applying some or all of the arguments.
``haskell
-- 1. If the type of f is a -> a -> a -> a, and the type of 𝑥 is Char then the type of f x is 

a) Char -> Char -> Char # Ans: a)
b) x -> x -> x -> x
c) a -> a -> a
d) a -> a -> a -> Char


-- 2. If the type of g is a -> b -> c -> b, then the type of g 0 'c' "woot" is

a) String
b) Char -> String
c) Int
d) Char           # Ans: d)


-- 3. If the type of h is (Num a, Num b) => a -> b -> b, then the type of h 1.0 2 is:

a) Double
b) Integer         
c) Integral b => b 
d) Num b => b      # Ans: d)


-- Note that because the type variables 𝑎 and 𝑏 are diﬀerent, the compiler must assume that the types could be diﬀerent. 


-- 4. If the type of h is (Num a, Num b) => a -> b -> b, then the type of h 1 (5.5 :: Double) is

a) Integer
b) Fractional b => b
c) Double            # Ans: c)
d) Num b => b


-- 5. If the type of jackal is (Ord a, Eq b) => a -> b -> a, then the type of jackal "keyboard" "has the word jackal in it"

a) [Char]              # Ans: a)
b) Eq b => b
c) b -> [Char]
d) b
e) Eq b => b -> [Char]


-- 6. If the type of jackal is (Ord a, Eq b) => a -> b -> a, then the type of jackal "keyboard" 

a) b
b) Eq b => b
c) [Char]
d) b -> [Char]
e) Eq b => b -> [Char] # Ans: e)


-- 7. If the type of kessel is (Ord a, Num b) => a -> b -> a, then the type of kessel 1 2 is 

a) Integer
b) Int
c) a
d) (Num a, Ord a) => a # Ans: d)
e) Ord a => a
f) Num a => a


-- 8. If the type of kessel is (Ord a, Num b) => a -> b -> a, then the type of kessel 1 (2 :: Integer) is 

a) (Num a, Ord a) => a # Ans: a)
b) Int
c) a
d) Num a => a
e) Ord a => a
f) Integer


-- 9. If the type of kessel is (Ord a, Num b) => a -> b -> a, then the type of kessel (1 :: Integer) 2 is

a) Num a => a
b) Ord a => a
c) Integer             # Ans: c)
d) (Num a, Ord a) => a
e) a
```



# page 213: Parametricity
### see `parametricity_p213.hs`

All you can do with a parametrically polymorphic value is pass or not pass it to some other expression. Prove that to yourself with these small demonstrations.

1. Given the type a -> a, which is the type for id, attempt to make a function that terminates successfully that does something other than returning the same value. This is impossible, but you should try it anyway. 

Ans: 

parametricity01 :: 


2. We can get a more comfortable appreciation of parametricity by looking at a -> a -> a. This hypothetical function a -> a -> a has two–and only two–implementa- tions. Write both possible versions of a -> a -> a. After doing so, try to violate the constraints of parametrically polymorphic values we outlined above.

Ans: 

parametricity02_v1 :: a -> a-> a
parametricity02_v1 a0 a1 = a0

parametricity02_v2 :: a -> a-> a
parametricity02_v2 a0 a1 = a1


3. Implement a -> b -> b. How many implementations can it have? Does the behavior change when the types of 𝑎 and 𝑏 change?

Ans: It can only have one implementation where the second typeclass is returned, since there is no methods defined for a parametrically-polymorphic-defined variable a. Moreover, the behavior does change when the types a and b change.

parametricity03 :: a -> b -> b
parametricity03 a0 b0 = b0





##################################
# page 220: Apply Yourself
# 
#  see: applyYourself_pg220.hs

Look at these pairs of functions. One function is unapplied, so the compiler will infer maximally polymorphic type. The second function has been applied to a value, so the inferred type signature may have become concrete, or at least less polymorphic. Figure out how the type would change and why, make a note of what you think the new inferred type would be and then check your work in GHCi.

```haskell
-- 1. Type signature of general function
(++) :: [a] -> [a] -> [a]
-- How might that change when we apply
-- it to the following value?
myConcat x = x ++ " yo"
```

Ans: -- new type a := Char
```shell
λ> :t myConcat
myConcat :: [Char] -> [Char] 
```

2. -- General function
```haskell
(*) :: Num a => a -> a -> a
-- Applied to a value
myMult x = (x / 3) * 5
```

Ans: -- new type is instance-constrained by Fractional
```shell
λ> :t myMult 
myMult :: Fractional a => a -> a
```

3. 
```haskell
take :: Int -> [a] -> [a]
myTake x = take x "hey you"
```

Ans: -- new type a := Char
```shell
λ> :t myTake
myTake :: Int -> [Char]
```

4. 
```haskell
(>) :: Ord a => a -> a -> Bool
myCom x = x > (length [1..10])
```

Ans: -- length forces to constrain the type to Int, and since Int has instance of Ord, then it is not necessary to specify it again in the type-constrain signature.
```shell
λ> :myCom
myCom :: Int -> Bool
```

5. 
```haskell
(<) :: Ord a => a -> a -> Bool
myAlph x = x < 'z'
```

Ans: -- 'z' forces the type to be constrained to Char, and Char has instance of Ord so no further signature details are needed
```shell
λ> :t myAlph 
myAlph :: Char -> Bool
```



##################################
# page 225: Multiple Choice
# 

```haskell
1. A value of type [a] is

a) a list of alphabetic characters
b) a list of lists
c) a list whose elements are all of some type 𝑎    # Ans: c)
d) a list whose elements are all of diﬀerent types


2. A function of type [[a]] -> [a] could

a) take a list of strings as an argument     # Ans: a)
b) transform a character into a string
c) transform a string into a list of strings
d) take two arguments


3. A function of type [a] -> Int -> a

a) takes one argument
b) returns one element of type 𝑎 from a list # Ans: b)
c) must return an Int value
d) is completely fictional


4. A function of type (a, b) -> a

a) takes a list argument and returns a Char value
b) has zero arguments
c) takes a tuple argument and returns the first value # Ans: c)
d) requires that 𝑎 and 𝑏 be of diﬀerent types
```



# page 226: Determine the type
## see: `determineType_pg226.hs`

Do your best to determine the most polymorphic type an expression could have in the following exercises. 


1. All function applications return a value. Determine the value returned by these function applications and the type of that value.

a) (* 9) 6                                    # Ans: 54 :: Num a => a
b) head [(0,"doge"),(1,"kitteh")]             # Ans: (0,"doge") :: Num a => (a, [Char])
c) head [(0 :: Integer ,"doge"),(1,"kitteh")] # Ans: (0,"doge") :: (Integer, [Char])
d) if False then True else False              # Ans: False :: Bool
e) length [1, 2, 3, 4, 5]                     # Ans: 5 :: Int
f) (length [1, 2, 3, 4]) > (length "TACOCAT") # Ans: False :: Bool


2. Given
```haskell
x = 5
y = x + 5
w = y * 10
-- What is the type of w? 
-- Ans: w :: Num a => a
```

3. Given
```haskell
x = 5
y = x + 5
z y = y * 10
-- What is the type of z?
-- Ans: z :: Num a => a -> a
```

4. Given
```haskell
x = 5
y = x + 5
f = 4 / y
-- What is the type of f?
-- Ans: f :: Fractional a -> a
```

5. Given
```haskell
x = "Julie"
y = " <3 "
z = "Haskell"
f = x ++ y ++ z
-- What is the type of f?
-- Ans: f :: [Char]
```


##################################
# page 229: Does it compile?
# 
# see: doesItCompile_pg229.hs

For each set of expressions, figure out which expression, if any, causes the compiler to squawk at you (n.b. we do not mean literal squawking) and why. Fix it if you can.

```haskell
-- 1.
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
```

##################################
# page 229: Type variable or specific type constructor?
# 

1. You will be shown a type declaration, and you should categorize each type. The choices are a fully polymorphic type variable, constrained polymorphic type variable, or concrete type constructor. 

f :: Num a => a -> b -> Int -> Int
--           [0]  [1]   [2]    [3]
Here, the answer would be: [0] : constrained polymorphic (Num) 
                           [1] : fully polymorphic 
                           [2] : concrete
                           [3] : concrete


2. Categorize each component of the type signature as described in the previous example.

f :: zed -> Zed -> Blah
--   [0]    [1]    [2]
# Ans: [0] : fully polymorphic
       [1] : concrete
       [2] : concrete


3. Categorize each component of the type signature

f :: Enum b => a -> b -> C
--   [0]      [1]  [2]  [3]
# Ans: [0] : class constraint 
       [1] : fully polymorphic
       [2] : constrained polymorphic (to having instances of Enum)
       [3] : concrete (whatever C typeclass is)


4. Categorize each component of the type signature

f :: f -> g -> C
--  [0]  [1]  [2]
# Ans: [0] : fully polymorphic
       [1] : fully polymorphic
       [2] : concrete (whatever C typeclass is)



##################################
# page 230: Write a type signature
# 

For the following expressions, please add a type signature. You should be able to rely on GHCi type inference to check your work, although you might not have precisely the same answer as GHCi gives (due to polymorphism, etc). 


1. While we haven’t fully explained this syntax yet, you’ve seen it in Chapter 2 and as a solution to an exercise in Chapter 4. This syntax is a way of destructuring a single element of a list by pattern matching.

functionH ::
functionH (x:_) = x

# Ans: functionH :: [a] -> a


2. 
functionC ::
functionC x y =
if (x > y) then True else False

# Ans: functionC :: Ord a => a -> a -> Bool


3. functionS ::
functionS (x, y) = y

# Ans: functionS :: (a, b) -> b




##################################
# page 231: Given a type, write the function
# 
```haskell
-- 1. There is only one function definition that typechecks and doesn’t go into an infinite loop when you run it.
-- 
-- i :: a -> a
-- i = undefined
-- # Ans: 
i :: a -> a
i x = x
 

-- 2. There is only one version that works.
-- 
-- c :: a -> b -> a
-- c = undefined
-- # Ans:
c :: a -> b -> a
c xa _ = xa
 

-- 3. Given alpha equivalence are c'' and c (see above) the same thing?
-- 
-- c'' :: b -> a -> b
-- c'' = ?
-- # Ans: YES it is the same thing as c (prob. 2)
c'' :: b -> a -> b
c'' = c 

-- 4. Only one version that works.
-- 
-- c' :: a -> b -> b
-- c' = undefined
-- # Ans:
c' :: a -> b -> b
c' _ xb = xb
 
 
-- 5. There are multiple possibilities, at least two of which you’ve seen in previous chapters.
-- 
-- r :: [a] -> [a]
-- r = undefined
-- # Ans: writing two possibilities: r1 & r2
r1 :: [a] -> [a] -- eg. reversing list
r1 [] = []
r1 (x:xs) = (r1 xs) ++ [x]

r2 :: [a] -> [a] -- eg. half chunk of list swap
r2 xs = (drop half xs) ++ (take half xs)
  where
    half = div (length xs) 2

 
-- 6. Only one version that will typecheck.
-- 
-- co :: (b -> c) -> (a -> b) -> a -> c
-- co = undefined
-- # Ans:
co :: (b -> c) -> (a -> b) -> a -> c
co b2c a2b xa = b2c $ a2b xa
 
 
-- 7. One version will typecheck.
-- 
-- a :: (a -> c) -> a -> a
-- a = undefined
-- # Ans:
a :: (a -> c) -> a -> a
a _ xa = xa

 
-- 8. One version will typecheck.
-- 
-- a' :: (a -> b) -> a -> b
-- a' = undefined
-- # Ans:
a' :: (a -> b) -> a -> b
a' a2b xa = a2b xa
```



##################################
# page 234: Fix it
# 
# see: sing_pg234.hs
# see: arith3broken_pg235.hs
# 

Won’t someone take pity on this poor broken code and fix it up? Be sure to check carefully for things like capitalization, parentheses, and indentation. 

1. 
```haskell
module sing where
fstString :: [Char] ++ [Char]
fstString x = x ++ " in the rain"
sndString :: [Char] -> Char
sndString x = x ++ " over the rainbow"
sing = if (x > y) then fstString x or sndString y
where x = "Singin"
x = "Somewhere"
```

2. Now that it’s fixed, make a minor change and make it sing the other song. If you’re lucky, you’ll end up with both songs stuck in your head!


3. 
```haskell
-- arith3broken.hs
module Arith3Broken where
main :: IO ()
Main = do
print 1 + 2
putStrLn 10
print (negate -1)
print ((+) 0 blah)
where blah = negate 1
```

# page 236: Type-Kwon-Do
 

The idea is to only fill in what we’ve marked with ???. Not all terms will always be used in the intended solution for a problem. 

```haskell
-- 1. 
f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char
h = ???
# Ans: 
h x = (g . f) x


-- 2. 
data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e = ???
# Ans: same as 1. due to alpha equivalence!
e x = (w . q) x


-- 3. 
data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform = ???
-- # Ans: 
xform (x, y) = (xz x, yz y)


-- 4. 
munge :: (x -> y)
      -> (y -> (w, z))
      -> x
      -> w
munge = ???
-- # Ans: 
munge x2y y2wz x = (fst . y2wz . x2y) x
```
