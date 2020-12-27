module Main where

main :: IO ()
main = putStrLn . ("result: " ++) . show . foldl (\a b -> a + read [b]) 0 . show $ 2^1000
