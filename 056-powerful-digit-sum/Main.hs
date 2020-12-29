module Main where

main :: IO ()
main = print . maximum . map (sum . map (read . (:[])) . show) $ [ a^b | a <- [1..99], b <- [1..99] ]