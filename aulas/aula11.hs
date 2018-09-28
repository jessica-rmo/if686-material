-- Tipos algébricos (continuação)

data Lista t = Nil | Cons t (Lista t) deriving (Show) --, Eq)

exL1 = Cons 3 (Cons 4 (Cons 5 Nil))
exL2 = Cons 3 (Cons 4 (Cons 5 Nil))

toList :: Lista t -> [t]
toList Nil = []
toList (Cons n l)  = n : toList l

fromList :: [t] -> Lista t
fromList [] = Nil
fromList (x:xs) = Cons x (fromList xs)


data Arvore t = Folha | No t (Arvore t) (Arvore t) deriving Show

--exemplo:
exArv = No 2 (No 3 Folha Folha) (No 5 (No 7 Folha Folha) Folha)

profundidade :: Arvore t -> Int
profundidade Folha = 0
profundidade (No n t1 t2) = 1 + max (profundidade t1) (profundidade t2)

colapse :: Arvore t -> [t]
colapse Folha = []
colapse (No n t1 t2) = colapse t1 ++ [n] ++ colapse t2

mapTree :: (t -> t) -> Arvore t -> Arvore t
mapTree f Folha = Folha
mapTree f (No n t1 t2) = (No (f n) (mapTree f t1) (mapTree f t2))


-- Overloading

allEqual :: (Eq t) => t -> t -> t -> Bool
allEqual n m p = (n == m) && (m == p)

data DiasSemana = Dom | Seg | Ter | Qua | Qui | Sex | Sab deriving (Show, Eq, Ord, Enum, Bounded)

-- Classes e instâncias
-- definição de uma classe (interface) e suas instâncias (tipos)

class Visible t where
   toString :: t -> String
   size :: t -> Int
   
instance Visible Char where
   toString ch = [ch]
   size _ = 1

instance Visible Bool where
   toString True = "True"
   toString False = "False"
   size _ = 1

instance Visible t => Visible [t] where
   toString = concat . (map toString)
   size  = (foldr (+) 0) . (map size)
   --ouras formas:
   --size l = length l
   --size [] = 0
   --size (x:xs) = size x + size xs

instance Eq t => Eq (Arvore t) where
   Folha == Folha = True
   (No n1 l1 r1) == (No n2 l2 r2) = (n1 == n2) && (l1 == l2) && (r1 == r2)
