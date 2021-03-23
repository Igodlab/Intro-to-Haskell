-- FunctionWithWhere.hs
-- `where` in contrast to `let` is a DECLARATION and is bound to a surrounding construct
module FunctionWithWhere where

printInc n = print plus2
 where plus2 = n + 2
