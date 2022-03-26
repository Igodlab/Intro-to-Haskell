-- Following along with the book: 
--
-- There are essentially two things we can do with a value: we can generate or construct it or we can match on it and consume it.
--
data GuessWhat         = Chickenbutt deriving (Eq, Show)
data Id a              = MkId a deriving (Eq, Show)
data Product a b       = Product a b deriving (Eq, Show)
data Sum a b           = First a | Second b deriving (Eq, Show)
data RecordProduct a b = RecordProduct { pfirst :: a , psecond :: b } deriving (Eq, Show)

-- Sum and Product
--
newtype NumCow  = NumCow Int deriving (Eq, Show) 
newtype NumPig  = NumPig Int deriving (Eq, Show)
data Farmhouse  = Farmhouse NumCow NumPig deriving (Eq, Show)
type Farmhouse' = Product NumCow NumPig --Farmhouse' is the same as Farmhouse

