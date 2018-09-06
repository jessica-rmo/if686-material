double :: [Int] -> [Int]
double [] = []
double (x:xs) = x*2 : double xs
--double (x:xs) = x*2 ++ double xs


member :: [Int] -> Int -> Bool
member [] _ = False
member (x:xs) n
    | (x == n)   = True
    | otherwise = member xs n

ehDigito :: Char -> Bool
ehDigito ch = (ch >= '0') && (ch <='9')

digits :: [Char] -> [Char]
digits [] = []
digits (x:xs)
    | ehDigito x = x : digits xs
    | otherwise  = digits xs

somaPares :: [(Int,Int)] -> [Int]
somaPares [] = []
somaPares ((a,b):xs) = (a+b) : somaPares xs


sumPairs :: [Int] -> [Int] -> [Int]
sumPairs [] [] = []
sumPairs [] b = b
sumPairs a [] = a
sumPairs (a:as) (b:bs) = (a+b) : sumPairs as bs