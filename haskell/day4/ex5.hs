maximum2 :: (Ord a) => [a] -> a
maximum2 [] = error "list empty"
maximum2 [x] = x
maximum2 [x, y] 
	| x > y = x
	| otherwise = y
maximum2 (x:xs) 
	| x > tailMax = x
	| otherwise = tailMax
	where tailMax = maximum2 xs


length2 [] = 0
length2 xs = 1 + (tail xs)

take2 :: (Integral a) => a -> [b] -> [b]
take2 n [] = []
take2 n xs = case n of 
