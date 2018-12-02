import System.IO

getBiggerList :: IO (String)
getBiggerList = do
    lists <- getLists
    let sLists = sizeLists lists
    let bList = biggerList sLists
    return (bList!!0)
    --primeira maior lista encontrada

getLists :: IO [String]
getLists = do
    l <- getLine
    end <- isEOF
    if end then
        return [l]
    else do
        newl <- getLists
        return (l:newl)

biggerList :: [(String,Int)] -> [String]
biggerList l = [str | (str,len) <- l, len == maxi l]
--retorna todas as listas de tamanho igual a maxi

maxi :: [(String,Int)] -> Int
maxi l = maximum $ snd $ unzip l

sizeLists :: [String] -> [(String,Int)]
sizeLists l = [(s, (commas s ',')) | s <- l ]

commas :: String -> Char -> Int
commas str c = if (str=="[]" || str=="") then count
               else count+1
               where count = length $ filter (==c) str

main :: IO ()
main = do
    list <- getBiggerList
    putStrLn list
