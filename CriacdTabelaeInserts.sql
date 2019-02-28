/*Banco de dados de aulas de SQL
	Loja de Sucos do Jailson
	* Vende sucos (principalmente de Laranja)
	* Dados dos clientes:
		Nome (texto)
		nascimento (data dd/mm/aaaa)
		sexo (número)
		endereço
			Rua (texto)
			cidade (texto)
			Estado (texto)
		Telefones (texto)
	* Dados das vendas
		Número da venda (número) 
		cliente que comprou (texto)
		preço total (número)
	* Dados do produto
		Nome (texto)
		Preço (número)
*/



CREATE TABLE tb_Produtos (
	cd_Produto INT PRIMARY KEY IDENTITY(1,1),--Identity é semelhante a um auto increment e primary key é chave primária
	nomeProduto VARCHAR(50) NOT NULL, -- Obrigatório
	vlProduto DECIMAL(6,2) NOT NULL
);
--Inserções em tb_Produtos
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

--Adição de uma regra ou constraint para q se possa adicionar um dado sem ficar incoerente com outra tabela
--através da foreign key

ALTER TABLE tb_Vendas
ADD CONSTRAINT FK_Produto_Venda
FOREIGN KEY cd_Produto
REFERENCES tb_Produto(cd_Produto);
--Testando a regra
INSERT INTO tb_Vendas VALUES(5,3.2);--N roda, pois n existe
INSERT INTO tb_Vendas VALUES(2,6);--Precisa ser um valor q exista na coluna cod_prod




