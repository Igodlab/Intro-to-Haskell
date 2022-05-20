module MaybeAnotherMonoid where

import           Data.Monoid
import           Test.QuickCheck
import qualified OptionalMonoid  as OM
import qualified MonoidProperty  as MP

 -- Write a Monoid instance for a Maybe type which doesn’t require a Monoid for the contents. Reuse the Monoid law QuickCheck properties and use them to validate the instance. 
 --
 -- Don’t forget to write an Arbitrary instance for First'. We won’t always stub that out explicitly for you. We suggest learning how to use the frequency function from QuickCheck for First'’s instance.

--
newtype First' a = First' { getFirst' :: OM.Optional a } deriving (Eq, Show)

instance Monoid (First' a) where
    mempty = First' OM.Nada

instance Semigroup (First' a) where
    (<>) (First' (OM.Only k)) _ = First' (OM.Only k)
    (<>) (First' OM.Nada)     x = x

instance Arbitrary a => Arbitrary (First' a) where
    arbitrary = do
        h <- arbitrary
        elm <- elements [OM.Nada, OM.Only h]
        return $ First' elm

foo :: First' a -> OM.Optional a
foo (First' x) = x


firstMappend :: (Semigroup a) => First' a -> First' a -> First' a
firstMappend = (<>) 

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
