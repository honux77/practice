lastButOne lst = last (init lst)
notCapital str = [ x | x <- str, x `elem` ['a'..'z']]
diff ls1 ls2   = [ x | x <- ls1, not (x `elem` ls2)]

