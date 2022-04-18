module EitherLibrary where

-- 1. Try to eventually arrive at a solution that uses foldr, even if earlier versions don’t use foldr.
--
lefts' :: [Either a b] -> [a]
lefts' = foldr (\x acc -> case x of 
                            (Left z) -> z : acc
                            _        -> acc) []


-- 2. Same as the last one. Use foldr eventually.
rights' :: [Either a b] -> [b]
rights' = foldr (\x acc -> case x of 
                            (Right z) -> z : acc
                            _         -> acc) []


-- 3. 
partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' xs = (lefts' xs, rights' xs)


-- 4. 
eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' f e = case e of
                    (Left _)  -> Nothing
                    (Right x) -> Just $ f x

-- 5. This is a general catamorphism for Either values.
either' :: (a -> c) 
        -> (b -> c)
        -> Either a b 
        -> c
either' f g e = case e of
                (Left x)  -> f x
                (Right x) -> g x


-- 6. Same as before, but use the either' function you just wrote.
eitherMaybe'' :: (b -> c)
              -> Either a b
              -> Maybe c
eitherMaybe'' f e = case e of
                    (Left _)  -> Nothing
                    (Right x) -> Just $ either' id f (Right x)

