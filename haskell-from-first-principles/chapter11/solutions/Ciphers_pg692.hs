module Ciphers where

-- In the Lists chapter, you wrote a Caesar cipher. Now, we want to expand on that idea by writing a Vigenère cipher. A Vigenère cipher is another substitution cipher, based on a Caesar cipher, but it uses a series of Caesar ciphers for polyalphabetic substitution. The substitution for each letter in the plaintext is determined by a fixed keyword.
--
-- So, for example, if you want to encode the message “meet at dawn,” the first step is to pick a keyword that will determine which Caesar cipher to use. We’ll use the keyword “ALLY” here. You repeat the keyword for as many characters as there are in your original message:
--
-- MEET AT DAWN
-- ALLY AL LYAL
--
-- Now the number of rightward shifts to make to encode each character is set by the character of the keyword that lines up with it. The ’A’ means a shift of 0, so the initial M will remain M. But the ’L’ for our second character sets a rightward shift of 11, so ’E’ becomes ’P’. And so on, so “meet at dawn” encoded with the keyword “ALLY” becomes “MPPR AE OYWY.” Like the Caesar cipher, you can find all kinds of resources to help you understand the cipher and also many examples written in Haskell. Consider using a combination of chr, ord, and mod again, possibly very similar to what you used for writing the original Caesar cipher.
--

