module EnumFromTo where


-- Write your own enumFromTo definitions for the types provided. Do not use range syntax to do so. It should return the same results as if you did [start..stop]. Replace the undefined, an value which results in an error when evaluated, with your own definition.
--
eftBool :: Bool -> Bool -> [Bool]
-- eftBool = undefined
eftBool b0 bf | b0 > bf  = []
              | b0 == bf = [b0]
              | b0 < bf  = b0 : eftBool (succ b0) bf

eftOrd :: Ordering -> Ordering -> [Ordering]
-- eftOrd = undefined
eftOrd ord0 ordf | ord0 > ordf  = []
                 | ord0 == ordf = [ord0]
                 | ord0 < ordf  = ord0 : eftOrd (succ ord0) ordf

eftInt :: Int -> Int -> [Int]
-- eftInt = undefined
eftInt n0 nf | n0 == nf = [n0]
             | n0 > nf  = n0 : eftInt (n0 - 1) nf
             | n0 < nf  = n0 : eftInt (n0 + 1) nf

eftChar :: Char -> Char -> [Char]
-- -- eftChar = undefined
eftChar c0 cf | c0 == cf = [c0]
              | c0 > cf  = c0 : eftChar (pred c0) cf
              | c0 < cf  = c0 : eftChar (succ c0) cf
