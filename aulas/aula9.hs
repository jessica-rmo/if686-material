inc :: Int -> Int
inc x = x + 1 

twice :: (t -> t) -> t -> t
twice f x = f (f x)

--iter :: Int -> (Int -> Int) -> (Int -> Int)
iter 0 f = id
iter n f = (iter (n-1) f) . f

{-
iter 3 inc
= (iter 2 inc) . inc
= ((iter 1 inc). inc ). inc
= (((iter 0 inc) . inc). inc ). inc
= ((id . inc). inc ). inc
-}

-- Notacao lambda

-- Inc : (\x -> x + 1)

-- uma expressão que define a função, não um tipo
addNum n = (\m -> m + n)

-- Aplicação parcial de funções:
-- Possibilidade de passar menos argumentos do que o que a função pede

multiplica :: Int -> Int -> Int
multiplica m n = m * n

{-
multiplica 2 3 = 6
(multiplica 2) [10 .. 15] = [20, 22, 24, 26, 28, 30]
-}

tresIguais :: Int -> Int -> Int -> Bool
tresIguais m n p = (m == n) && (n == p)

{-
multiplica 2 3 == (multiplica 2) 3  -- associação à esquerda

-- A aplicação de funções em haskell é associativa à esquerda (feita da esquerda para a direita)
-- A aplicação de '->' é associativa à direita
-- f a b =/ (f a) b 
-}

inc1Lista l = map inc l
inc1Lista2 l = map (\x -> x + 1) l

{- Como compor map com filter?
map :: (a -> b) -> [a] -> [b]
filter :: (a -> Bool) -> [a] -> [a]

  filter   .    map
=(u -> v)    (f -> u)

(f -> u) = (a -> b) -> ([a] -> [b])
(u -> v) = (a -> Bool) -> ([a] -> [a])


filter (\y -> y>15) . map (\x -> x*5)
  = [a] -> [a]     .    [a] -> [b]
  = [Int] -> [Int]
-}

f1 l = (filter (\y -> y > 15). map (\x -> x * 5)) l

mzipwith :: (a -> b -> c) -> [a] -> [b] -> [c]
mzipwith f (x:xs) (y:ys) = f x y : mzipwith f xs ys

{--- Ordem dos operadores:
(>3) 5 = True   --(op v) x = x `op` v
(3>) 5 = False  --(v op) x = v `op` x
-}

{-
iter 4 (/2) 
= (iter 3 (/2)) . (/2)
= ((iter 2 (/2)). (/2)) . (/2)
= (((iter 1 (/2)). (/2)). (/2)) . (/2)
= (((iter 0 (/2)) ) (/2)). (/2)). (/2)) . (/2)
= (( id ) (/2)). (/2)). (/2)) . (/2)

-}

{-
iter 4 ((/) 2)
= (iter 3 ((/) 2)) . ((/) 2)
= (((iter 2((/) 2) )) . ((/) 2) . ((/) 2)
= (iter 1 ((/) 2))). ((/) 2). ((/) 2). ((/) 2)
= (iter 0 ((/) 2)). ((/) 2). ((/) 2). ((/) 2). ((/) 2)
= (id) . ((/) 2). ((/) 2). ((/) 2). ((/) 2) 
-}
