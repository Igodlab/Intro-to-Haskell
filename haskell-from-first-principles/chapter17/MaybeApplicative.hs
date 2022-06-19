module MaybeApplicative where

import GHC.Base (liftA2, liftA3)


-- f ~ Maybe
--
-- (<*>) :: f (a -> b) -> f a -> f b 
-- (<*>) :: M (a -> b) -> f a -> f b
--

-- ------------------------------------------------------------------------------------------
-- pg. 1084 example: Using the Maybe Applicative
validateLength :: Int -> String -> Maybe String
validateLength maxLen s = if (length s) > maxLen
                          then Nothing
                          else Just s

newtype Name = Name String deriving (Eq, Show)

newtype Address = Address String deriving (Eq, Show)

data Person = Person Name Address deriving (Eq, Show)


mkName :: String -> Maybe Name
mkName s = Name <$> validateLength 25 s

mkAddress :: String -> Maybe Address
mkAddress s = Address <$> validateLength 100 s

-- mkPerson' has the (a -> b) hiding inside the Maybe
-- using Applicative can lift over that pattern as implemented in mkPerson
mkPerson' :: String -> String -> Maybe Person
mkPerson' n a = case mkName n of 
                Nothing -> Nothing
                Just n' -> case mkAddress a of
                            Nothing -> Nothing
                            Just a' -> Just $ Person n' a'

nam  = mkName "Mac Caco"
nam2 = mkName "Arnold Alois Schwarzenegger"
add  = mkAddress "5ft Ave Central"
-- try the following in Prelude:
--
-- Prelude> Person <$> nam <*> add
-- Just (Person (Name "Mac Caco") (Address "5ft Ave Central"))
--
-- Prelude> Person <$> nam2 <*> add
-- Nothing

mkPerson :: String -> String -> Maybe Person
mkPerson n a = Person <$> mkName n <*> mkAddress a

-- ------------------------------------------------------------------------------------------
-- pg. 1098 example: Cow - another example of Applicative with Maybe
data Cow = Cow { name   :: String
               , age    :: Int
               , weight :: Int
               } deriving (Eq, Show)

-- define the following for lifting over the Maybe Functor 
noEmpty :: String -> Maybe String
noEmpty ""  = Nothing
noEmpty str = Just str

noNeg :: Int -> Maybe Int
noNeg x | x >= 0    = Just x
        | otherwise = Nothing

-- normal data constructor build
cow1 = Cow "Mila" 5 600

-- Applicative data constructor build (over Maybe)
cow2 = Cow <$> noEmpty "Mila" <*> noNeg 5 <*> noNeg 600

-- Another more sophisticated way
cow3 = liftA3 Cow (noEmpty "Mila") (noNeg 5) (noNeg 600)

