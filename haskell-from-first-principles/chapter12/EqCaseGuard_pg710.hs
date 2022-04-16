{-# LANGUAGE StandaloneDeriving #-}

module EqCaseGuard where


type Age = Integer

type Name = String

data Person = Person Name Age 
deriving instance Show Person

data PersonInvalid = EmptyName | NegativeAge
deriving instance Eq PersonInvalid

toString :: PersonInvalid -> String
toString EmptyName   = "EmptyName bro"
toString NegativeAge = "nO WAY DudE"

instance Show PersonInvalid where
    show = toString 

blah :: PersonInvalid -> String 
blah per | per == EmptyName   = "EmptyName bro"
         | per == NegativeAge = "nO WAy DudE"
         | otherwise          = "daFuq u doing?"

mkPerson :: Name -> Age -> Either Person String
mkPerson n a | n /= "" && a >= 0 = Left $ Person n a
             | n == "" = Right $ blah EmptyName
             | a < 0   = Right $ blah NegativeAge


-- pg 720: Higher-Kinded-Types
--
data TypeExammple a = Greatest | AllTime | Goat a deriving Show
