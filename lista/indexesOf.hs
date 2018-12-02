import Data.List (elemIndex, elemIndices)

indexes :: String -> Char -> [Int]
indexes s c = elemIndices c s                         

main :: IO ()
main = do 
    s <- getLine
    c <- getChar
    getLine 
    putStrLn (show (indexes s c))
