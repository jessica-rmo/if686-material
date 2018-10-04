leEscreve = do getLine
               l <- getLine
               putStrLn (reverse l)

{-
main = do
       line <- getLine
       if null line
          then (do
                l <- return "String vazia"
                putStrLn l
               )
          else (do
                putStrLn $ reverseWords line
                main
                )

reverseWords :: String -> String
reverseWords = unwords . map reverse . words
-}

{-
main = do a <- return "oi"
          b <- return "tchau"
          putStrLn (a ++ " " ++ b)

showStackHead [] = return []
showStackHead (x:xs) = do
	putStrLn $ "resultado: " ++ [x]
	return xs
-}

{-
main :: IO()
main = do
	let s1 = []
	r1 <- showStackHead s1
	putStrLn $ "retornou: " ++ r1

	putStrLn "------"
	let s2 = "oi"
	r2 <- showStackHead s2
	putStrLn $ "retornou: " ++ r2

	putStrLn "------"
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
