-- Guardas:
-- Avalia-se cada guarda para saber qual condição (lado direito) será satisfeita.

maiorValor :: Int -> Int -> Int
maiorValor x y
    | x >= y    = x
    | otherwise = y

variacaoMaiorValor :: Int -> Int -> Int
variacaoMaiorValor x y
    | x > y     = x
    | x == y    = 0
    | otherwise = y

maiorTresValores :: Int -> Int -> Int -> Int
maiorTresValores x y z
    | (x >= y) && (y >= z) = x
    | y >= z               = y
    | otherwise            = z

-- também é possível fazer com if-then-else:
maiorValorIfElse :: Int -> Int -> Int
maiorValorIfElse x y =
    if x >= y then x else y

--Recursão:

vendas 0 = 4
vendas 1 = 55
vendas 2 = 40
vendas 3 = 12
totalVendas = vendas 0 + vendas 1 + vendas 2 + vendas 3
-- não é a forma adequada de fazer. E se houvesse, por exemplo, 1000 vendas?

-- Solução recursiva para saber o total de vendas:
totalVendas :: Int -> Int
totalVendas n
    | n == 0    = vendas 0
    | otherwise = vendas (n) + totalVendas (n-1)

-- Solução recursiva para saber o máximo de vendas:
maxVendas :: Int -> Int
maxVendas n
| n == 0    = vendas 0
| otherwise = maxi (maxVendas (n-1)) (vendas n)

--Casamento de padrões:

totalVendasCasamPadrao :: Int -> Int
totalVendasCasamPadrao 0 = vendas 0 
totalVendasCasamPadrao n = vendas (n) + totalVendas (n-1)

maxVendas :: Int -> Int
maxVendas 0 = vendas 0
maxVendas n = maxi (maxVendas (n-1))(vendas n)

totalVendas :: Int -> Int
totalVendas 0 = vendas 0
totalVendas n = totalVendas (n-1) + vendas n

--Operações lógicas:
not :: Bool -> Bool
not True  = False
not False = True

or :: Bool -> Bool
or True x  = True
or False x = x

and :: Bool -> Bool
and False x = False
and True x  = x

--Notação:

--Uso de parêntesis
f n + 1    -- = (f n) + 1
f (n + 1)

--Forma infixa
2 + 3
(+) 2 3
maxi 2 4
2 `maxi` 4
mod 4 5
4 `mod` 5

--Definições locais:

-- let <definições> in <expressão>
sumSquares :: Int -> Int -> Int
sumSquares x y =
    let
        sqX = x * x
        sqY = y * y
    in sqX + sqY

-- <definições> where <definições>
sumSquares x y = sqX + sqY
    where sqX = x * x
          sqY = y * y

sumSquares x y = sq x + sq y
    where sq z = z * z
