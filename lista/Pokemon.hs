import System.IO

catch :: IO ()
catch = do
    min <- getLine
    max <- getLine
    pokemons <- getPokemons
    let ashPokemons = canCatch (read min) (read max) pokemons
    list ashPokemons

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

canCatch :: Int -> Int -> [(String,Int)] -> [String]
canCatch min max l = [ n ++" ("++ show p ++")" | (n,p) <- l, p>=min, p<=max]

list :: [String] -> IO ()
list [] = do return ()
list [x] = do putStrLn x
list (x:xs) = do putStrLn x
                 list xs

main :: IO ()
main = do catch