{-# LANGUAGE FlexibleInstances #-}

module WriteFunctorInstances where

-- Write Functor instances for the following datatypes.
--
-- 1. 
data Quant a b = Finance | Desk a | Bloor b 

instance Functor (Quant a) where
    fmap f (Bloor a) = Bloor (f a)
    fmap _ (Desk a)  = Desk a
    fmap _ Finance   = Finance


-- 2. No, it’s not interesting by itself.
data K' a b = K' a

instance Functor (K' a) where
    fmap _ (K' a) = K' a

-- 3.
--
-- should remind you of an
-- instance you've written before
--
newtype Flip f a b = Flip (f b a) deriving (Eq, Show)
newtype K a b = K a

instance Functor (Flip K a) where
    fmap f (Flip (K b)) = Flip (K (f b))

-- 4. 
--
-- You thought you'd escaped the goats
-- by now didn't you? Nope.
--
-- No, it doesn’t do anything interesting. No magic here or in the previous exercise. If it works, you succeeded.
--
data EvilGoateeConst a b = GoatyConst b

instance Functor (EvilGoateeConst a) where
    fmap f (GoatyConst b) = GoatyConst $ f b


-- 5. Do you need something extra to make the instance work?
data LiftItOut f a = LiftItOut (f a)

instance Functor f => Functor (LiftItOut f ) where
    fmap f (LiftItOut fa) = LiftItOut $ fmap f fa


-- 6. 
data Parappa f g a = DaWrappa (f a) (g a)

instance (Functor f, Functor g) => Functor (Parappa f g) where
    fmap f (DaWrappa fa ga) = DaWrappa (fmap f fa) (fmap f ga)



-- 7. Don’t ask for more typeclass instances than you need. You can let GHC tell you what to do.
data IgnoreOne f g a b = IgnoringSomething (f a) (g b) 

instance (Functor f, Functor g) => Functor (IgnoreOne f g a) where
    fmap f (IgnoringSomething f' g') = IgnoringSomething f' (fmap f g')


-- 8. 
data Notorious g o a t = Notorious (g o) (g a) (g t)

instance Functor g => Functor (Notorious g o a) where
    fmap f (Notorious go ga gt) = Notorious go ga (fmap f gt)


-- 9. You’ll need to use recursion.
data List a = Nil | Cons a (List a)

instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons a lst) = Cons (f a) (fmap f lst)


-- 10. A tree of goats forms a Goat-Lord, fearsome poly-creature.
-- A VERITABLE HYDRA OF GOATS
data GoatLord a = NoGoat | OneGoat a | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)

instance Functor GoatLord where
    fmap _ NoGoat                  = NoGoat
    fmap f (OneGoat a)             = OneGoat $ f a
    fmap f (MoreGoats gl1 gl2 gl3) = MoreGoats (fmap f gl1) (fmap f gl2) (fmap f gl3)


-- 11. You’ll use an extra functor for this one, although your solution might do it monomorphically without using fmap.
--
-- Keep in mind that you will probably not be able to validate this one in the usual manner. Do your best to make it work.
--
data TalkToMe a = Halt | Print String a | Read (String -> a)

instance Functor TalkToMe where
    fmap _ Halt          = Halt
    fmap f (Print str a) = Print str $ f a
    fmap f (Read g)      = Read (f . g)


