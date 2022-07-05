--RESOLUÇÃO DOS DESAFIOS - IMERSÃO T-SQL - COMUNIDADE SQLMOC
-----------------------------------------------------------------------

------ DESAFIO SELECT ------ 

/*
Selecionar o campo Nome e o pre_unit da tabela de item, alterar o nome da coluna pre_unit para preço, 
acrescentar 10% no valor de todos os itens e por fim criar uma classificação dos itens, se o preço do item for até 
R$ 100,00 classificar como A, senão como B. 
*/

SELECT 
Nome, 
pre_unit*1.10 as preco,
pre_unit,
case when pre_unit*1.10 <= 100 then 'A' ELSE 'B' END AS CATEGORIA
FROM ITEM


-----------------------------------------------------------------------

------ DESAFIO RESTRINGINDO ------ 

/*
Selecionar todos os clientes que nasceram nos anos 70 e que o seu nome não seja William.
*/

SELECT 
Nome,
Dat_Nasc FROM Clientes
where year(dat_nasc) >= 1970 and year(dat_nasc) < 1980
and nome not like '%William%'


-----------------------------------------------------------------------

------ DESAFIO FUNÇÕES ------ 

/*
Necessito de uma extração que me retorne a idade do cliente mais velho da nossa empresa.
*/

select
CASE WHEN MONTH(GETDATE()) > MONTH(DAT_NASC) THEN MAX(DATEDIFF(year,Dat_Nasc,getdate()))
else MAX(DATEDIFF(year,Dat_Nasc,getdate())-1)  end as idade_correta

FROM 
Clientes
GROUP BY CLIENTES.Dat_Nasc
ORDER BY idade_correta DESC

/*
Necessito de uma extração que me retorne o preço do item mais caro e também do item mais barato da tabela ITEM.
*/

SELECT 
MAX(PRE_UNIT) AS MAIOR_PRECO,
MIN(PRE_UNIT) AS MENOR_PRECO

FROM ITEM

--Resolução do desafio acima, porém agora incluindo o nome do cliente - Foi necessário fazer um subselect.

SELECT 
NOME,
MAX(PRE_UNIT) AS MAIOR_PRECO FROM ITEM
where Pre_Unit =  (select MAX(PRE_UNIT) from item)
group by nome
UNION ALL
SELECT 
NOME,
MIN(PRE_UNIT) AS MAIOR_PRECO FROM ITEM
where Pre_Unit =  (select MIN(PRE_UNIT) from item)
group by nome


-----------------------------------------------------------------------

------ DESAFIO JOIN ------ 

/*
Necessito de um query que me retorne o valor total comprado por cada um dos clientes.
*/

SELECT 
clientes.nome, 
sum((item.Pre_Unit*Ped_Itens.Qtde)) as total 
FROM PEDIDOS
INNER JOIN Clientes
ON Pedidos.Id_Cliente = Clientes.Id_Cliente
inner join Ped_Itens
on Pedidos.Id_Pedido = Ped_Itens.Id_Pedido
inner join Item
on Ped_Itens.Id_Item = item.Id_Item
group by clientes.nome
order by total desc


-----------------------------------------------------------------------

------ DESAFIO SUBCONSULTAS ------ 

/*
Crie uma query que retorne todos os item cujo o seu preço seja maior que a média de todos os preços.
*/

SELECT * FROM ITEM
WHERE Pre_Unit > (SELECT AVG(PRE_UNIT) FROM ITEM)


-----------------------------------------------------------------------

------ DESAFIO  MANIPULANDO DADOS ------ 

/*
Insira um novo registro na tabela de Clientes. Vocês decidem qual será  o seu nome, e as demais informações.
*/

INSERT INTO Clientes VALUES ('William Kuwiecinski', '1989-07-01', GETDATE())


/*
Alterem o nome do cliente recém criado para Joãozinho da Silva e a sua data de nascimento para 01/01/1989. 
Obs: Montem apenas um comando UPDATE que já faça as duas alterações.
*/

UPDATE Clientes
SET Nome = 'Joãozinho da Silva',
Dat_Nasc = '1989-01-01'
WHERE Id_Cliente = '1021'

/*
Não fiquem bravos comigo, mas agora deletem esse
registro criado :)
*/

DELETE Clientes
WHERE Id_Cliente = '1021'

--NUNCA ESQUEÇAM DO WHERE... E PARA UMA MAIOR SEGURANÇA UTILIZEM O BEGIN TRAN, E DEPOIS UM COMMIT OU ROLLBACK.


-----------------------------------------------------------------------

------ DESAFIO  FINAL ------ 

/*
Crie uma procedure que terá como parâmetro o nome de uma categoria de item. Ao digitar a categoria será retornado 
todos os item desta categoria, juntamente com a quantidade de estoque de cada item.
*/


CREATE PROCEDURE DESAFIO_FINAL 
@categoria varchar(100)

as


SELECT 
ITEM.Nome,
Estoque.Qtde
FROM ITEM
INNER JOIN Categoria
ON ITEM.Id_Categoria = Categoria.Id_Categoria
INNER JOIN Estoque
ON ITEM.Id_Item = Estoque.Id_Item
WHERE Categoria.Nome = @categoria

-----------------------------------------------------------------------