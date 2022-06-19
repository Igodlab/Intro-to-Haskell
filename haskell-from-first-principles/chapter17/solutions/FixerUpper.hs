module FixerUpper where

-- Given the function and values provided, use (<$>) from Functor, (<*>) and pure from the Applicative typeclass to fill in missing bits of the broken code to make it work 
--
--
-- Prob 1.
--
-- const <$> Just "Hello" <*> "World"
prob1 = const <$> Just "Hello" <*> pure "World"




-- Prob 2.
--
-- (,,,) Just 90 <*> Just "Tierness" [1,2,3]
prob2 = (,,,) <$> Just 90 <*> Just "Tierness" <*> pure [1,2,3] <*> pure "Fill w/ whatever"
