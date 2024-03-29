-- Funções com listas

double :: [Int] -> [Int]
double [] = []
double (x:xs) = x*2 : double xs
--double (x:xs) = x*2 ++ double xs

member ::  Int -> [Int] -> Bool
member n [] = False
member n (x:xs)  = (x == n) || member n xs

member2 ::Int -> [Int] -> Bool
member2 n [] = False
member2 n (x:xs)
    | n == x = True
    | otherwise = member2 n xs

ehDigito :: Char -> Bool
ehDigito ch = (ch >= '0') && (ch <='9')

digits :: [Char] -> [Char]
digits [] = []
digits (x:xs)
    | ehDigito x = x : digits xs
    | otherwise  = digits xs


sumPairs :: [Int] -> [Int] -> [Int]
sumPairs [] [] = []
sumPairs [] b = b
sumPairs a [] = a
sumPairs (a:as) (b:bs) = (a+b) : sumPairs as bs

somaPares :: [(Int,Int)] -> [Int]
somaPares [] = []
somaPares ((a,b):xs) = (a+b) : somaPares xs

somaPares2 :: [(Int,Int)] -> [Int]
somaPares2 l
    | l == [] = []
    | otherwise = (fst (head l) + snd (head l)) : somaPares2 (tail l)


indice :: [Int] -> Int -> Int
indice l n
    | n == (head l) = head l
    | otherwise = indice (tail l) (n-1)

inverter :: [Int] -> [Int]
inverter [] = []
inverter (x:xs) = inverter xs ++ [x]


mtakeInt :: Int -> [Int] -> [Int]
mtakeInt _ [] = []
mtakeInt 0 _ = []
mtakeInt n (x:xs) = x : mtakeInt (n-1) xs 

mtakeBool :: Int -> [Bool] -> [Bool]
mtakeBool _ [] = []
mtakeBool 0 _ = []
mtakeBool n (x:xs) = x : mtakeBool (n-1) xs 

mtake :: Int -> [t] -> [t]
mtake _ [] = []
mtake 0 _ = []
mtake n (x:xs) = x : mtake (n-1) xs


-- inserir numa lista de forma ordenada
iSort :: [Int] -> [Int]
iSort [] = []
iSort (x:xs) = ins x (iSort xs)

ins :: Int -> [Int] -> [Int]
ins n [] = [n]
ins n (x:xs)
    | n <= x = (n:x:xs)
    | otherwise = x : ins n xs

{-
iSort [6,4,2]
= ins 6 (iSort [4,2])
= ins 6 (ins 4 (iSort [2]))
= ins 6 (ins 4 (ins 2 (iSort []))
= ins 6 (ins 4 (ins 2 []))
= ins 6 (ins 4 [2])
= ins 6 ([2,4])
= [2,4,6]

-}

--Compreensão de listas

ehPar :: Int -> Bool
ehPar x = mod x 2 == 0

l1 = [x | x <- [2,4]]
l2 = [ 2 * x | x <- [2,4]]
l3 = [ 2 * x | x <- [2 .. 10]]
l4 = [ 2 * x | x <- [2 .. 10], (mod x 2 == 0)]
l5 = [ 2 * x | x <- [2 .. 10], 
          ehPar x, x> 6]

{-
*Main> [a + b | (a,b) <- [(1,2), (12,4), (8,6)], not( ehPar a ) ]
[3]*Main> [a + b | (a,b) <- [(1,2), (12,4), (8,6)], ehPar a]
[16,14]
*Main> [a + b | (a,b) <- [(1,2), (12,4), (8,6)], ehPar a, b < 6]
[16]
-}

tamLista l = sum [1 | _ <- l]

triangulos = [(a,b,c) | c <- [1..10], 
                        b <- [1..10], 
                        a <- [1..10]  ]

--triângulos retângulos com perímetro maior que 20
triangulosRet = [(a,b,c) | c <- [1..10], 
                           b <- [1..c], 
                           a <- [1..b],
                           a^2 + b^2 == c^2,
                           a+b+c > 20        ]

-- QuickSort
qSort :: [Int] -> [Int]
qSort [] = []
qSort (x:xs) = 
    qSort [y | y <- xs, y < x] ++ 
    [x] ++
    qSort [y | y <- xs, y >= x]

ordenarQSort :: [Int] -> [Int]
ordenarQSort l = qSort l