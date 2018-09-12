mdc :: Int -> Int -> Int
mdc a b
   | b == 0    = a
   | otherwise = mdc b (a `mod` b)
   
primo :: Int -> Bool
primo n
  | n > 1 && (mod n 2 /= 0 && mod n 3 /= 0 && mod n 5 /= 0 && mod n 7 /= 0) = True
  | otherwise = False
  
ehPrimo :: Int -> Bool
ehPrimo a = foldr (&&) (True) (map (\x -> (mod a x) /= 0) [2..(a-1)])

ehPrimo2 :: Int -> Bool
ehPrimo2 x = ehPrimoHelper x 2

ehPrimoHelper :: Int -> Int -> Bool
ehPrimoHelper n x
  | n == x         = True
  | (mod n x) == 0 = False
  | otherwise      = ehPrimoHelper n (x+1)