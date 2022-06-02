module MaybeFunctors where

-- increase if Just
incIfJust :: Num a => Maybe a -> Maybe a
incIfJust (Just n) = Just (n + 1)

-- show if Just
showIfJust :: Show a => Maybe a -> Maybe String
showIfJust (Just n) = Just (show n)

-- fmap for increase
incMaybe :: Num a => Maybe a -> Maybe a
incMaybe = fmap (+1)

-- fmap for show
showMaybe :: Show a => Maybe a -> Maybe String
showMaybe = fmap show 



-- Generalize the pattern (not only for Maybe)
--
incLift :: (Functor f, Num a) => f a -> f a
incLift = fmap (+1)

showLift :: (Functor f, Show a) => f a -> f String
showLift = fmap show
