module Main where

factorial :: [Integer]
factorial = scanl1 (*) [1..]

main :: IO ()
main = print . foldl (\a b -> a + read [b]) 0 . show . (!!) factorial $ 100 - 1