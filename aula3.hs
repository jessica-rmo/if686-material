import Data.Char

--Booleanos:

-- Ou exclusivo
xor :: Bool -> Bool -> Bool
xor x y = (x || y) && not (x && y)

-- outra forma
eXor :: Bool -> Bool -> Bool
eXor True  x = not x
eXor False x = x

-- mais outra forma
eXor2 :: Bool -> Bool -> Bool
eXor2 True False = True
eXor2 False True = True
eXor2 _ _ = False

-- Verificar se não houve vendas em uma semana n
vendasNulas :: Int -> Bool
vendasNulas n = (vendas n == 0)

-- ao inves de:
{-
vendasNulas :: Int -> Bool
vendasNulas n
	| vendas n == 0	= True
	| otherwise		= False
-}

-- ou:
vendasNulas2 0 = vendas 0 == 0
vendasNulas2 n
      | vendas n == 0 = True
      | otherwise     = vendasNulas (n-1)

-- Caracteres:

--no GHC, ord e chr fazem parte da biblioteca Data.Char
offset = ord 'A' - ord 'a'
maiuscula :: Char -> Char
maiuscula ch = chr (ord ch + offset)

-- usando Enum (não precisa do import)
offset2 = fromEnum 'A' - fromEnum 'a'
maiuscula2 ch = toEnum ((fromEnum ch) + offset2)

ehDigito :: Char -> Bool
ehDigito ch = ('0' <= ch) && (ch <= '9')


-- anotações do professor:

quadrado :: Int -> Int
quadrado x = x * x

valoresIguais :: Int -> Int -> Int -> Bool
valoresIguais x y z = (x == y) && (y == z)

maxiIF :: Int -> Int -> Int
maxiIF x y = if x >= y then x else y


-- Funcoes recursivas
 
vendas 0 = 5
vendas 1 = 7
vendas 2 = 15
vendas 3 = 9

totalVendas :: Int -> Int
totalVendas n 
  | n == 0 = vendas 0  -- Caso base
  | otherwise = vendas n + totalVendas (n-1) -- Caso recursivo

maxVendas :: Int -> Int
maxVendas n
 | n == 0 = vendas 0 -- Caso base
 | otherwise = maxiIF (vendas n) (maxVendas (n-1)) -- Caso recursivo

 -- Casamento de padrao

totalVendas2 :: Int -> Int
totalVendas2 0 = vendas 0
totalVendas2 n = vendas n + totalVendas2 (n-1)

maxVendas2 :: Int -> Int
maxVendas2 0 = vendas 0 -- Caso base
maxVendas2 n = maxiIF (vendas n) (maxVendas (n-1)) -- Caso recursivo

mynot :: Bool -> Bool
mynot True = False
mynot False = True

myAnd :: Bool -> Bool -> Bool
myAnd True True = True
myAnd True False = False
myAnd False True = False
myAnd False False = False

myAnd2 :: Bool -> Bool -> Bool
myAnd2 True x = x
myAnd2 False x = False

myAnd3 :: Bool -> Bool -> Bool
myAnd3 True x = x
myAnd3 False _ = False

myAnd4 :: Bool -> Bool -> Bool
myAnd4 True x = x
myAnd4 _ _ = False