module RegisterUser where

newtype Username = Username String

newtype AccountNumber = AccountNumber Integer

data User = UnregisteredUser | RegisteredUser Username AccountNumber

printUser :: User -> IO ()
printUser UnregisteredUser = putStrLn "UnregisteredUser"
printUser (RegisteredUser (Username n) (AccountNumber a)) = putStrLn $ n ++ " - " ++ show a

addOneIfOdd n = case odd n of
                True  -> f n
                False -> n
              -- where f n = n + 1
              -- # Ans:
              where f = \x -> x + 1
                
addFive = \x -> \y -> 5 + if x > y then y else x 

mflip f = \x -> \y -> f y x
