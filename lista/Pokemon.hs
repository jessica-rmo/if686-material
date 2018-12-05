import System.IO

catch :: IO ()
catch = do
    min <- getLine
    max <- getLine
    pokemons <- getPokemons
    list $ canCatch (read min) (read max) pokemons

getPokemons :: IO [(String,Int)]
getPokemons = do
    name <- getLine
    power <- getLine
    end <- isEOF
    if end then
        return [(name, read power)]
    else do
        newPokemon <- getPokemons 
        return ((name, read power):newPokemon)

canCatch :: Int -> Int -> [(String,Int)] -> [(String,Int)]
canCatch min max l = filter (\(name,pw) -> pw>=min && pw<=max) l

list :: [(String,Int)] -> IO ()
list [] = do return ()
list (x@(name,power):xs) = do
    putStrLn (name ++" ("++ show power ++")")
    list xs

main :: IO ()
main = do catch