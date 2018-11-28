import Data.Char

somaDigitos :: String -> Int
somaDigitos num = foldr1 (+) (digitos num)

digitos :: String -> [Int]
digitos [] = []
digitos [x] = [digitToInt x]
digitos (x:xs) = digitToInt x : digitos xs

main :: IO()
main = do
    num <- getLine
    putStrLn (show (somaDigitos num))