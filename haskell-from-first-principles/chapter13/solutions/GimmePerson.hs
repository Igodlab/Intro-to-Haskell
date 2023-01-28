module GimmePerson where

type Name = String
type Age  = Integer 

data Person = Person Name Age deriving Show

data PersonInvalid = 
    NameEmpty
  | AgeTooLow
  | PersonInvalidUnknown String
  deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age | name /= "" && age > 0 = 
                      Right $ Person name age
                  | name == "" = Left NameEmpty
                  | age <= 0   = Left AgeTooLow
                  | otherwise  = Left $ PersonInvalidUnknown $ 
                                    "Name was: " ++ show name ++
                                    " Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do 
    putStrLn "Enter a name: "
    name <- getLine 
    putStrLn "Enter an integer: "
    ageStr <- getLine
    let age = read ageStr :: Integer 
    putStrLn "Your person is"
    putStrLn $ show (mkPerson name age)
