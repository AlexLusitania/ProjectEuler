module Main where

import Data.Char (intToDigit)
import Numeric (showIntAtBase)

isPalindrome :: Eq a => [a] -> Bool
isPalindrome l = l == reverse l

numberToBinary :: Int -> String
numberToBinary n = showIntAtBase 2 intToDigit n ""

main :: IO ()
main = print . sum . filter (\x -> isPalindrome (show x) && isPalindrome (numberToBinary x)) $ [0..1000000]