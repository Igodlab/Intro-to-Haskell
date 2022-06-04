module SurprisingFunctor where

newtype Constant a b = Constant { getConstant :: a} deriving (Eq, Show)

-- this looks like id right?
instance Functor (Constant a) where
    fmap _ (Constant a) = Constant a

-- Wrap
newtype Wrap f a = Wrap (f a) deriving (Eq, Show)

instance Functor f => Functor (Wrap f) where
    fmap f (Wrap fa) = Wrap (fmap f fa)

-- IO
getInt :: IO Int
getInt = fmap read getLine

-- eg. what is possible with getInt
--
-- A) will always return 3, regardless of the input (eg. 10):
--
-- λ> const 3 getInt -- doesn't wait for cli input
-- 3
--
-- λ> fmap (const 3) getInt -- if we fmap it, then it waits for cli input, still always return 3
-- 10
-- 3
--
--
-- B) We can flip it, and it will return getInt cli input
--
-- λ> fmap (flip const 3) getInt
-- 10
-- 10


-- do notation
meToo :: IO String
meToo = do
    input <- getLine
    return (input ++ " me too!")

bumpIt :: IO Int
bumpIt = do
    intVal <- getInt
    return (intVal + 1)
