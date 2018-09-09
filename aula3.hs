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
vendasNulas :: Int -> Bool
vendasNulas n
	| vendas n == 0	= True
	| otherwise		= False

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
offset = fromEnum 'A' - fromEnum 'a'
maiuscula ch = toEnum ((fromEnum ch) + offset)

ehDigito :: Char -> Bool
ehDigito ch = ('0' <= ch) && (ch <= '9')