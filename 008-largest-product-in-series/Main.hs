module Main where

import Data.List (tails)

parseFile :: FilePath -> IO String
parseFile p = concat . lines <$> readFile p

largestProduct :: Int -> String -> Integer
largestProduct n = maximum . map (product . map (\x -> read [x]) . take n) . tails

main :: IO ()
main = parseFile "number.txt" >>= putStrLn . ("product: " ++) . show . largestProduct 13