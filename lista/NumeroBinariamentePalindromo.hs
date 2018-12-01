decToBin :: Int -> [Int]
decToBin n = reverse (decToBinRev n)

decToBinRev :: Int -> [Int]
decToBinRev 0 = [0]
decToBinRev 1 = [1]
decToBinRev n | (n `mod` 2) == 0 = 0 : decToBinRev (div n 2)
              | otherwise      = 1 : decToBinRev (div n 2) 

ehPalindromo :: Int -> Bool
ehPalindromo n = palindromo (decToBin n)

palindromo :: [Int] -> Bool
palindromo [x] = True
palindromo n   = if (((length n) `mod` 2) == 0)
                 then (a == reverse b)
                 else (a == reverse (drop 1 b))
                 where (a,b) = (splitAt ((length n)`div`2) n)

main :: IO()
main = do
    n <- getLine
    putStrLn (show (ehPalindromo (read n)))