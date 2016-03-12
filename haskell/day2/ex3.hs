swap tpls = [ (y,x) | (x,y) <- tpls ]
sum2 nx = if null nx then 0 else head nx + sum2 (tail nx)
divisors m = [ x | x <- [1..m], m `mod` x == 0 ]
