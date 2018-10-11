-- EE1 PLC 2017.2

--q1
sublistas :: [a] -> [[a]]
sublistas [] = [[]]
sublistas (x:xs) = [(x:z) | z <- sublistas xs] ++ sublistas xs

--q2  --OBS: funciona, mas não usa a função filter de haskell, como pedia a questão
filtrarEInserir :: [[Int]] -> Int -> ([[Int]], Int)
filtrarEInserir l n = (arg1 l, ((arg2 (arg1 l))*n) )

arg1 :: [[Int]] -> [[Int]]
arg1 [] = []
arg1 (x:xs) =
   if (soma odd x > soma even x)
   then (x : arg1 xs)
   else (arg1 xs)

arg2 :: [[Int]] -> Int
arg2 [] = 0
arg2 [a] = soma odd a
arg2 (x:(y:ys))
   | soma odd x > soma odd y = arg2 (x:ys)
   | otherwise               = arg2 (y:ys)

somaAux :: [Int] -> Int
somaAux [] = 0
somaAux (x:xs) = x + somaAux xs

soma :: (Int->Bool) -> [Int] -> Int
soma f [] = 0
soma f l = somaAux (filter f l)

--q3
altMap f1 f2 [] = []
altMap f1 f2 (x:xs) = f1 x : (altMap f2 f1 xs)

-- q4
{- (a)
Defina a função poli :: Integer −> Integer −> Integer −> Integer −> Integer que recebe como argumentos os coeficientes de uma funcao polinomial de grau 2 e devolve uma funcao de nteiro para inteiro (um polinomio) -}

poli :: Integer −> Integer −> Integer −> (Integer −> Integer)
poli a b c = (\x -> a*(x^2) + b*x + c)

{- (b)
Defina a funcao listaPoli :: [(Integer,Integer,Integer)] −> [Integer−>Integer] que aguarda uma lista de triplas de inteiros (coeficientes de um polinomio de segundo grau) e devolve uma lista de funcoes de inteiro para inteiro (polinomios) -}

listaPoli :: [(Integer,Integer,Integer)] −> [Integer−>Integer]
listaPoli l = [ poli a b c | (a,b,c) <- l ]

{- --com casamento de padrao:
listaPoli :: [(Int,Int,Int)] -> [Int->Int]
listaPoli [] = []
listaPoli ((a,b,c):xs) = (poli a b c) : listaPoli xs
-}

{- (c)
Defina a funcao appListaPoli :: [Integer−>Integer] −> [Integer] −> [Integer] que recebe uma lista de funcoes de polinomios e uma lista de inteiros. Esta funcao devolve uma lista de inteiros que resultam da aplicacao de cada polinomio da primeira lista aplicada ao inteiro correspondente na segunda lista. Utilize compreensao de listas -}

appListaPoli :: [Integer−>Integer] −> [Integer] −> [Integer]
appListaPoli lPoli lInt = [ f x | (f,x) <- zip lPoli lInt]

{- --com casamento de padrao:
appListaPoli :: [Int -> Int] -> [Int] -> [Int]
appListaPoli [] _ = []
appListaPoli _ [] = []
appListaPoli (f:fs) (x:xs) = f x : appListaPoli fs xs
-}

--q5
data Mobile = Pendente Int | Barra Mobile Mobile
--a)
peso :: Mobile -> Int
peso (Pendente p) = p
peso (Barra m1 m2) = peso m1 + peso m2
--b)
balanceado :: Mobile -> Bool
balanceado (Pendente _) = True
balanceado (Barra m1 m2) = peso m1 == peso m2