module Main where

irrationalNumber :: String
irrationalNumber = concatMap show [1..]

main :: IO ()
main = print . product . map (\x -> read . (:[]) . (!! (x-1)) $ irrationalNumber) $
    [1, 10, 100, 1000, 10000, 100000, 1000000]