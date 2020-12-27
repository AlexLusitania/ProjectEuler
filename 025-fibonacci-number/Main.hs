module Main where

import Data.Maybe (fromJust)
import Data.List (findIndex)

fib :: [Integer]
fib = 1 : 1 : zipWith (+) fib (tail fib)

main :: IO ()
main = print . (+ 1) . fromJust . findIndex ((>= 1000) . length . show) $ fib