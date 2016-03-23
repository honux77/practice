foo :: Int -> Int
foo 0 = 1
foo 1 = 1
foo n = 2 * n

describeList :: [a] -> String  
describeList xs = "The list is " ++ case xs of [] -> "empty."  
                                               [x] -> "a singleton list."  
                                               xs -> "a longer list."
