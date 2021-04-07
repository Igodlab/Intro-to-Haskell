-- The Haskell Book
--
-- pg. 159
-- greet if cool

module GreetIfCool1 where


-- dev@ greetIfCool1: takes a string and returns a string depending on Bool condition
-- @param coolness: is a string type and is the input
-- @param cool: is the Bool condition computed after evaluation

greetIfCool :: String -> IO ()
greetIfCool coolness = 
  if cool
    then putStrLn "heey, whats poppin'"
  else 
    putStrLn "don't mind me, just watchin'"
  
  where cool = 
          coolness == "say hi Alina"
      
      
-------------------------------------------


