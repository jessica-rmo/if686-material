type Nome = String
data Pessoa = M Nome | F Nome

--instance Show
instance Show Pessoa where
    show (M n) = n
    show (F n) = n

-- como comparar 2 pessoas?
instance Eq Pessoa where
   (M n1) == (M n2) = n1 == n2
   (F n1) == (F n2) = n1 == n2
   _ == _           = False    -- qualquer outra coisa resulta Falso
 
-- como dizer, então, que uma lista de Pessoa é Visible?
{-
instance Visible a => Visible [a] where    -- 1
   toString = concat . (map toString)      -- 2
   size     = (foldr (+) 0) . (map size)   -- 3
   
   -- [1] a generaliza Pessoa. Uma lista de "a" é algo que é Visible
   -- [2] transforma cada elemento da lista em String e depois os concatena
   -- [3] pega todos os tamanhos dos elementos e os soma (iniciando por 0)
-}

-- outro exemplo:
--type Nome = String
type Potencia = Int
data Lampada = Compacta Nome Potencia | Incandescente Nome Potencia

instance Eq Lampada where
   (Compacta n1 p1) == (Compacta n2 p2)           = n1 == n2 && p1 == p2
   (Incandescente n1 p1) == (Incandescente n2 p2) = n1 == n2 && p1 == p2

instance Show Lampada where
   show (Compacta n1 p1) = "Compacta " ++ n1 ++ " " ++ show p1
   

-- Avaliação preguiçosa (Laziness)

f :: Int -> Int -> Int
f a b = a + 10
{-
f (30-15) (f 4 6)
= (30-15) + 10
= 15 + 10
= 25
-}

g :: Int -> Int
g x = x + g x

troca :: Integer -> a -> a -> a
troca n x y
    | n > 0     = x
    | otherwise = y

-- otimização: expressões iguais avaliadas uma única vez
h :: Int -> Int -> Int
h x y = x + y
-- ex: h (10-7) (10-7)

fk :: [Int] -> [Int] -> Int
fk (x:xs) (y:ys) = x + y
{-
fk [1..5] [500..]
= (1:[2..5]) (500:[501..])
= 1 + 500
-}


-- Recursão de cauda

f2 :: Int -> Int -> Int
f2 a b = a + b
-- f2 (9-3) (f2 3 5) = (9-3) + (f2 3 5) = 6 + 8 = 14

fatorial :: Int -> Int
fatorial 0 = 1
fatorial n = n * fatorial (n-1)
{-
fatorial 3
= 3 * (fatorial 2)
= 3 * (2 * (fatorial 1))
= 3 * (2 * (1 * fatorial 0))
= 3 * (2 * (1 * 1))
= 6
-}

tailFat :: Integer -> Integer -> Integer
tailFat 0 x = x
tailFat n x = tailFat (n-1) (n*x)
{-
tailFat 3 1
= tailFat 2 3
= tailFat 1 6
= tailFat 0 6
= 6
-}

fat n = tailFat n 1
