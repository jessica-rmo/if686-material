import Data.Char

convert :: String -> String
convert [] = ""
convert (x:xs) = [convertChar x] ++ convert xs

convertChar :: Char -> Char
convertChar c = if (isUpper c)
                then toLower c
                else toUpper c

main :: IO()
main = do
    str <- getLine
    putStrLn (convert str)