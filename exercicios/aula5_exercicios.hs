quantosIguais :: Int -> Int -> Int -> Int
quantosIguais x y z
   | (x == y) && (y == z) = 3
   | (x == y) && (y /= z) = 2
   | (x == z) && (z /= y) = 2
   | (y == z) && (z /= x) = 2
   | otherwise 			  = 0


menorMaior :: Int -> Int -> Int -> (Int, Int)
menorMaior x y z
   | (x <= y) && (y <= z) = (x,z)
   | (x <= z) && (z <= y) = (x,y)
   | (y <= x) && (x <= z) = (y,z)
   | (y <= z) && (z <= x) = (y,x)
   | (z <= y) && (y <= x) = (z,x)
   | otherwise			  = (z,y)


ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (x,y,z)
   | (x <= y) && (y <= z) = (x,y,z)
   | (x <= z) && (z <= y) = (x,z,y)
   | (y <= x) && (x <= z) = (y,x,z)
   | (y <= z) && (z <= x) = (y,z,x)
   | (z <= y) && (y <= x) = (z,y,x)
   | otherwise			  = (z,x,y)


type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

coordX :: Ponto -> Float
coordX (a,b) = a

coordY :: Ponto -> Float
coordY (a,b) = b

retaVertical :: Reta -> Bool
retaVertical (pontoA,pontoB)
   | (coordX pontoA == coordX pontoB) = True
   | otherwise = False

pontoY :: Float -> Reta -> Float
pontoY x ((x1,y1),(x2,y2)) = ((y2-y1)*(x-x1)/(x2-x1))+y1
-- teste:
-- > pontoY 1 ((1,2),(3,4))
-- > 2.0


double :: [Int] -> [Int]
double l = [a*2 | a <- l]
{- -- outra forma:
double :: [Int] -> [Int]
double [] = []
double (x:xs) = [2*x] ++ double xs
-}


member :: [Int] -> Int -> Bool
member [] a = False
member (x:xs) a
   | x == a = True
   | otherwise = member xs a
{- -- outra forma:
member :: [Int] -> Int ->Bool
member l x
     	|elem x l = True
     	|otherwise = False
-}


digits :: String -> String
digits [] = ""
digits (s:st) =
	if (elem s ['0','1'..'9'])
	then s : digits st 
	else digits st
{-
-- usando compreensão de listas
digits :: String -> String
digits st = [ch | ch <- st, isDigit ch]
-}


sumPairs :: [Int] -> [Int] -> [Int]
sumPairs [] [] = []
sumPairs [] b = b
sumPairs a [] = a
sumPairs (a:as) (b:bs) = (a+b) : sumPairs as bs
-- como ficaria com compreensão?


take_ :: [a] -> Int -> [a]
take_ l 0 = []
take_ [] _ = []
take_ (x:xs) n = concat [ [x], take_ xs (n-1) ]

drop :: Int -> [a] -> [a]
drop 0 l = l
drop _ [] = []
drop n (x:xs) = drop (n-1) xs

{- FAZER:
• takeWhile — recebe uma função predicado e devolve
uma lista contendo todos os elementos da lista de entrada
que antecedem o primeiro para o qual a função predicado
produz o valor False. Ex.:
takeWhile (>10) [14,13,11,9,23]=[14,13,11]
• dropWhile — ver definições de drop e takeWhile
-}



qSort :: [Int] -> [Int]
qSort [] = []
qSort (x:xs) = 
    qSort [y | y <- xs, y < x] ++ 
    [x] ++
    qSort [y | y <- xs, y >= x]


fibo :: Int -> Int
fibo 0 = 0
fibo 1 = 1
fibo n = fibo (n-1) + fibo (n-2)

fiboN :: Int -> [Int]
fiboN 0 = [fibo 0]
fiboN 1 = [fibo 1]
fiboN n = concat [fiboN (n-1) , [fibo n]]

{- FAZER:
Crie um função que recebe uma lista de inteiros e
retorna a lista ordenada em função da soma de seus
digitos(crescente):
Prelude> ordenar [5,12,70,8,25,3,150]
[12,3,5,150,70,25,8]
-}

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos bd livro = [p | (p,l) <- bd, livro == l]