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
