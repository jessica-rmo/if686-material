-- Tuplas

primeiro :: (Int, Int) -> Int
primeiro (x,y) = x

segundo :: (Int, Int) -> Int
segundo (x,y) = y

somaPar :: (Int, Int) -> Int
somaPar (x,y) = x + y     -- casamento de padrões

somaPar2 p = primeiro p + segundo p   -- usando funções auxiliares

-- usando as funções fst (fisrt) e snd (second) já definidas em haskell
somaPar3 p = fst p + snd p

-- para quaisquer outras situações, deve-se criar uma função (exemplo: selecionar um terceiro elemento numa tupla de 3 valores)
shift :: ((Int, Int), Int) -> (Int, (Int, Int))
shift ((x,y),z) = (x,(y,z))

extraiValor :: (Bool, (Int, Bool), Char) -> Char
--extraiValor (b1, (i1, b2), c) = c
extraiValor (_, (_, _), c) = c


-- Sinonimos de Tipos

type Name = String
type Age = Int
type Phone = Int
type Person = (Name, Age, Phone)   -- :: (String, Int, Int)

nome :: Person -> Name     -- :: (String, Int, Int) -> String
nome (n, a, p) = n

type ParInteiro = (Int, Int)


-- Equacao do segundo grau
umaRaiz :: Float -> Float -> Float -> Float
umaRaiz a b c = -b / (2 * a)

duasRaizes :: Float -> Float -> Float -> (Float, Float)
duasRaizes a b c = (d - e , d + e)
 where
    d = -b / (2 * a)
    e = sqrt( b^2 - 4.0 * a * c)/ (2.0 * a) 

raizes :: Float -> Float -> Float -> String
raizes a b c
 | b ^ 2 == 4.0 * a * c = show (umaRaiz a b c)
 | b ^2 > 4.0 * a * c = show f ++ " " ++ show s
 | otherwise = "Nao hah raizes"
    where
      --  f = fst (duasRaizes a b c)
      --  s = snd (duasRaizes a b c)
      (f, s) = (duasRaizes a b c)