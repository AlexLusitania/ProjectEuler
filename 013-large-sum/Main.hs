module Main where

import Data.Functor ((<&>)) -- flipped version of <$>

sumFileNumbers :: FilePath -> IO Integer
sumFileNumbers path = readFile path <&> foldl1 (\a b -> a + fromInteger b) . map read . lines

main :: IO ()
main = sumFileNumbers "numbers.txt" >>= print . take 10 . show