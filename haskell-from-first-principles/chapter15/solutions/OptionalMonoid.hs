module OptionalMonoid where

import Data.Monoid 

data Optional a = Nada | Only a deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
    mempty = Nada

-- Defining mappend is unnecessary, it copies from Semigroup [https://wiki.haskell.org/Monoid]
instance Semigroup a => Semigroup (Optional a) where
    (Only x) <> (Only y) = Only $ x <> y
    Nada     <> x        = x
    x        <> Nada     = x

-- Expected output:
--
-- Prelude> Only (Sum 1) `mappend` Only (Sum 1)
-- Only (Sum {getSum = 2})
--
-- Prelude> Only (Product 4) `mappend` Only (Product 2)
-- Only (Product {getProduct = 8})
--
-- Prelude> Only (Sum 1) `mappend` Nada
-- Only (Sum {getSum = 1})
--
-- Prelude> Only [1] `mappend` Nada
-- Only [1]
--
-- Prelude> Nada `mappend` Only (Sum 1)
-- Only (Sum {getSum = 1})
