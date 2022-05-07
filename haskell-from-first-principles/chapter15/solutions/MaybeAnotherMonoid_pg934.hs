module MaybeAnotherMonoid where

import           Data.Monoid
import           Test.QuickCheck
import OptionalMonoid_pg913 (Optional (..))

 -- Write a Monoid instance for a Maybe type which doesn’t require a Monoid for the contents. Reuse the Monoid law QuickCheck properties and use them to validate the instance. 
 --
 -- Don’t forget to write an Arbitrary instance for First'. We won’t always stub that out explicitly for you. We suggest learning how to use the frequency function from QuickCheck for First'’s instance.

--
newtype First' a = First' { getFirst' :: Optional a } deriving (Eq, Show)

--instance Arbitrary (First' a) where
--    arbitrary = frequency [ (1, return a)
--                          , (1, return a)
--                          ]

-- good thing is that we don't require Monoid instance for the
-- argument of First' because its instance is inherited when imported!
instance Monoid (First' a) where
    mempty = First' {getFirst' = Nada}

instance (Monoid a) => Semigroup (First' a) where
    (<>) (First' x) (First' y) =  First' {getFirst' = x <> y}

foo :: First' a -> Optional a
foo (First' x) = x


firstMappend :: First' a
             -> First' a
             -> First' a
firstMappend = mappend

type FirstMappend =  First' String
                  -> First' String
                  -> First' String
                  -> First' String
                  -> Bool

type FstId = First' String -> Bool

-- main :: IO ()
-- main = do 
--     quickCheck (MP.monoidAssoc :: FirstMappend)
--     quickCheck (MP.monoidLeftIdentity :: FstId)
--     quickCheck (MP.monoidRightIdentity :: FstId)
