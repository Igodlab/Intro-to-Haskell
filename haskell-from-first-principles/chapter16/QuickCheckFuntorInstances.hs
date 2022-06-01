module QuickCheckFunctorInstances where

import           Test.QuickCheck 
import qualified Test.QuickCheck.Function as QCF

-- Functor must obey id and composition, the two main rules from category theory.
--

functorId :: (Functor f, Eq (f a)) => f a -> Bool
functorId f = id f == f

functorCompose :: (Functor f, Eq (f c))
               => (a -> b)
               -> (b -> c)
               -> f a
               -> Bool
functorCompose f g x = (fmap g (fmap f x)) == (fmap (g . f) x)

functorCompose' :: (Functor f, Eq (f c)) => f a -> QCF.Fun a b -> QCF.Fun b c -> Bool
functorCompose' x (QCF.Fun _ f) (QCF.Fun _ g) = (fmap (g . f) x) == (fmap g . fmap f $ x)

-- quick check
--
idCheck = functorId 

type Int2Int = QCF.Fun Int Int
type ComposeType = [Int] -> Int2Int -> Int2Int -> Bool
composeCheck = functorCompose'


main :: IO ()
main = do 
    print "id test:"
    quickCheck (idCheck :: [Int] -> Bool)
    print "composition test"
    quickCheck (composeCheck :: ComposeType)
