module MonoidProperty 
    ( monoidAssoc
    , monoidLeftIdentity
    , monoidRightIdentity) where

-- test Associativity
monoidAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
monoidAssoc x y z = x <> (y <> z) == (x <> y) <> z

-- test Left Identity
monoidLeftIdentity :: (Eq m, Monoid m) => m -> Bool
monoidLeftIdentity x = (mempty <> x) == x

-- test Right Identity
monoidRightIdentity :: (Eq m, Monoid m) => m -> Bool
monoidRightIdentity x = (x <> mempty) == x

