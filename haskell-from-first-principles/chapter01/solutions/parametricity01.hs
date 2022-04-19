-- ##################################
-- # page 213: Parametricity
-- # 
-- # see parametricity_p213.hs 
-- 
-- All you can do with a parametrically polymorphic value is pass or not pass it to some other expression. Prove that to yourself with these small demonstrations.
-- 
-- 1. Given the type a -> a, which is the type for id, attempt to make a function that terminates successfully that does something other than returning the same value. This is impossible, but you should try it anyway. 
-- 
-- Ans: 
-- 
parametricity01 :: a -> a
parametricity01 a0 = a0


-- 2. We can get a more comfortable appreciation of parametricity by looking at a -> a -> a. This hypothetical function a -> a -> a has two–and only two–implementa- tions. Write both possible versions of a -> a -> a. After doing so, try to violate the constraints of parametrically polymorphic values we outlined above.
-- 
-- Ans: 
-- 
parametricity02_v1 :: a -> a -> a
parametricity02_v1 a0 a1 = a0

parametricity02_v2 :: a -> a -> a
parametricity02_v2 a0 a1 = a1


-- 3. Implement a -> b -> b. How many implementations can it have? Does the behavior change when the types of 𝑎 and 𝑏 change?
-- 
-- Ans: It can only have one implementation where the second typeclass is returned, since there is no methods defined for a parametrically-polymorphic-defined variable a. Moreover, the behavior does change when the types a and b change.
-- 
parametricity03 :: a -> b -> b
parametricity03 a0 b0 = b0

