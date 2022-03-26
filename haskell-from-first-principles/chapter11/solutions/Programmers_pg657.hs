{-# LANGUAGE StandaloneDeriving #-}
module Programmers where


data OperatingSystem = GnuPlusLinux
                     | OpenBSDPlusNevermindJustBSDStill
                     | Mac
                     | Windows
                     deriving (Eq, Show)

data ProgLang = Haskell
              | Agda
              | Idris
              | PureScript
              deriving (Eq, Show)

data Programmer = Programmer { os   :: OperatingSystem
                             , lang :: ProgLang }
                             deriving (Eq, Show)

nineToFive :: Programmer 
nineToFive = Programmer { os = Mac , lang = Haskell }

-- We can reorder stuff
-- when we use record syntax
feelingWizardly :: Programmer 
feelingWizardly = Programmer { lang = Agda , os = GnuPlusLinux }

-- Write a function that generates all possible values of Programmer. Use the provided lists of inhabitants of OperatingSystem and ProgLang.
--
-- # Ans: We can either hard code a variable list of all data constructors for OperatingSystem & ProgLang or we can use the pragma {-# LANGUAGE StandaloneDeriving #-} to derive enum instance.
--

deriving instance Bounded OperatingSystem 
deriving instance Bounded ProgLang

deriving instance Enum OperatingSystem 
deriving instance Enum ProgLang

allValuesProgrammer :: [Programmer]
allValuesProgrammer = [Programmer { os = os_i, lang = lang_i} | os_i <- allOS
                                                              , lang_i <- allLangs]
  where
    allOS    = [minBound :: OperatingSystem .. maxBound :: OperatingSystem]
    allLangs = [minBound :: ProgLang .. maxBound :: ProgLang]


type Intis = Int

data BestMetal = Opeth | Tool | PorcupineTree deriving (Show)

data IntisMetal = IntisMetal Intis BestMetal deriving Show
