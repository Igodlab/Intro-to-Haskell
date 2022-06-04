module ReplaceExperiment where

-- replaces whatever input to 'p'
replaceWithP :: b -> Char
replaceWithP = const 'p'

lms :: [Maybe [Char]]
lms = [Just "Ave", Nothing, Just "whohoo"]


-- liftReplace'' :: Functor f => f a -> f Char
-- liftReplace'' = fmap 

liftOnce :: [Maybe [Char]] -> [Char]
liftOnce = fmap replaceWithP

liftTwice :: [Maybe [Char]] -> [Maybe Char]
liftTwice = (fmap . fmap) replaceWithP

liftThird :: [Maybe [Char]] -> [Maybe [Char]]
liftThird = (fmap . fmap . fmap) replaceWithP
