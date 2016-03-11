lastButOne lst = last (init lst)
notCapital str = [ x | x <- str, x `notElem` ['A'..'Z']]
diff ls1 ls2   = [ x | x <- ls1, x `notElem` ls2]

