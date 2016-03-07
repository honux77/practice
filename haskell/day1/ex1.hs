heven x = if x `mod` 2 == 0 then True else False
heven' n = n `mod` 2 == 0

factorial x = if x <= 1 then 1 else x * factorial (x - 1)
factorial' x = product [1..x]

