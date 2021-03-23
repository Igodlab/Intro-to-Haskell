-- THE HASKELL BOOK
-- Chapter 3

-- STRINGS
-- :type 'A'  ## this is a single character type, which is different to:
-- :type "A"  ## this is a list of strings, words have to be typed in double quot "Hello Wolrd"

module Print1 where
main :: IO ()
main = putStrLn "La Jepeeta"  -- after loading this module we have to type main to get the print

-- note that in the ghci instead or Prelude>
-- it will change to Print11>
--  we can go back unloading the module typing :module or just :m


-- 
whateva :: IO()
whateva = do
  putStrLn "La Bichota"
  putStrLn (" "++"yo tambien tengo una Jepeeta")
  putStr "  La traigo junto ami shorty"


-- pg. 106
myGreeting :: String
myGreeting = "La" ++ "Jepeeta"

myGreeting2 :: String
myGreeting2 = " arrebatao dando vuelta " ++ " en la Jepeeta"

lyric1 :: IO()
lyric1 = do
  putStrLn myGreeting
  putStr myGreeting2
  putStrLn myGreeting3
  where myGreeting3 = concat["  ", "conmigo una", "rubia"]
