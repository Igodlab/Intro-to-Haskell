class Numberish a where
    fromNumber :: Integer -> a
    toNumber   :: a -> Integer
    defaultNum :: a

newtype Age = Age Integer
    deriving (Show, Eq)

instance Numberish Age where
    fromNumber n     = Age n
    toNumber (Age n) = n
    defaultNum       = Age 0

newtype Year = Year Integer 
    deriving (Eq, Show)

instance Numberish Year where
    fromNumber n      = Year n
    toNumber (Year n) = n
    defaultNum        = Year 2022
    
sumNumberish :: Numberish a => a -> a -> a
sumNumberish x x' = fromNumber summed
  where
    summed = (toNumber x) + (toNumber x')
