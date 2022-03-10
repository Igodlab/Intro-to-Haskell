module WarmUp where

-- For the following set of exercises, you are not expected to use folds. 
--
-- 1. Given the following sets of consonants and vowels:
stops = "pbtdkg"
vowels = "aeiou"

-- a) Write a function that takes inputs from stops and vowels and makes 3-tuples of all possible stop-vowel-stop combinations. These will not all correspond to real words in English, although the stop-vowel-stop pattern is common enough that many of them will.
stopVowelStop :: [(Char, Char, Char)]
stopVowelStop = [(i1, j, i2) | i1 <- stops, j <- vowels, i2 <- stops]

-- b) Modify that function so that it only returns the combinations that begin with a p.
beginWithP :: [(Char, Char, Char)] 
beginWithP = filter ((== 'p') . fst3) stopVowelStop
  where
    fst3 :: (a, a, a) -> a
    fst3 (x, _, _) = x
  

-- c) Now set up lists of nouns and verbs (instead of stops and vowels) and modify the function to make tuples representing possible noun-verb-noun sentences.


-- 2. What does the following mystery function do? What is its type? Try to get a good sense of what it does before you test it in the REPL to verify it.
--
-- seekritFunc x = div (sum (map length (words x))) (length (words x))
--
-- 
-- 3. We’d really like the answer to be more precise. Can you rewrite that using fractional division?
--

