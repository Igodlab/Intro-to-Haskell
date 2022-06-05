{-# LANGUAGE FlexibleInstances #-}

module WriteFunctorInstances where

-- Write Functor instances for the following datatypes.
--
-- 1. 
data Quant a b = Finance | Desk a | Bloor b 



-- 2. No, it’s not interesting by itself.
data K a b = K a


-- 3.
--
-- should remind you of an
-- instance you've written before
--
newtype Flip f a b = Flip (f b a) deriving (Eq, Show)
newtype K a b = K a
instance Functor (Flip K a) where
    fmap = undefined

-- 4. 
--
-- You thought you'd escaped the goats
-- by now didn't you? Nope.
--
-- No, it doesn’t do anything interesting. No magic here or in the previous exercise. If it works, you succeeded.
--
data EvilGoateeConst a b = GoatyConst b



-- 5. Do you need something extra to make the instance work?
data LiftItOut f a = LiftItOut (f a)


-- 6. 
data Parappa f g a = DaWrappa (f a) (g a)



-- 7. Don’t ask for more typeclass instances than you need. You can let GHC tell you what to do.
data IgnoreOne f g a b = IgnoringSomething (f a) (g b) 



-- 8. 
data Notorious g o a t = Notorious (g o) (g a) (g t)


-- 9. You’ll need to use recursion.
data List a = Nil | Cons a (List a)


-- 10. A tree of goats forms a Goat-Lord, fearsome poly-creature.
-- A VERITABLE HYDRA OF GOATS
data GoatLord a = NoGoat | OneGoat a  | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)



-- 11. You’ll use an extra functor for this one, although your solution might do it monomorphically without using fmap.
--
-- Keep in mind that you will probably not be able to validate this one in the usual manner. Do your best to make it work.
--
data TalkToMe a = Halt | Print String a | Read (String -> a)



