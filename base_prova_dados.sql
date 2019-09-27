INSERT INTO Cliente (codc, nome, renda, endereco, cidade) VALUES (1, 'Clarice Costa', 9200, 'Fazenda Souza, 58', 'Alves dos Dourados')
INSERT INTO Cliente (codc, nome, renda, endereco, cidade) VALUES (2, 'Eduardo Viana', 4000, 'Vereda de Mendes, 89', 'Freitas')
INSERT INTO Cliente (codc, nome, renda, endereco, cidade) VALUES (3, 'Sabrina Souza', 1020, 'Estação Barbosa, 522', 'Fernandes')

INSERT INTO Produto (cod_prod, nome, descricao, preco) VALUES (1, 'Mesa', 'descricao de mesa', 320)
INSERT INTO Produto (cod_prod, nome, descricao, preco) VALUES (2, 'Cadeira', 'descricao de cadeira', 520)
INSERT INTO Produto (cod_prod, nome, descricao, preco) VALUES (3, 'Toalha', 'descricao de toalha', 1220)

INSERT INTO NotaFiscal (cod_nota, data, valor, codc) VALUES (1, '11-NOV-2001', 1000, 1)
INSERT INTO NotaFiscal (cod_nota, data, valor, codc) VALUES (2, '09-DEC-2012', 2123, 2)
INSERT INTO NotaFiscal (cod_nota, data, valor, codc) VALUES (3, '13-OCT-2017', 2313, 3)
INSERT INTO NotaFiscal (cod_nota, data, valor, codc) VALUES (4, '01-AUG-2009', 3131, 1)

INSERT INTO Nota_Prod (cod_nota, cod_prod, quantidade) VALUES (1, 1, 2)
INSERT INTO Nota_Prod (cod_nota, cod_prod, quantidade) VALUES (1, 2, 3)
INSERT INTO Nota_Prod (cod_nota, cod_prod, quantidade) VALUES (1, 3, 1)
INSERT INTO Nota_Prod (cod_nota, cod_prod, quantidade) VALUES (2, 1, 4)
INSERT INTO Nota_Prod (cod_nota, cod_prod, quantidade) VALUES (2, 2, 25)
INSERT INTO Nota_Prod (cod_nota, cod_prod, quantidade) VALUES (3, 1, 10)
INSERT INTO Nota_Prod (cod_nota, cod_prod, quantidade) VALUES (4, 3, 40)

INSERT INTO Financeira (cod_fin, nome, endereco, txjuros) VALUES (1, 'Almeida Correia - ME', 'Aeroporto Brenda Correia, 68', 0.5)
INSERT INTO Financeira (cod_fin, nome, endereco, txjuros) VALUES (2, 'Lima e Filhos', 'Praça de Rocha, 56', 0.4)
INSERT INTO Financeira (cod_fin, nome, endereco, txjuros) VALUES (3, 'Fogaça Vieira S.A.', 'Campo Jesus, 432', 0.34)

INSERT INTO Financiam (cod_nota, cod_fin, numparc, data, valor) VALUES (1, 1, 15, '01-NOV-2001', 1231)
INSERT INTO Financiam (cod_nota, cod_fin, numparc, data, valor) VALUES (2, 2, 20, '07-DEC-2012', 1451)
INSERT INTO Financiam (cod_nota, cod_fin, numparc, data, valor) VALUES (3, 2, 13, '03-OCT-2017', 1561)
INSERT INTO Financiam (cod_nota, cod_fin, numparc, data, valor) VALUES (4, 3, 60, '30-JUL-2009', 1548)