swap tpls = [ (y,x) | (x,y) <- tpls ]
sum2 nx = (head nx) + (if tail nx /= [] then sum2 (tail nx) else 0)
divisors m = [ x | x <- [1..m], m `mod` x == 0 ]
