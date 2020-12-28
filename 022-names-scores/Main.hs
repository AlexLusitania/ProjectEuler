module Main where

import Data.List (elemIndex, sort)
import Data.Maybe (fromJust)

parseFile :: FilePath -> IO [String]
parseFile path = helper [] <$> readFile path
    where helper acc [] = init acc
          helper acc s  = helper (name:acc) rest
              where name = takeWhile (\x -> x /= ',' && x /= '"') s
                    rest = dropWhile (\x -> x == ',' || x == '"') (drop (length name) s)

main :: IO ()
main = parseFile "names.txt" >>=
    print . sum . zipWith (\i name -> i * (sum . map alpha $ name)) [1..] . sort
        where alpha x = (+1) . fromJust . elemIndex x $ ['A'..'Z']