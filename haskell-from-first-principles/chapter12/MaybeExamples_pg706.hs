module MaybeExamples where

ifEvenAdd2 :: Integer -> Maybe Integer
ifEvenAdd2 n = if even n then Just $ n + 2 else Nothing

-- a better alternative would be to use Either
ifEvenAdd2' :: Integer -> Either Integer String
ifEvenAdd2' n = if even n then Left $ n + 2 else Right "No papu"
