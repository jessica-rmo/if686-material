import Data.Char

-- Entrada/saída em Haskell (I/O)

writefoo :: IO()
writefoo = putStrLn "foo"

imprimeStr :: String -> IO()
imprimeStr str = do putStr str
                    putStr "\n"

imprimeStr2 :: String -> IO()
imprimeStr2 str = do putStr str
                     putStr "\n"
                     putStr (str ++ "example")
                     putStr "\n"

-- sequenciando ações de IO: putStr, do
putNtines :: Int -> String -> IO()
putNtines n str
    = if n <= 1
         then putStr str
         else do putStr str
                 putNtines (n-1) str

-- ler do teclado (entrada padrão): getLine
getPut :: IO()
getPut = do l <- getLine
            putStr l

reverse2lines :: IO()
reverse2lines = do l1 <- getLine
                   l2 <- getLine
                   putStrLn (reverse l2)
                   putStrLn (map toUpper l1)

-- return aqui não quebra o fluxo de execução da função (como faz em linguagens imperativas), ele põe algum valor dentro do contexto
main1 = do  --main
         return ()
         return "HAHAHA"
         line <- getLine
         lh <- return "blah blah blah"
         return 4
         putStr line
         putStr lh
         writefoo
         
main2 = do  --main
       line <- getLine
       if null line
          then (do
                l <- return "String vazia"
                putStrLn l
               )
          else (do
                putStrLn $ reverseWords line
                main2
                )

reverseWords :: String -> String
reverseWords = unwords . map reverse . words
