module EitherVsValidation where

data Validation err a = Fail err | Success a deriving (Eq, Show)

data Errors = DividedByZero | StackOverflow | MooglesChewedWires deriving (Eq, Show)

valid2Either :: Validation e a -> Either e a
valid2Either (Fail e) = Left e
valid2Either (Success a) = Right a

either2Valid :: Either e a -> Validation e a
either2Valid (Left e) = Fail e
either2Valid (Right a) = Success a

instance Functor (Validation e) where
    fmap f (Success a) = Success (f a)
    fmap _ (Fail x) = undefined

instance Applicative (Applicative)

-- success = Success (+1) <*> Success 1
-- success == Success 2
-- 
-- failure = Success (+1) <*> Failure [StackOverflow]
-- failure == Failure [StackOverflow]
-- 
-- failure' = Failure [StackOverflow] <*> Success (+1)
-- failure' == Failure [StackOverflow]
-- 
-- failures = Failure [MooglesChewedWires] <*> Failure [StackOverflow]
-- failures == Failure [MooglesChewedWires , StackOverflow]
-- 
-- instance 
