module Main where

triangleNumbers :: [Integer]
triangleNumbers = scanl1 (+) [1..]

divisors :: Integer -> [Integer]
divisors x = [ y | y <- [2..(x `div` 2)], x `rem` y == 0 ]

nbDivisors :: Integer -> Int
nbDivisors x = length (divisors x) + 2 -- + 1 and the actual number

main :: IO ()
main = putStrLn . show . head $ dropWhile (\x -> nbDivisors x < 500) (drop 10000 triangleNumbers)