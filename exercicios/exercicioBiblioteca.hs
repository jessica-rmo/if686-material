type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa, Livro)]

--Exemplo de uma base de dados
baseExemplo :: BancoDados
baseExemplo = [ ( "Sergio", "O Senhor dos Aneis" ), 
                ( "Andre" , "Duna " ), 
                ( "Fernando", "Jonathan Strange & Mr. Norrell" ),
                ( "Fernando", "Duna" ) ]


-- Funções sobre a base de dados - consultas
livros :: BancoDados -> Pessoa -> [Livro]
livros [] _ = []
livros bd [] = []
livros ((p,l):bds) pessoa
    | p == pessoa = l : livros bds pessoa
    | otherwise   = livros bds pessoa

emprestimos : : BancoDados -> Livro -> [Pessoa]
emprestado : : BancoDados -> Livro -> Bool
qtdEmprestimos : : BancoDados -> Pessoa -> Int



-- Funções utilizando compreensão de listas
livrosC :: BancoDados -> Pessoa -> [Livro]
livrosC bd pessoa = [l | (p,l) <- bd, p == pessoa]