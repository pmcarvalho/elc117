import Data.Char

--1. Escreva uma função recursiva isBin :: String -> Bool para verificar se uma dada String representa um número binário, ou seja, contém apenas caracteres '0' ou '1'. As únicas funções pré-definidas autorizadas aqui são head e tail. 
isBin :: String -> Bool
isBin "" = False
isBin "0" = True
isBin "1" = True
isBin s = ((head s) == '1' || (head s) == '0') && isBin (tail s)

--2. Reescreva a função acima de forma não-recursiva. Dê outro nome para ela, por exemplo isBin'. Aqui você pode usar quaisquer funções auxiliares pré-definidas em Haskell.
isBin' :: String -> Bool
isBin' "" = False
isBin' s = length(filter (\x -> x /= '1' && x /= '0') s) == 0

--3. Implemente a função auxBin2Dec de forma recursiva, para que bin2dec funcione corretamente.
auxBin2Dec :: [Int] -> Int -> Int
auxBin2Dec [] n = 0
auxBin2Dec [0] n = 0
auxBin2Dec bits n = (((head bits) * 2)^n) + (auxBin2Dec (tail bits) (n-1))

bin2dec :: [Int] -> Int
bin2dec [] = undefined
bin2dec bits = auxBin2Dec bits ((length bits)-1)

--5. Crie uma função recursiva dec2bin :: Int -> [Int] que receba um número inteiro positivo e retorne sua representação em binário, sob forma de uma lista de 0's e 1's.
dec2bin' :: Int -> [Int]
dec2bin' 0 = []
dec2bin' x = (mod x 2) : dec2bin' (div x 2)

dec2bin :: Int -> [Int]
dec2bin 0 = [0]
dec2bin x = reverse (dec2bin' x)

--6. Implemente uma dessas funções: isHex :: String -> Bool ou hex2dec :: String -> Int ou dec2hex :: Int -> String.
isHex :: String -> Bool
isHex s = length (filter (\x -> not (isHexDigit(x))) s) == 0