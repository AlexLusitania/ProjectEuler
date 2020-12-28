module Main where

main :: IO ()
main = print . sum $ [ n | n <- [2..maximumSum], n == powers n ]
    where powers = sum . map (\digit -> read [digit] ^ 5) . show
          maximumSum = 5 * (9^5)