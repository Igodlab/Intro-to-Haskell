{-# LANGUAGE RankNTypes #-}

module NaaturalTransformations where


-- if we want to use Functor to change structure rather than the elements of the structure
--
-- eg.
-- nat :: (f -> g) -> f a -> g a 
--

type Nat f g = forall a . f a -> g a


-- this'll work
maybe2List :: Nat Maybe []
maybe2List Nothing = []
maybe2List (Just x) = [x]

-- -- this won't work
-- degenerateMtl :: Nat Maybe []
-- degenerateMtl Nothing = []
-- degenerateMtl (Just a) = [a + 1]

