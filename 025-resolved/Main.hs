module Main where

import Data.Maybe (fromJust)
import Data.List (findIndex)

fib :: [Integer]
fib = 1 : 1 : zipWith (+) fib (tail fib)

digitCount :: Integer -> Int
digitCount = f 1
    where f ds n | n >= 10   = f (ds + 1) (n `div` 10)
                 | otherwise = ds

main :: IO ()
main = print . (+ 1) . fromJust . findIndex (\x -> digitCount x >= 1000) $ fib