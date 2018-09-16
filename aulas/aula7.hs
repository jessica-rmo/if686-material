-- mais funções polimórficas:

tailLista :: [t] -> Int
tailLista [] = 0
tailLista (x:xs) = 1 + tailLista xs

--zip: junta elementos de duas listas e gera uma lista de pares
mzip :: [t] -> [t] -> [(t,t)]
mzip [] _ = []
mzip _ [] = []
mzip (x:xs) (y:ys) = (x,y) : mzip xs ys

mzip2 :: [t] -> [t] -> [(t,t)]
mzip2 (x:xs) (y:ys) = (x,y) : mzip2 xs ys
mzip2 _ _ = []


-- Funções de alta ordem:

--recebe uma função e um valor e retorna um valor
aplicaDuasVezes :: (t -> t) -> t -> t
aplicaDuasVezes f x = f (f x)

--relembrando a função:
vendas 0 = 4
vendas 1 = 55
vendas 2 = 40
vendas 3 = 12

totalVendas :: Int -> Int
totalVendas 0 = vendas 0
totalVendas n = totalVendas (n-1) + vendas n

--função semelhante:
quadrado :: Int -> Int
quadrado x = x*x

somaListaQuadrados :: Int -> Int
somaListaQuadrados 0 = quadrado 0
somaListaQuadrados n = quadrado n + somaListaQuadrados (n-1)

--generalizando os casos acima:
total :: (Int -> Int) -> Int -> Int
total f 0 = f 0
total f n = f n + total f (n-1)


-- relembrando maxi:
maxi :: Int -> Int -> Int
maxi n m | n >= m    = n
         | otherwise = m

maxFun :: (Int -> Int) -> Int -> Int
maxFun f 0 = f 0
maxFun f n = maxi (f n) (maxFun f (n-1))


-- Map:

-- relembrando double:
dobro :: [Int] -> [Int]
dobro [] = []
dobro (x:xs) = [2*x] ++ dobro xs

quadradoL :: [Int] -> [Int]
quadradoL [] = []
quadradoL (x:xs) = (x*x) : quadradoL xs

--funções de estrutura igual, muda apenas a função usada internamente
--podemos generalizar fazendo um mapeamento:

mapLInt :: (Int -> Int) -> [Int] -> [Int]
mapLInt f [] = []
mapLInt f (x:xs) = (f x) : mapLInt f xs


ehPar :: Int -> Bool
ehPar x = mod x 2 == 0

--função map no ghci
mapi :: (a -> b) -> [a] -> [b]
mapi f [] = []
mapi f (x:xs) = f x : mapi f xs

--usando compreensão
mapCl f l = [ f x | x <- l ]


--Folding:

--relembrando soma dos elementos da lista:
somaLista :: [Int] -> Int
somaLista [] = 0
somaLista (x:xs) = x + somaLista xs

disjL :: [Bool] -> Bool
disjL [] = False
disjL (x:xs) = (||) x (disjL xs)

--generalizando:

--mfold é foldr1 no ghci
--usado para lista não vazia
mfold :: (t -> t -> t) -> [t] -> t
mfold f [x] = x
mfold f (x:xs) = f x (mfold f xs)

--mfold2 é foldr no ghci
mfold2 :: (t -> t -> t) -> t -> [t] -> t
mfold2 f n [] = n
mfold2 f n (x:xs) = f x (mfold2 f n xs)

mconcat :: [[t]] -> [t]
mconcat l = foldr1 (++) l

--também há foldl e foldl1


-- Filter:

filtro :: (a -> Bool) -> [a] -> [a]
filtro f [] = []
filtro f (x:xs)
    | f x       = x : filtro f xs
    | otherwise = filtro f xs