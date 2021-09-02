{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_TheHaskellBook_project (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/igodlab/.cabal/bin"
libdir     = "/home/igodlab/.cabal/lib/x86_64-linux-ghc-8.8.3/TheHaskellBook-project-0.1.0.0-inplace-TheHaskellBook-project-exe"
dynlibdir  = "/home/igodlab/.cabal/lib/x86_64-linux-ghc-8.8.3"
datadir    = "/home/igodlab/.cabal/share/x86_64-linux-ghc-8.8.3/TheHaskellBook-project-0.1.0.0"
libexecdir = "/home/igodlab/.cabal/libexec/x86_64-linux-ghc-8.8.3/TheHaskellBook-project-0.1.0.0"
sysconfdir = "/home/igodlab/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "TheHaskellBook_project_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "TheHaskellBook_project_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "TheHaskellBook_project_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "TheHaskellBook_project_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "TheHaskellBook_project_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "TheHaskellBook_project_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
