module Main where

import qualified Data.Map.Strict as M
import Data.Map.Strict (Map)

parseIrregulars :: FilePath -> IO (Map Int String)
parseIrregulars path =
    M.fromList . map ((\(a, b) -> ((read :: String -> Int) a, dropWhile (==' ') b)) . break (==' ')) . lines <$> readFile path

numDigits :: Int -> Int
numDigits = length . show

writeNumber :: Int -> Map Int String -> String
writeNumber n irr
    | n == 0           = ""
    | M.member n irr   = irr M.! n
    | numDigits n == 4 =  let rest = writeNumber (n `mod` 1000) irr in
                          if null rest
                            then writeNumber (n `div` 1000) irr ++ " thousand "
                            else writeNumber (n `div` 1000) irr ++ " thousand and " ++ rest
    | numDigits n == 3 = let rest = writeNumber (n `mod` 100) irr in
                         if null rest
                            then writeNumber (n `div` 100) irr ++ " hundred "
                            else writeNumber (n `div` 100) irr ++ " hundred and " ++ rest
    | numDigits n == 2 = writeNumber ((n `div` 10) * 10) irr ++ " " ++ writeNumber (n `mod` 10) irr

main :: IO ()
main = do
    irr <- parseIrregulars "numbersUK.txt"
    print . length . concatMap (\x -> filter (/= ' ') $ writeNumber x irr) $ [1..1000]