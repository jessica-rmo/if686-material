import Data.List (sort)

-- Resolução da EE1 2018.1

{- Questao 1 -}
f = filter (>5) . map (+2)
-- f [1..5]
-- [6,7]
-- criar uma função g tal que g = filter s1 . map s2 tal que seja equivalente a f

g = map(+2) . filter (>3)

-- então, s1 = (+2) e s2 = (>3)

{- Questao 2 -}
data CInt = Conjunto [Int] deriving (Show)

--a)
getInts :: CInt -> [Int]
getInts (Conjunto a) = a  --a é a lista de Int

makeSet :: [Int] -> CInt
makeSet (x:xs) = if x `notElem` xs then x:l else l
    where l = getInts (makeSet xs)

-- usando sort para organizar a lista resultante
makeSet2 :: CInt -> [Int]
makeSet2 [] = []
makeSet2 (x:xs) = Conjunto . sort $ if x `notElem` xs then x:l else l
    where l = getInts (makeSet xs)

--b)

--c)