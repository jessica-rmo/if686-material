typeNumber :: Int -> String
typeNumber n = if (ehPrimo n) then "Primo"
               else if (quadrado n) then "Quadrado Perfeito"
               else "Natural"

fatoresNumero :: Int -> [Int]
fatoresNumero n = [i | i <- [1..n], mod n i == 0]

ehPrimo :: Int -> Bool
ehPrimo n = if (fatoresNumero n) == [1,n]
            then True else False

quadrados :: [Int]
quadrados = [x*x | x <- [0..]]

quadrado :: Int -> Bool
quadrado n = head (dropWhile (<n) quadrados) == n

main :: IO ()
main =  do
        n <- getLine
        putStrLn (typeNumber (read n))