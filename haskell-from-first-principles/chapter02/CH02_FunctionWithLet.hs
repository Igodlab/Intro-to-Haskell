-- FunctionWithLet.hs
-- `let` in contrast to `where` is an expression, so it can be used wherever you can have an expression
module FunctionWithLet where

printInc2 n = let plus2 = n + 2
 in print plus2
