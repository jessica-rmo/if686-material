leEscreve = do getLine
               l <- getLine
               putStrLn (reverse l)
               putStrLn (reverse l)
               putStrLn (reverse l)

{-               
main = do   
        line <- getLine  
        if null line  
        then (do
                l <- return "String vazia"
                l1   <-  getLine 
                putStrLn ( l ++ l1)
             )  
        else (do  
               putStrLn $ reverseWords line  
               main
             )   
    
reverseWords :: String -> String  
reverseWords = unwords . map reverse. words
-}

{-
main = do a <- return "oi"
          b <- return "tchau"
          putStrLn (a ++ " " ++ b)
-}

{-
showStackHead [] = return []
showStackHead (x:xs) = do 
    putStrLn $ "resultado: " ++ [x]
    return xs

main :: IO()
main = do
    let s1 = []
    r1 <- showStackHead s1
    putStrLn $ "retornou: " ++ r1
    
    putStrLn "----"
    let s2 = "oi"
    r2 <- showStackHead s2
    putStrLn $ "retornou: " ++ r2

    putStrLn "----"
    let s3 = "q"
    r3 <- showStackHead s3
    putStrLn $ "retornou: " ++ r3  
-}

main = do l1 <- return "primeira str"
          putStrLn l1
          ll <- getLine
          return "lalala"
          return 4
          putStrLn ll

-- Exercícios lista 1
poli :: Int -> Int -> Int -> Int -> Int
poli a b c = (\x -> a * x^2 + b * x + c)

listaPoli :: [(Int,Int,Int)] -> [Int->Int]
listaPoli [] = []
listaPoli ((a,b,c):xs) = (poli a b c) : listaPoli xs

appListaPoli :: [Int -> Int] -> [Int] -> [Int]
appListaPoli [] _ = []
appListaPoli _ [] = []
appListaPoli (f:fs) (x:xs) = f x : appListaPoli fs xs

iguaisL :: [Int] -> Bool
iguaisL [] = True
iguaisL (x:y:ys) = (x == y) && iguaisL (y:ys)