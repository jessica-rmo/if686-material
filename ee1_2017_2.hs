-- EE1 2017.2

-- Questao 4
{- (a)
Defina a função poli :: Integer −> Integer −> Integer −> Integer −> Integer que recebe como argumentos os coeficientes de uma funcao polinomial de grau 2 e devolve uma funcao de nteiro para inteiro (um polinomio) -}

poli :: Integer −> Integer −> Integer −> (Integer −> Integer)
poli a b c = (\x -> a*(x^2) + b*x + c)

{- (b)
Defina a funcao listaPoli :: [(Integer,Integer,Integer)] −> [Integer−>Integer] que aguarda uma lista de triplas de inteiros (coeficientes de um polinomio de segundo grau) e devolve uma lista de funcoes de inteiro para inteiro (polinomios) -}

listaPoli :: [(Integer,Integer,Integer)] −> [Integer−>Integer]
listaPoli l = [ poli a b c | (a,b,c) <- l ]

{- (c)
Defina a funcao appListaPoli :: [Integer−>Integer] −> [Integer] −> [Integer] que recebe uma lista de funcoes de polinomios e uma lista de inteiros. Esta funcao devolve uma lista de inteiros que resultam da aplicacao de cada polinomio da primeira lista aplicada ao inteiro correspondente na segunda lista. Utilize compreensao de listas -}

appListaPoli :: [Integer−>Integer] −> [Integer] −> [Integer]
appListaPoli lPoli lInt = [ f x | (f,x) <- zip lPoli lInt]

