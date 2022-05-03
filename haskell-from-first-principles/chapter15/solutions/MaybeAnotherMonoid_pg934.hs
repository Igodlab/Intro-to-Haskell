module MaybeAnotherMonoid where

import Data.Monoid
import Test.QuickCheck
import OptionalMonoid

-- Write a Monoid instance for a Maybe type which doesn’t require a Monoid for the contents. Reuse the Monoid law QuickCheck prop- erties and use them to validate the instance. Don’t forget to write an Arbitrary instance for First'. We won’t always stub that out explicitly for you. We suggest learning how to use the frequency function from QuickCheck for First'’s instance.    
--
--
newtype First' a = First' { getFirst' :: Optional a } deriving (Eq, Show)

instance Arbitrary (First' a) where
    arbitrary = frequency [ (1, return a)
                          , (1, return :a)
                          ]

instance Monoid (First' a) where
    mempty = undefined

instance Semigroup (First' a) where
    (<>) = undefined

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

main :: IO ()
main = do 
    quickCheck (monoidAssoc :: FirstMappend)
    quickCheck (monoidLeftIdentity :: FstId)
    quickCheck (monoidRightIdentity :: FstId)
