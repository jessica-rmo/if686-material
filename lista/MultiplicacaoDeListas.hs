import System.IO
import Data.String (words)
import Data.List (transpose)


readMatrix :: Int -> Int -> IO [[Int]]
readMatrix i j = do
    let m = []
    matrix <- readLines m i
    return $ reverse matrix

readLines :: [[Int]] -> Int -> IO [[Int]]
readLines matrix 0 = return matrix
readLines matrix i = do
    line <- getLine
    let numbers = map (read) (words line)
    let matrixi = (numbers:matrix)
    readLines matrixi (i-1)


multiply :: [[Int]] -> [[Int]] -> [[Int]]
multiply mA mB = [ multi row (transpose mB) | row <- mA]

multi :: [Int] -> [[Int]] -> [Int]
multi row cols = [ foldl1 (+) (map (\(a,b) -> (a*b)) (zip row col)) | col <- cols ]


printM :: [[Int]] -> IO ()
printM [] = return ()
printM (l:ls) = do
    putStrLn $ printLine l
    printM ls

printLine :: [Int] -> String
printLine [] = ""
printLine (x:xs) = show x ++ " " ++ printLine xs

main :: IO ()
main = do
    ai <- getLine
    aj <- getLine
    matrixA <- readMatrix (read ai) (read aj)
    --putStrLn $ show matrixA

    bi <- getLine
    bj <- getLine
    matrixB <- readMatrix (read bi) (read bj)
    --putStrLn $ show matrixB

    let matrixAB = multiply matrixA matrixB
    printM matrixAB
