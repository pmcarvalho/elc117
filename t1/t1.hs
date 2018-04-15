import Data.Char


-- 1 Crie uma função isVowel :: Char -> Bool que verifique se um caracter é uma vogal ou não.


isVowel :: Char -> Bool

isVowel c = elem (toLower(c)) "aeiou"
-- 2. Escreva uma função addComma, que adicione uma vírgula no final de cada string contida numa lista.


addComma :: [String] -> [String]

addComma s = map(\c -> c ++ ",")s
-- 3. Crie uma função htmlListItems :: [String] -> [String], que receba uma lista de strings e retorne outra lista contendo as strings formatadas como itens de lista em HTML.


--lambda

htmlListItems :: [String] -> [String]

htmlListItems s = map(\c -> "<LI>" ++ c ++ "</LI>")s
--aux
htmlListlItems :: [String] -> [String]

htmlListlItems s = map htmlListlAux s


htmlListlAux :: String -> String

htmlListlAux s = "<LI>" ++ s ++ "</LI>"
--4. Defina uma função que receba uma string e produza outra retirando as vogais.


--lambda
retiraVogaisl :: String -> String

retiraVogaisl s = filter(\c-> notElem (toLower(c)) "aeiou")s


--aux
retiraVogais :: String -> String

retiraVogais s = filter(isntVowel)s


isntVowel :: Char -> Bool

isntVowel c = notElem (toLower(c)) "aeiou"
--5. Defina uma função que receba uma string, possivelmente contendo espaços, e que retorne outra string substituindo os demais caracteres por '-'.

--lambda


substituiCaracteresl :: String -> String

substituiCaracteresl s = map(\c-> if c == ' ' then ' ' else '-')s


--aux
substituiCaracteres :: String -> String

substituiCaracteres s = map(substituiCaracteresAux)s

substituiCaracteresAux :: Char -> Char

substituiCaracteresAux c =  if c == ' ' then ' ' else '-'
--6. Escreva uma função firstName :: String -> String que, dado o nome completo de uma pessoa, obtenha seu primeiro nome. Suponha que cada parte do nome seja separada por um espaço e que não existam espaços no início ou fim do nome.


firstName :: String -> String

firstName s = takeWhile(/= ' ')s

--7. Escreva uma função isInt :: String -> Bool que verifique se uma dada string só contém dígitos de 0 a 9.


isInt :: String -> Bool

isInt s = length(filter(\c-> c>'9' || c<'0')s) == 0
--8. Escreva uma função lastName :: String -> String que, dado o nome completo de uma pessoa, obtenha seu último sobrenome. Suponha que cada parte do nome seja separada por um espaço e que não existam espaços no início ou fim do nome.
lastName :: String -> String

lastName s = reverse( takeWhile (/= ' ') (reverse s) )
--9. Escreva uma função userName :: String -> String que, dado o nome completo de uma pessoa, crie um nome de usuário (login) da pessoa, formado por: primeira letra do nome seguida do sobrenome, tudo em minúsculas. Dica: estude as funções pré-definidas no módulo Data.Char, para manipulação de maiúsculas e minúsculas.


userName :: String -> String

userName s = map toLower ([head s] ++ (lastName s))
--10. Escreva uma função encodeName :: String -> String que substitua vogais em uma string, conforme o esquema a seguir: a = 4, e = 3, i = 2, o = 1, u = 0.


trocaChar :: Char -> Char
trocaChar c
  
| c == 'a' = '4'
  
| c == 'e' = '3'
  
| c == 'i' = '2'
  
| c == 'o' = '1'
  
| c == 'u' = '0'
  
| otherwise = c


encodeName :: String -> String

encodeName s = map (\c -> trocaChar c) s
--11. Escreva uma função betterEncodeName :: String -> String que substitua vogais em uma string, conforme este esquema: a = 4, e = 3, i = 1, o = 0, u = 00.


retrocaChar :: Char -> String
retrocaChar c
  
| c == 'a' = "4"
  
| c == 'e' = "3"
  
| c == 'i' = "1"
  
| c == 'o' = "0"
  
| c == 'u' = "00"
  
| otherwise = [c]


betterEncodeName :: String -> String

betterEncodeName s = concatMap (\c -> retrocaChar c) s
--12. Dada uma lista de strings, produzir outra lista com strings de 10 caracteres, usando o seguinte esquema: strings de entrada com mais de 10 caracteres são truncadas, strings com até 10 caracteres são completadas com '.' até ficarem com 10 caracteres.


ajeitaStrings :: String -> String

ajeitaStrings s

 | length s > 10 = take 10 s

 | length s < 10 = ajeitaStrings (s ++ ".")

 | otherwise = s

a
jeitaListas :: [String] -> [String]

ajeitaListas l = map ajeitaStrings l