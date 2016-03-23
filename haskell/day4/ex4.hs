yesNo :: Bool -> [Char]
yesNo True = "Yes"
yesNo False = "No"

trueman :: (Num a) => [Bool] -> a
trueman [] = 0
trueman (True:xs) = 1 + trueman xs
trueman (False:xs) = trueman xs

listToPairs :: [a] -> [(a,a)]
listToPairs [] = []
listToPairs [x] = []
listToPairs [x,y] = [(x,y)]
listToPairs (a:b:c) = (a,b):(listToPairs c)
