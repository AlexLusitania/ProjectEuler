module Main where

import Data.List (permutations, sort)

main :: IO ()
main = print . flip (!!) (1000000-1) . sort . permutations . concatMap show $ [0..9]