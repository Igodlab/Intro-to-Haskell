module GoodBadUgly where

-- We can build bad functors that break identity
--
data WhoCares a = ItDoesnt | Matter a | WhatIsCalled deriving (Eq, Show)

-- preserves structure
--
-- instance Functor WhoCares where 
--     fmap _ ItDoesnt     = ItDoesnt
--     fmap _ WhatIsCalled = WhatIsCalled
--     fmap f (Matter a)   = Matter (f a)



-- breaks the structure (id doesn't hold)
--
instance Functor WhoCares where
    fmap _ ItDoesnt = WhatIsCalled
    fmap f WhatIsCalled = ItDoesnt
    fmap f (Matter a) = Matter (f a)


-- We can build bad functors that break composability
--
data Compose a = Compose Int a deriving (Eq, Show)

-- preserves structure AND composability
-- 
-- instance Functor Compose where
--     fmap f (Compose n a) = Compose (n+1) (f a)

-- preserves structure BUT breaks composability
-- 
instance Functor Compose where
    fmap f (Compose n a) = Compose (n+1) (f a)


data La a b c = Los a | Angeles b | California c deriving (Eq, Show)

instance Functor (La a b) where
    fmap f (California c) = California (f c)
