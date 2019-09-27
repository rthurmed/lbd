-- Produto (cod_prod, nome, descricao, preco)

-- NotaFiscal(cod_nota, data, valor, codc)
-- 		Codc referencia cliente

-- Nota_Prod(cod_nota, cod_prod, quantidade)
-- 		Cod_nota referencia NotaFiscal
-- 		Cod_prod referencia Produto

-- Financeira(cod_fin, nome, endereco, txjuros)

-- Financiam(cod_nota, cod_fin, numparc, data, valor)
-- 		Cod_nota referencia Financiam
-- 		Cod_fin referencia Financeira

-- Cliente(codc, nome, renda, endereco, cidade)

CREATE TABLE Cliente (
	codc NUMBER CONSTRAINT pkcliente PRIMARY KEY, 
	nome VARCHAR2(255), 
	renda NUMBER(11,5), 
	endereco VARCHAR2(255), 
	cidade VARCHAR2(255)
)

CREATE TABLE Produto (
	cod_prod NUMBER CONSTRAINT pkproduto PRIMARY KEY, 
	nome VARCHAR2(255), 
	descricao VARCHAR2(255), 
	preco NUMBER(11,5)
)

CREATE TABLE NotaFiscal (
	cod_nota NUMBER CONSTRAINT pknotafiscal PRIMARY KEY, 
	data DATE, 
	valor NUMBER(11,5), 
	codc NUMBER
)

ALTER TABLE NotaFiscal ADD CONSTRAINT fknotafiscal_cliente FOREIGN KEY(codc) REFERENCES Cliente(codc)

CREATE TABLE Nota_Prod (
	cod_nota NUMBER, 
	cod_prod NUMBER, 
	quantidade NUMBER(11,5),
	CONSTRAINT pknota_prod PRIMARY KEY(cod_nota, cod_prod)
)

ALTER TABLE Nota_Prod ADD CONSTRAINT fknota_prod_notafiscal FOREIGN KEY(cod_nota) REFERENCES NotaFiscal(cod_nota)
ALTER TABLE Nota_Prod ADD CONSTRAINT fknota_prod_produto FOREIGN KEY(cod_prod) REFERENCES Produto(cod_prod)

CREATE TABLE Financeira (
	cod_fin NUMBER CONSTRAINT pkfinanceira PRIMARY KEY, 
	nome VARCHAR2(255), 
	endereco VARCHAR2(255), 
	txjuros NUMBER(11,5)
)

CREATE TABLE Financiam (
	cod_nota NUMBER, 
	cod_fin NUMBER, 
	numparc NUMBER, 
	data DATE, 
	valor NUMBER(11,5),
	CONSTRAINT pkfinanciam PRIMARY KEY(cod_nota, cod_fin)
)

ALTER TABLE Financiam ADD CONSTRAINT fkfinanciam_nota FOREIGN KEY(cod_nota) REFERENCES NotaFiscal(cod_nota)
ALTER TABLE Financiam ADD CONSTRAINT fkfinanciam_financeira FOREIGN KEY(cod_fin) REFERENCES Financeira(cod_fin)