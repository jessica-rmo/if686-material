-- slides 2

--exemplos para teste
vendas 0 = 10
vendas 1 = 78
vendas 2 = 34
vendas 3 = 10
vendas 4 = 78
vendas 5 = 16

vendasIguais :: Int -> Int -> Int
vendasIguais s 0 = if (vendas 0 == s) then 1 else 0
vendasIguais s n
   | s == vendas n && n > 0   = 1 + vendasIguais s (n-1)
   | otherwise                = vendasIguais s (n-1)


-- slides 3

fat :: Int -> Int
fat 0 = 1
fat n = n * fat (n-1)


allEqual :: Int -> Int -> Int -> Bool
allEqual n m p = (n == m) && (m == p)

all4Equal :: Int -> Int -> Int -> Int -> Bool
all4Equal a b c d = (allEqual a b c) && (c == d)

equalCount :: Int -> Int -> Int -> Int
equalCount a b c
   | (a == b) && (b == c) = 3
   | (a == b) && (b /= c) = 2
   | (a == c) && (c /= b) = 2
   | (b == c) && (c /= a) = 2
   | otherwise            = 0


addEspacos :: Int -> String
addEspacos 0 = ""
addEspacos n = " " ++ addEspacos (n-1)

paraDireita :: Int -> String -> String
paraDireita n str = addEspacos n ++ str


cabecalho = "Semana" ++ addEspacos 3 ++ "Venda"

imprimeSemana :: Int -> String
imprimeSemana n = addEspacos 2 ++ show n ++ addEspacos 6 ++ show (vendas n) ++ "\n"

imprimeSemanas :: Int -> String
imprimeSemanas 0 = imprimeSemana 0
imprimeSemanas n = imprimeSemanas (n-1) ++ imprimeSemana n

totalVendas :: Int -> Int
totalVendas n
    | n == 0    = vendas 0
    | otherwise = vendas (n) + totalVendas (n-1)

imprimeTotal :: Int -> String
imprimeTotal n = "Total" ++ addEspacos 4 ++ show (totalVendas n) ++ "\n"

imprimeMedia :: Int -> String
imprimeMedia n = "Media" ++ addEspacos 4 ++ show (div (totalVendas n) n) ++ "\n"

imprimeTabela :: Int -> String
imprimeTabela n = cabecalho ++ imprimeSemanas n
                             ++ imprimeTotal n 
                             ++ imprimeMedia n


-- slides 4

maiorEmenor :: Int -> Int -> Int -> (Int, Int)
maiorEmenor x y z
    | (x >= y) && (y >= z) = (x,z)
    | (x >= z) && (z >= y) = (x,y)
    | (z >= x) && (x >= y) = (z,y)
    | (z >= y) && (y >= x) = (z,x)
    | (y >= x) && (x >= z) = (y,z)
    | otherwise = (y,x)

ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (x,y,z)
    | (x >= y) && (y >= z) = (x,y,z)
    | (x >= z) && (z >= y) = (x,z,y)
    | (z >= x) && (x >= y) = (z,x,y)
    | (z >= y) && (y >= x) = (z,y,x)
    | (y >= x) && (x >= z) = (y,x,z)
    | otherwise = (y,z,x)


double :: [Int] -> [Int]
double [] = []
double (x:xs) = [2*x] ++ double xs

member :: [Int] -> Int -> Bool
member [] a = False
member (x:xs) a
   | x == a = True
   | otherwise = member xs a

digits :: String -> String
digits [] = ""
digits (s:st) =
    if (elem s ['0','1'..'9'])
    then s : digits st 
    else digits st

sumPairs :: [Int] -> [Int] -> [Int]
sumPairs [] [] = []
sumPairs [] b = b
sumPairs a [] = a
sumPairs (a:as) (b:bs) = (a+b) : sumPairs as bs


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
ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar [a] = [a]
-- ordenar (a:as) =


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


-- slides 5

membro :: [Int] -> Int -> [Bool] --tem que retornar uma lista
-- membro :: [Int] -> Int -> Bool
membro l n = [a == n | a <- l]

type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa,Livro)]

baseExemplo :: BancoDados
baseExemplo = [("Sergio","O Senhor dos Aneis"),
   ("Andre","Duna"),
   ("Fernando","Jonathan Strange & Mr.Norrell"),
   ("Fernando","A Game of Thrones")] -- livros emprestados

livros :: BancoDados -> Pessoa -> [Livro]
livros bd pessoa = [l | (p,l) <- bd, pessoa == p]

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos bd livro = [p | (p,l) <- bd, livro == l]

-- FAZER:
--emprestado :: BancoDados -> Livro -> Bool
--qtdEmprestimos :: BancoDados -> Pessoa -> Int
--emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
--devolver :: BancoDados -> Pessoa -> Livro -> BancoDados


qSort :: [Int] -> [Int]
qSort [] = []
qSort (x:xs) = 
    qSort [y | y <- xs, y < x] ++ 
    [x] ++
    qSort [y | y <- xs, y >= x]

ordenarQSort :: [Int] -> [Int]
ordenarQSort l = qSort l


{- FAZER:
•Crie uma função agrupar que recebe uma lista de
Strings contendo apenas letras e devolve uma lista de
pares (Char, Int) onde o primeiro elemento é um
caractere que existe em pelo menos um String da
lista de entrada e o segundo é o número de
ocorrências desse caractere nos Strings da lista de
entrada, ignorando espaços em branco:
Prelude> ordenar [“Fernando”, “Castor”]
[( 'F', 1), ('e', 1), ('r', 2), ('n', 2), ('a', 2), 
 ('d', 1), ('o', 2), ('C', 1), ('s', 1), ('t', 1)]

-- agrupar :: [String] -> [(Char, Int)]
-}


-- slides 6
-- FAZER depois que estudar, pág 14


-- slides 7
-- FAZER depois que estudar