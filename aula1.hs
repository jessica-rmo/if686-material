answer :: Int
answer = 42

{-
Isso não é uma atribuição de 42 a uma variável de nome “answer”. Na verdade answer é uma expressão, ou seja, uma função, a qual retorna o valor 42 (função constante).
Tipos começam com letra maiúscula (Int, Bool, etc…)
-}

greater :: Bool
greater = (answer > 71)

yes :: Bool
yes = True

funcaoConstante :: Int
funcaoConstante = 30

maiorQue30 :: Int -> Bool
maiorQue30 x = x > 30

quadrado :: Int -> Int
quadrado x = x * x

maiorQueC :: Char -> Bool
maiorQueC x = x > 'C'

{-
*Main> maiorQueC 'A'
False
*Main> maiorQueC 'O'
True
*Main> maiorQueC 2
   erro! Nao se compara Int com Char em Haskell
-}

valoresIguais :: Int -> Int -> Int -> Bool
valoresIguais x y z = (x == y) && (y == z)

--Guardas: é uma expressão que será avaliada, definida em linha com uma barra.
--Uma expressão (função) pode ser definida com várias guardas.
--São avaliadas de cima abaixo, da direita para a esquerda.

maxi :: Int -> Int -> Int
maxi x y | x >= y    = x
         | otherwise = y   --caso default

{-- aplicação:
-- com ou sem parêntesis
square 5	-- = 25
square(5)	-- = 25

allEqual 1 2 3		-- = False
allEqual(1) (2) (3)	-- = False
allEqual(1,2,3)	   -- ERRO! Será interpretado com valor de coordenada

maxi 123 609	-- = 609
-}