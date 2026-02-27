Use Imoveis;
Go

-- 1. Liste todas as linhas e os campos cd_Vendedor, nm_Vendedor e ds_Email
-- da tabela VENDEDOR em ordem alfabética decrescente.
  
Select cd_Vendedor, nm_Vendedor, ds_Email
From Vendedor
Order by nm_Vendedor Desc;

--2. Liste as colunas cd_Imovel, cd_Vendedor e vl_Imovel de todos os imóveis
-- do vendedor 2.

Select cd_Imovel, cd_Vendedor, vl_Imovel
From Imovel
Where cd_Vendedor = 2;

--3. Liste as colunas cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado dos imoveis
-- cujo preço de venda seja inferior a 150.000 e sejam do estado do RJ

Select cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado
From Imovel
Where vl_Imovel < 150000 And sg_Estado = 'RJ';

--4. Liste as colunas cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado dos imóveis cujo
-- preço de venda seja inferior a 150.000 e o vendedor não seja 2.

Select cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado
From Imovel
Where vl_Imovel < 150000 And cd_Vendedor != 2;

--5. Liste as colunas cd_Comprador, nm_Comprador, ds_Endereco, sg_Estado da tabela
-- COMPRADOR em que o estado seja nulo.

Select cd_Comprador, nm_Comprador, ds_Endereco, sg_Estado
From Comprador
Where sg_Estado Is Null;

--6. Liste todas as ofertas cujo valor esteja entre 100.000 e 150.000.

Select * From Oferta 
Where vl_Oferta Between 100000 And 150000;

--7. Liste todos os vendedores que tenham a letra 'A' na segunda posição do nome.

Select nm_Vendedor
From Vendedor
Where nm_Vendedor Like '_A%';

--8. Liste o total de ofertas por comprador de 2008 a 2009.

Select cd_Comprador, SUM(vl_Oferta) Total
From Oferta
Where Year(dt_Oferta) Between 2008 And 2009 -- Year(), Month(), Day() -> funções que extraem respectivamente ano, mês e dia de um dado.
Group by cd_Comprador With Rollup; -- with rollup para listar um total geral na ultima linha

--9. Liste o valor médio de todos os Imóveis por bairro, somente do estado de SP e
-- coloque o resultado em ordem decrescente de valor.

Select cd_Bairro, cd_Cidade, AVG(vl_Imovel)
From Imovel
Where sg_Estado = 'SP'
Group by cd_Bairro, cd_Cidade, sg_Estado
Order by AVG(vl_Imovel) Desc;

--10. Liste o maior valor de imovel por vendedor, somente para os vendedores 1 e 2.

Select cd_Vendedor, MAX(vl_Imovel) Valor
From Imovel
Where cd_Vendedor = 1 Or cd_Vendedor = 2
Group by cd_Vendedor;

--11. Mostre a quantidade de imoveis cujo preço de venda seja inferior a 150.000
-- por Estado e a área total inferior a 300

Select sg_Estado AS Estado, COUNT(*) AS Quantidade
From Imovel
Where vl_Imovel < 150000 AND qt_AreaTotal < 300
GROUP BY sg_Estado;
