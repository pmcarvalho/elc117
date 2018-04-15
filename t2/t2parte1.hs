--1. Usando recursão, escreva uma função geraTabela :: Int -> [(Int,Int)] que produza uma lista com n tuplas, cada tupla com números de n a 1 e seus respectivos quadrados.
geraTabela :: Int -> [(Int, Int)]
geraTabela 0 = []
geraTabela n = (n, n*n) : geraTabela (n-1)

--2. Defina uma função recursiva que verifique se um dado caracter está contido numa string.
verContido :: Char -> String -> Bool
verContido c [] = False
verContido c s = c == (last s) || verContido c (init s)

--3. Defina uma função recursiva que receba uma lista de coordenadas de pontos 2D e desloque esses pontos em 2 unidades.
deslocaDois :: [(Float, Float)] -> [(Float, Float)]
deslocaDois [] = []
deslocaDois l = ((fst (head l)) + 2.0, (snd (head l)) + 2.0) : deslocaDois (tail l)

--4. Defina uma função que receba um número n e retorne uma lista de n tuplas, cada tupla com números de 1 a n e seus respectivos quadrados.
reverteTabela :: [(Int, Int)] -> [(Int, Int)]
reverteTabela [] = []
reverteTabela l = (last l) : reverteTabela (init l)
geraTabela2 :: Int -> [(Int, Int)]
geraTabela2 0 = []
geraTabela2 n = reverteTabela (geraTabela n)
