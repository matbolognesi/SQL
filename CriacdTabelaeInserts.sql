/*Banco de dados de aulas de SQL
	Loja de Sucos do Jailson
	* Vende sucos (principalmente de Laranja)
	* Dados dos clientes:
		Nome (texto)
		nascimento (data dd/mm/aaaa)
		sexo (n�mero)
		endere�o
			Rua (texto)
			cidade (texto)
			Estado (texto)
		Telefones (texto)
	* Dados das vendas
		N�mero da venda (n�mero) 
		cliente que comprou (texto)
		pre�o total (n�mero)
	* Dados do produto
		Nome (texto)
		Pre�o (n�mero)
*/



CREATE TABLE tb_Produtos (
	cd_Produto INT PRIMARY KEY IDENTITY(1,1),--Identity � semelhante a um auto increment e primary key � chave prim�ria
	nomeProduto VARCHAR(50) NOT NULL, -- Obrigat�rio
	vlProduto DECIMAL(6,2) NOT NULL
);
--Inser��es em tb_Produtos
INSERT INTO tb_Produtos VALUES('suco de laranja', 4.5);
--Outra forma
INSERT IntO tb_Produtos (v1Produto,nomeProduto) VALUES(1.5,'suco de manga');

CREATE TABLE tb_Clientes (

	cd_Cliente INT PRIMARY KEY IDENTITY(1,1)	
	nomeCliente VARCHAR(50) NOT NULL,
	dtNascimento DATE,
	inSexo VARCHAR(1) NOT NULL,
	nomeEndereco VARCHAR(50),
	nomeCidade VARCHAR(50),
	nomeEstado VARCHAR(30),
	nmTelefone1 VARCHAR(15),
	nmTelefone2 VARCHAR(15)
);

CREATE TABLE  tb_Vendas(
	cd_Venda INT PRIMARY KEY IDENTITY(1,1),
	cd_Produto INT NOT NULL,
	vlProduto DECIMAL(6,2));

--Adi��o de uma regra ou constraint para q se possa adicionar um dado sem ficar incoerente com outra tabela
--atrav�s da foreign key

ALTER TABLE tb_Vendas
ADD CONSTRAINT FK_Produto_Venda
FOREIGN KEY cd_Produto
REFERENCES tb_Produto(cd_Produto);
--Testando a regra
INSERT INTO tb_Vendas VALUES(5,3.2);--N roda, pois n existe
INSERT INTO tb_Vendas VALUES(2,6);--Precisa ser um valor q exista na coluna cod_prod

drop table tb_Vendas;--Apagando a tabela tb_Vendas;
--� necess�rio recriar a tabela vendas com os dados c�digo de venda,cliente e valor total.Ap�s isso
--deve-se criar outra tabela produto-vendas que relacionem os dados de produto com os de venda
--da seguitne forma: criar atributos de c�digo_produto_venda,c�digo do produto, quantidade
create table tb_Vendas(
	cdVenda int Primary KEY IDENTITY(1,1),
	cd_Cliente int NOT NULL FOREIGN KEY REFERENCES tb_Clientes(cd_Cliente),
	dtVenda DATETIME NOT NULL
	);
create table tb_ProdutoVenda(
	cdProdutoVenda int Primary Key IDENTITY(1,1),
	cdVenda int FOREIGN KEY REFERENCES tb_Vendas(cdVenda) NOT NULL,
	cd_Produto int FOREIGN KEY REFERENCES tb_Produtos(cd_Produto) NOT NULL,
	qtProduto int NOT NULL 
);
--INSERT INTO tb_ProdutoVenda VALUES(1,1,3);--n d� certo pois preciso de dados de vendas na pr�pria tabela
SELECT * FROM tb_Vendas;--N�o tem nada como dito acima
SELECT * FROM tb_Clientes;--Tb n tem clientes por isso precisamos cria-lo antes de tudo
SELECt * FROM tb_ProdutoVenda;

--INSERT INTO tb_Clientes VALUES('Paula Suina','1980-05-01','M','Rua dos tabarindos, 400','Campinas','S�o Paulo','1123918420','11992800234');

--Agora um insert da venda
--INSERT INTO tb_Vendas VALUES(1,GETDATE());--GETDATE pega a data e hora atual
--Agora um insert dentro da tabela tb_produtoVenda
--INSERT INTO tb_ProdutoVenda VALUES(1,1,3);--Agora funciona





