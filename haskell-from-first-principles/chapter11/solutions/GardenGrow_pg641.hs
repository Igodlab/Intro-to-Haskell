module GardenGrow where

data FlowerType = Gardenia
                | Daisy
                | Rose
                | Lilac
                deriving Show

type Gardener = String

data Garden = Garden Gardener FlowerType deriving Show

-- 1. What is the sum of products normal form of Garden?
-- # Ans: Remember that the NORMAL FORM is the sum of products, so:
--
--        data Garden = Gardenia Gardener
--                    | Daisy    Gardener
--                    | Rose     Gardener
--                    | Lilac    Gardener
--                    deriving Show
--
--        Gardener has the same cardinality as String = 1114112,
--        FlowerType has cardinality of 4 and thus
--        Garden has cardinality = 1114112 x 4 = 4456448
--        
