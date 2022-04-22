module OptionalMonoid where

import qualified Data.Monoid as DM

data Optional a = Nada | Only a deriving (Eq, Show)

instance (Semigroup a, Monoid a) => Monoid (Optional a) where
    mempty = Nada

    mappend Nada (Only x) = Only (x)
    mappend (Only x) Nada = Only (x)
    mappend (Only x) (Only y) = Only (x <> y)

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
