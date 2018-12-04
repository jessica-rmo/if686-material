import System.IO
import Data.List (subsequences)
import Data.String (words)

perfectSum :: String -> Int -> Int
perfectSum l n = perfectSumAux (toIntList l) n

perfectSumAux :: [Int] -> Int -> Int
perfectSumAux [] _ = 0
perfectSumAux (x:[]) n = if (x==n) then 1 else 0
perfectSumAux l n = getSubsets l n

toIntList :: String -> [Int]
toIntList str = if length str > 0 then
                    map (read) (words str)
                else []

getSubsets :: [Int] -> Int -> Int
getSubsets [] n = 0
getSubsets (x:[]) n = if (x==n) then 1 else 0
getSubsets l n = length [ x | x <- (sums (subsets l)), x==n]

subsets :: [Int] -> [[Int]]
subsets l = subsequences l

sums :: [[Int]] -> [Int]
sums [[]] = []
sums [(x:[])] = [x]
sums l = [foldr (+) 0 n | n <- l]


main :: IO ()
main = do
    list <- getLine
    num <- getLine
    putStrLn $ show $ perfectSum list (read num)
