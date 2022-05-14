module MaybeAnotherMonoid where

import           Data.Monoid
import           Test.QuickCheck
import qualified OptionalMonoid_pg913 as OM
import qualified MonoidProperty       as MP

 -- Write a Monoid instance for a Maybe type which doesn’t require a Monoid for the contents. Reuse the Monoid law QuickCheck properties and use them to validate the instance. 
 --
 -- Don’t forget to write an Arbitrary instance for First'. We won’t always stub that out explicitly for you. We suggest learning how to use the frequency function from QuickCheck for First'’s instance.

--
newtype First' a = First' { getFirst' :: OM.Optional a } deriving (Eq, Show)

instance Arbitrary (First' a) where
    arbitrary = frequency [ (1, return a)
                          , (1, return a)
                          ]

instance Monoid a => Monoid (First' a) where
    mempty = First' {getFirst' = OM.Nada}

instance Semigroup a => Semigroup (First' a) where
    (<>) (First' x) (First' y) =  First' {getFirst' = x <> y}

foo :: First' a -> OM.Optional a
foo (First' x) = x


firstMappend :: (Semigroup a) => First' a -> First' a -> First' a
firstMappend f1 f2 = (<>) f1 f2

type FirstMappend =  First' String
                  -> First' String
                  -> First' String
                  -> Bool

type FstId = First' String -> Bool

main :: IO ()
main = do 
    quickCheck (MP.monoidAssoc :: FirstMappend)
    quickCheck (MP.monoidLeftIdentity :: FstId)
    quickCheck (MP.monoidRightIdentity :: FstId)
