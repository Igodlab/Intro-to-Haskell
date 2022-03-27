newtype Name = Name String deriving Show

newtype Acres = Acres Int deriving Show

-- FarmerType is a Sum
data FarmerType = DairyFarmer
                | WheatFarmer
                | SoybeanFarmer
                deriving Show

-- Farmer is a plain ole product of
-- Name, Acres, and FarmerType
data Farmer = Farmer Name Acres FarmerType deriving Show

-- Now we’re going to write a very basic function that breaks down and unpacks the data inside our constructors:
isDairyFarmer :: Farmer -> Bool
isDairyFarmer (Farmer _ _ DairyFarmer) = True
isDairyFarmer _ = False

-- Now an alternate formulation with a product that uses record syntax:
data FarmerRec = FarmerRec { name :: Name
                           , acres :: Acres
                           , farmerType :: FarmerType
                           } deriving Show
