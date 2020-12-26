module Main where

import Data.List (permutations, sort)

main :: IO ()
main = putStrLn . (!! (1000000 - 1)) . sort . permutations $ "0123456789"