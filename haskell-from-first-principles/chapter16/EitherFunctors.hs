module EitherFunctors where

-- increase if Just
incIfRight :: Num a => Either b a -> Either b a 
incIfRight (Left x)  =  Left x
incIfRight (Right x) = Right (x + 1)

-- show if Just
showIfRight :: Show a => Either b a -> Either b String 
showIfRight (Left x)  =  Left x
showIfRight (Right x) = Right $ show x

-- Generalize the pattern (not only for Maybe)
--
incLift :: (Functor f, Num a) => f a -> f a
incLift = fmap (+1)

showLift :: (Functor f, Show a) => f a -> f String
showLift = fmap show
