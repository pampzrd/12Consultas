--1 Buscar o nome e o ano dos filmes
SELECT Nome,Ano FROM Filmes

--2 Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, Ano, Duracao FROM Filmes
ORDER BY Ano


--3 Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT * FROM Filmes WHERE Nome = 'De volta para o futuro'


--4 Buscar os filmes lançados em 1997
SELECT * FROM Filmes WHERE Ano = 1997


--5 Buscar os filmes lançados APÓS o ano 2000
SELECT * FROM Filmes WHERE Ano > 2000


--6 Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT * FROM Filmes WHERE Duracao > 100 AND Duracao < 150
ORDER BY Duracao 


--7 Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano, COUNT(*) Quantidade FROM Filmes
GROUP BY Ano
ORDER BY Quantidade DESC



--8 Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT PrimeiroNome, UltimoNome, Genero FROM Atores WHERE Genero = 'M'


--9 Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT PrimeiroNome, UltimoNome, Genero FROM Atores WHERE Genero = 'F'
ORDER BY PrimeiroNome


--10 Buscar o nome do filme e o gênero  
-- Primeiro refere o ID da primeira tabela citada e depois o Id da outra tabela. 
-- Testa linha por linha para checar o resultado. Checar se bate os Id logicamente.
-- Deixar o Select * de todas as tabelas para consultar enquanto checa as correspondências.
-- Por último acrescenta a tabela correspondente ao outro retorno.

SELECT Nome, Genero FROM Filmes
INNER JOIN FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id


--11 Buscar o nome do filme e o gênero do tipo "Mistério"
-- Faz JOIN primeiro na tabela das referências ID.
SELECT Nome, Genero FROM Filmes
INNER JOIN FilmesGenero FG ON FG.IdFilme = Filmes.Id
INNER JOIN Generos ON FG.IdGenero = Generos.Id
WHERE FG.IdGenero = 10


--12 Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
-- Identificar quais colunas ele pede. Em seguida identificar em quais tabelas elas estão.
-- Ao identificar as tabelas, saiba que precisa fazer um JOIN nessas tabelas.
-- Se atentar onde tem as referências Id para usar primeiro. Nesse caso ElencoFilme tem as referências de Id.
SELECT Nome, PrimeiroNome, UltimoNome, Papel FROM Filmes F
INNER JOIN ElencoFilme EF ON F.Id = EF.IdFilme
INNER JOIN Atores A ON EF.IdAtor = A.Id
