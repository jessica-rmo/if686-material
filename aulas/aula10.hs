-- Type Sinônimo = Tipo

type Nome = String

-- Tipos algébricos (data)

-- Enumeração:
-- Enumeramos, listamos, valores possíveis (que serao definidos depois)

data MBool = MTrue | MFalse -- MTrue e MFalse são construtores
data DiasSemana = Dom | Seg | Ter | Qua | Qui | Sex | Sab
data Estacao = Verao | Outono | Inverno | Primavera
data Temperatura = Frio | Quente

-- Como trabalhar com funções sobre esses tipos?
-- Usando casamento de padrões

clima :: Estacao -> Temperatura
{-
clima Verao = Quente
clima Outono = Quente
clima Inverno = Frio
clima Primavera = Quente
-}
clima Inverno = Frio
clima _ = Quente

-- Produto

type Idade = Int
data Pessoas = Pessoa Nome Idade deriving Show

exibirNome :: Pessoas -> String
exibirNome (Pessoa n i) = n

-- Exemplo: exibirNome (Pessoa "Maria 15")
--           = 15

data Figura = Circulo Float | Retangulo Float Float deriving Show

area :: Figura -> Float
area (Circulo r) = pi * r * r
area (Retangulo l h) = l * h

ehCircular :: Figura -> Bool
ehCircular (Circulo _) = True
ehCircular _ = False

-- Recursivo

data Expr = Lit Int
    | Add Expr Expr
    | Sub Expr Expr deriving Show

eval :: Expr -> Int
eval (Lit n) = n
eval (Add exp1 exp2) = eval exp1 + eval exp2
eval (Sub exp1 exp2) = eval exp1 - eval exp2

exibirExp :: Expr -> String
exibirExp (Lit n) = show n
exibirExp (Add e1 e2) = "[ " ++ exibirExp e1 ++ " + " ++ exibirExp e2 ++ " ]"
exibirExp (Sub e1 e2) = "[ " ++ exibirExp e1 ++ " - " ++ exibirExp e2 ++ " ]"

-- Exemplo:  exibirExp (Add (Sub (Lit 3) (Lit 1)) (Lit 6))
--            = "[ [ 3 - 1 ] + 6 ]"

data ListaInt = Vazia | Cons Int ListaInt deriving Show

somaListaInt :: ListaInt -> Int
somaListaInt (Vazia) = 0
somaListaInt (Cons n l) = n + somaListaInt l

-- Polimórfico

data Lista t = Nil | Const t (Lista t) deriving Show

tamanho :: Lista t -> Int
tamanho (Nil) = 0
tamanho (Const _ l) = 1 + tamanho l

data Arvore t = NilArv | No (Arvore t) t (Arvore t) deriving Show