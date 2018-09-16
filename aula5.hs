-- Listas
{-
[]    -- lista vazia
[1,2,3,4] :: [Int]
[(5,True),(7,True)] :: [(Int,Bool)]
[[4,2],[3,7,7,1],[],[9]] :: [[Int]]
"bom" :: [Char]
type String = [Char]    -- sinônimos de tipos

-- x:xs representa uma lista onde
-- x é o primeiro elemento (head) e xs é o resto da lista (tail)
x:[]    -- lista com 1 elemento, <head>:<lista vazia>
x:xs    -- <head>:<tail>
        -- tail é o restante da lista exceto o primeiro elemento
-}

-- função length
length_ :: [t] -> Int
length_ [] = 0
length_ (a:as) = 1 + length_ as
-- poderia ser length_ (_:as) → o "_" significa que o valor desse parâmetro pode ser ignorado, i.e., não importa o valor que é recebido aqui

{--- função concatenar
(++) :: [t] -> [t] -> [t]
[] ++ y = y
(a:as) ++ y = a : (as ++ y)
-}

-- função drop
drop_ :: Int -> [t] -> [t]
drop_ 0 l = l
drop_ _ [] = []
drop_ n (x:xs) = drop_ (n-1) xs

somaLista :: [Int] -> Int
-- caso base: lista vazia
somaLista [] = 0
-- caso recursivo: lista tem cabeca e cauda
somaLista (x:xs) = x + somaLista xs

-- Com guardas
somaLista2 :: [Int] -> Int
somaLista2 l
 | l == [] = 0
 | otherwise = head l + somaLista2 (tail l)

inverteLista :: [Int] -> [Int]
inverteLista [] = []
inverteLista (x:xs) = inverteLista xs ++ [x]

produtoLista :: [Int] -> Int
produtoLista [] = 1    -- caso base é o elemento neutro da multiplicação
produtoLista (x:xs) = x * produtoLista xs