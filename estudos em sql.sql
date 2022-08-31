 dados usados https://drive.google.com/file/d/1LCofjYj-pV1asBLrxtgPDsbqMFRefHW5/view
--Anotacoes aula SQL
--" " representa um texto a ser substituido, --incluindo as aspas.

--comando basico e mais usado: SELECT
--executar busca em cima de dados

--SELECT = seleciona uma quantidade de linhas com --categorias especificas, definidas pelo comando.

--SELECT usando em qalqer banco de dados
--SELECT = uma coluna ou mais, ou todas de uma tabela

SELECT "nome da coluna"
From "nome da tabela"

SELECT * 

-- * retorna todas as colunas

DESAFIO 1

A equipe precisa fazer uma pesquisa sbre os nomes mais comuns de seus clientes e precisa do nome e sobrenome de todos os clientes cadastrados no sistema.

SELECT firstName, lastName
FROM person.Person;

-- DISTINCT usado para retornar dados unicos 

DESAFIO 2

Quantos sobrenomes unicos nos temos em nossa tabela person.Person ?

SELECT DISTINCT lastName
FROM person.Person;

-- Where + desafios
-- extrair alguns dados da tabela
-- SELECT "nome da coluna, nome da coluna"
-- FROM "tabela"
-- WHERE "condicao";

SELECT *
FROM Production.Product
WHERE color = 'blue' or color = 'black'
-- mostra tudo da tabela production.product com a condicao de ser azul ou preto.

SELECT *
FROM Production.Product
WHERE ListPrice > 1500
-- ... com a condicao de que o valor eh maior que 1500

SELECT *
FROM Production.Product
WHERE ListPrice > 1500 and ListPrice < 5000
-- ... com a condicao de ser maior que 1500 e menor que 5000.

SELECT *
FROM Production.Product
WHERE color <> 'red'
-- ... condicao de ser diferente de red

DESAFIO 3

A equipe de producao de produtos precisa do nome de todas as pecas que pesam mais que 500kg mas nao mais que 700kg para inspecao
-- coloquei * em vez de Name na primeira vez 'clownface'
SELECT Name
FROM Production.Product
WHERE Weight > 500 and weight <= 700;

DESAFIO 4

Foi pedido pelo marketing uma relacao de todos os empregados(employees) que sao casados(single=solteiro, married=casado) e sao assalariados(salaried)
-- acertei de primeira rs
SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' and SalariedFlag= '1';

DESAFIO 5 

Um usuario chamado Peter Krebs esta devendo um pagamento, consiga o email dele para que possamos enviar uma cobranca.
usar tabela person.person (BusinessEntityId) e depois person.emailadress
-- entendi nada tive q olhar o prof
SELECT *
FROM Person.Person
WHERE firstName = 'peter' and LastName = 'krebs'
--aqi ele procura o peter krebs, para achar o businessentityid

Select *
FROM person.EmailAddress
WHERE BusinessEntityID = '26';
--achando o ID dele, buscamos pelo person.emailadress para encontrar o email.

COUNT 
SELECT COUNT(*)
FROM tabela
-- conta todas as colunas da tabela

SELECT COUNT(title)
FROM tabela
-- com title seleciona so uma coluna

SELECT COUNT(DISTINCT title)
FROM tabela
-- especifica de uma coluna sem os valores nulos

DESAFIO 6 
eu quero saber quantos produtos temos cadastrados em nossa tabela de produtos
-- so olhei msm to cansada
SELECT count(*)
FROM Production.Product

DESAFIO 7
eu quero saber quantos tamanhos de produtos temos cadastrados em nossa tabela 
-- fiz certo de primeira..
SELECT count(Size)
FROM Production.Product

DESAFIO 8
eu quero saber quantos tamanhos diferentes de produtos eu tenho cadastrado em nossa tabela
-- O prof n corrigiu, acho q ta certo
SELECT count(DISTINCT Size)
FROM Production.Product

 TOP, primeiros 10 (qalqer valor) dados da tabela

SELECT TOP 10 *
FROM tabela

 ORDER BY

SELECT *
FROM Person.Person
ORDER BY firstName asc

ascendente ordem crescente, desc ordem decrescente

SELECT FirstName, LastName
FROM Person.Person
ORDER BY firstName asc,lastName desc

DESAFIO 11
Obter o product ID dos 10 produtos mais caros cadastrados no sistema, listando do mais caro para o mais barato
-- acertei de primeira, mas tive que pensar uns 2 minutinhos rss
SELECT TOP 10 ProductID, ListPrice
FROM Production.Product
ORDER BY ListPrice desc

DESAFIO 12
Obter o nome e o numero do produto dos produtos que tem o ProductID entre 1 e 4
-- fiz sem o order by e 
SELECT TOP 4 Name, ProductNumber
FROM Production.Product
ORDER BY ProductID asc

BETWEEN
Eh usado para encontrar o valor entre um minimo e valor maximo 

valor BETWEEN minimo AND maximo,
ie
valor >= minimo and valor <= maximo;

SELECT *
FROM HumanResources.Employee
Where HireDate BETWEEN '2009/01/01' and '2010/01/01'
ORDER BY HireDate
ano mes e dia

IN usamos junto com WHERE
-- para achar o valor 2 e 7 e 13 de BusinessEntityID
SELECT *
FROM Person.Person
WHERE BusinessEntityID IN (2,7,13)

LIKE
achar um nome com o pedaco da palavra q vc lembra %to, acha o to no final
to% acha o to no comeco, %to% encontra o to dentro das palavras, %to_ se limita a um caracter apos o to.
SELECT *
FROM Person.Person
WHERE FirstName like '%to'

D 13

quantos produtos temos que custam mais que 1500dol?
SELECT count(listprice)
FROM Production.product
where listprice >1500
-- count conta a quantidade de linhas que tem na tabela listprice

D 14
Quantas pessoas temos com o sobrenome que inicia com a letra p?

SELECT count(lastname)
FROM Person.Person
where lastname like 'p%'

D 15
Em quantas cidades unicas estao cadastrados nossos clientes?
SELECT count(DISTINCT city)

D 16
Quantos produtos vermelhos tem o preco entre 500 a 1000 dolares
SELECT count(*)
WHERE color = 'red'
and listPrice BETWEEN 500 AND 1000