module Hello 
    ( sayHello )
    where

sayHello :: String -> IO ()
sayHello n = 
    putStrLn ("Happy Birthday " ++ n ++ "!")
