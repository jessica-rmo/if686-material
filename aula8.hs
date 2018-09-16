-- Filter

filtro :: (a -> Bool) -> [a] -> [a]
filtro f [] = []
filtro f (x:xs)
    | f x       = x : filtro f xs
    | otherwise = filtro f xs

-- Composicao de funcoes

twice :: (t -> t) -> (t -> t)
twice f = f . f
-- (twice succ) 12 = (succ . succ) 12 = succ (succ 12) = 14


-- @TO_DO completar com código da aula postado no Piazza
