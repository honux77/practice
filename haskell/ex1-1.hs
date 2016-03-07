heven x = if x `mod` 2 == 0 then True else False
factorial x = if x <= 1 then 1 else x * factorial (x - 1)
