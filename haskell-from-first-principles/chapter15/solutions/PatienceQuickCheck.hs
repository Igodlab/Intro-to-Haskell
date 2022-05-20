module PatienceQuickCheck where

import           Control.Monad
import           Data.Monoid
import           Test.QuickCheck
import qualified MonoidProperty as MP

data Bull = Fool | Two deriving (Eq, Show)

instance Arbitrary Bull where
    arbitrary = frequency [ (1, return Fool)
                          , (1, return Two)
                          ]

instance Monoid Bull where
    mempty = Fool

instance Semigroup Bull where
    (<>) mempty Two = Two
    (<>) Two mempty = Two
    (<>) _ _  = Fool

type BullSemigroup = Bull -> Bull -> Bull -> Bool

main :: IO ()
main = do
    let ma  = MP.monoidAssoc 
        mli = MP.monoidLeftIdentity
        mri = MP.monoidRightIdentity
    quickCheck (ma :: BullSemigroup)
    quickCheck (mli :: Bull -> Bool)
    quickCheck (mri :: Bull -> Bool)

