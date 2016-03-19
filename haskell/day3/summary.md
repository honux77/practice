# Typles and  Typeclasses

http://learnyouahaskell.com/types-and-typeclasses#typeclasses-101

* :t = command which tell us its type.
```
ghci> :t 'a'  
'a' :: Char  
```
* type variables: somthiing like a generic
```
ghci> :t fst  
fst :: (a, b) -> a 
```

* typeclasses : somthing like a interface 
```
ghci> :t (==)  
(==) :: (Eq a) => a -> a -> Bool 
```

* show and read
```
ghci> show 5.334  
"5.334"  

ghci> read "8.2" + 3.8  
12.0  
```

* fromIntegral
```
ghci> fromIntegral (length [1,2,3,4]) + 3.2
7.2
```
