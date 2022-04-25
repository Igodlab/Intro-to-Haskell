module TestsQuickCheck where

import Data.Monoid
import Test.QuickCheck

-- test Associativity
monoidAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
monoidAssoc x y z = x <> (y <> z) == (x <> y) <> z

-- now use QuickCheck in the repl, like:
--
-- Prelude> type S = String
-- Prelude> type B = Bool
-- Prelude> quickCheck (monoidAssoc :: S -> S -> S -> B)
-- +++ Ok, passed 100 tests.
--
--
-- or if you want to know what values were tested use:
--
-- Prelude> verboseCheck monoidAssoc
-- Passed:
-- ()
-- ()
-- ()
-- ... repeats 99 more times


-- test Left Identity
monoidLeftIdentity :: (Eq m, Monoid m) => m -> Bool
monoidLeftIdentity x = (mempty <> x) == x

-- test Right Identity
monoidRightIdentity :: (Eq m, Monoid m) => m -> Bool
monoidRightIdentity x = (x <> mempty) == x

-- Prelude> quickCheck (monoidLeftIdentity :: String -> Bool)
-- +++ OK, passed 100 tests.
--
-- Prelude> quickCheck (monoidRightIdentity :: String -> Bool)
-- +++ OK, passed 100 tests.
