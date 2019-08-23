-- @author brunorosapohren

-- INSERT INTO () VALUES();

CREATE SEQUENCE _sequencia_empresa;

--------------------
CREATE SEQUENCE departamento_sequencia_empresa;

-- INSERT INTO Departamento(id_departamento,nome,cidade) VALUES(departamento_sequencia_empresa.nextval,'','');

INSERT INTO Departamento(id_departamento,nome,cidade) VALUES(departamento_sequencia_empresa.nextval,'Unidade de apoio ao usuário','Porto Alegre');
INSERT INTO Departamento(id_departamento,nome,cidade) VALUES(departamento_sequencia_empresa.nextval,'Unidade de planejamento','Canoas');
INSERT INTO Departamento(id_departamento,nome,cidade) VALUES(departamento_sequencia_empresa.nextval,'Unidade de equipamentos','Porto Alegre');
INSERT INTO Departamento(id_departamento,nome,cidade) VALUES(departamento_sequencia_empresa.nextval,'Unidade de desenvolvimento de sistemas','Guaíba');


--------------------
CREATE SEQUENCE empregado_sequencia_empresa;
-- INSERT INTO Empregado(id_empregado,nome,data_nasc,end,sexo,salario,data_admissao,departamento_id) VALUES(empregado_sequencia_empresa.nextval,'','','',,'',);

INSERT INTO Empregado(id_empregado,nome,data_nasc,end,sexo,salario,data_admissao,departamento_id) VALUES(empregado_sequencia_empresa.nextval,'Nicolas Eymael','11-03-1998','Rua Guaíba','Masculino','1200','15-09-2018',1);
INSERT INTO Empregado(id_empregado,nome,data_nasc,end,sexo,salario,data_admissao,departamento_id) VALUES(empregado_sequencia_empresa.nextval,'Wagner Alves','24-07-1992','Rua Canoas','Masculino','1201','20-06-2019',2);
INSERT INTO Empregado(id_empregado,nome,data_nasc,end,sexo,salario,data_admissao,departamento_id) VALUES(empregado_sequencia_empresa.nextval,'Gabriel Brittes','06-12-2000','Rua Espera','Masculino','1250','19-02-2017',3);
INSERT INTO Empregado(id_empregado,nome,data_nasc,end,sexo,salario,data_admissao,departamento_id) VALUES(empregado_sequencia_empresa.nextval,'Pessoa teste','28-02-1976','Rua Algum Lugar','Feminino','3400','02-08-2008',4);
INSERT INTO Empregado(id_empregado,nome,data_nasc,end,sexo,salario,data_admissao,departamento_id) VALUES(empregado_sequencia_empresa.nextval,'Qualquer um','28-02-1985','Rua do qualquer lugar','Feminino','3400','02-08-2008',4);

--------------------
CREATE SEQUENCE gerencia_sequencia_empresa;
-- INSERT INTO Gerencia(id_gerencia,data_inicio,data_fim,empregado_id,departamento_id) VALUES(gerencia_sequencia_empresa.nextval,'','',,);

INSERT INTO Gerencia(id_gerencia,data_inicio,data_fim,empregado_id,departamento_id) VALUES(gerencia_sequencia_empresa.nextval,'01-01-2001','',1,1);
INSERT INTO Gerencia(id_gerencia,data_inicio,data_fim,empregado_id,departamento_id) VALUES(gerencia_sequencia_empresa.nextval,'01-01-2001','',2,2);
INSERT INTO Gerencia(id_gerencia,data_inicio,data_fim,empregado_id,departamento_id) VALUES(gerencia_sequencia_empresa.nextval,'01-01-1991','24-12-2005',4,4);
INSERT INTO Gerencia(id_gerencia,data_inicio,data_fim,empregado_id,departamento_id) VALUES(gerencia_sequencia_empresa.nextval,'01-01-2006','',5,4);

--------------------
CREATE SEQUENCE dependente_sequencia_empresa;
-- INSERT INTO Dependente(id_dependente,nome,sexo,data_nasc,parentesco,empregado_id) VALUES(dependente_sequencia_empresa.nextval,'','','','',);

INSERT INTO Dependente(id_dependente,nome,sexo,data_nasc,parentesco,empregado_id) VALUES(dependente_sequencia_empresa.nextval,'Roberto Ribos','Masculino','06-05-2006','Pai',4);
INSERT INTO Dependente(id_dependente,nome,sexo,data_nasc,parentesco,empregado_id) VALUES(dependente_sequencia_empresa.nextval,'Alberta Lide','Feminino','11-09-2002','Filha',5);
INSERT INTO Dependente(id_dependente,nome,sexo,data_nasc,parentesco,empregado_id) VALUES(dependente_sequencia_empresa.nextval,'Conexão remota','Feminino','19-10-2010','Sobrinha',5);
INSERT INTO Dependente(id_dependente,nome,sexo,data_nasc,parentesco,empregado_id) VALUES(dependente_sequencia_empresa.nextval,'150 cilindradas','Masculino','10-06-2018','Filho',1);

--------------------
CREATE SEQUENCE cliente_sequencia_empresa;
-- INSERT INTO Cliente(id_cliente,nome,endereco,cnpj,telefone,nome_funcionario) VALUES(cliente_sequencia_empresa.nextval,'','',,,'');

INSERT INTO Cliente(id_cliente,nome,endereco,cnpj,telefone,nome_funcionario) VALUES(cliente_sequencia_empresa.nextval,'Pascal','Avenida Computacional',11111,11,'Adrobaldo Silveira');
INSERT INTO Cliente(id_cliente,nome,endereco,cnpj,telefone,nome_funcionario) VALUES(cliente_sequencia_empresa.nextval,'Xing Xon','Não entendi, repete',22222,22,'Jurilson de Almeida');
INSERT INTO Cliente(id_cliente,nome,endereco,cnpj,telefone,nome_funcionario) VALUES(cliente_sequencia_empresa.nextval,'Leonardo Da Vinte','Itália',33333,33,'Ricardo Almeida');
INSERT INTO Cliente(id_cliente,nome,endereco,cnpj,telefone,nome_funcionario) VALUES(cliente_sequencia_empresa.nextval,'IOI','Rua Jogador número um',44444,44,'Dom sem muro');

--------------------
CREATE SEQUENCE projeto_sequencia_empresa;
-- INSERT INTO Projeto(id_projeto,nome,data_inicio,data_previsao_fim,data_fim,departamento_id,gerente_id) VALUES(projeto_sequencia_empresa.nextval,'','','','',,);

INSERT INTO Projeto(id_projeto,nome,data_inicio,data_previsao_fim,data_fim,departamento_id,gerente_id) VALUES(projeto_sequencia_empresa.nextval,'OJT','03-04-2017','10-11-2017','18-11-2017',4,4);
INSERT INTO Projeto(id_projeto,nome,data_inicio,data_previsao_fim,data_fim,departamento_id,gerente_id) VALUES(projeto_sequencia_empresa.nextval,'Corrida armamentista','15-03-1946','10-05-1988','',2,2);
INSERT INTO Projeto(id_projeto,nome,data_inicio,data_previsao_fim,data_fim,departamento_id,gerente_id) VALUES(projeto_sequencia_empresa.nextval,'Antes nunca do que tarde','09-08-2019','','09-08-2019',1,3);
INSERT INTO Projeto(id_projeto,nome,data_inicio,data_previsao_fim,data_fim,departamento_id,gerente_id) VALUES(projeto_sequencia_empresa.nextval,'Final de semana','29-07-1984','','',2,4);

-- linha extra adicionada em 2019-08-23
INSERT INTO Projeto(id_projeto,nome,data_inicio,data_previsao_fim,data_fim,departamento_id,gerente_id) VALUES(projeto_sequencia_empresa.nextval,'Outro projeto','15-08-2001','','',1,4);

--------------------
-- NÃO PRECISA DE SEQUÊNCIA
-- INSERT INTO Trabalhano(projeto_id,empregado_id,horas) VALUES(,,);

INSERT INTO Trabalhano(projeto_id,empregado_id,horas) VALUES(1,5,50);
INSERT INTO Trabalhano(projeto_id,empregado_id,horas) VALUES(2,2,26);
INSERT INTO Trabalhano(projeto_id,empregado_id,horas) VALUES(1,4,1);
INSERT INTO Trabalhano(projeto_id,empregado_id,horas) VALUES(4,1,87);

-- linha extra adicionada em 2019-08-23
INSERT INTO Trabalhano(projeto_id,empregado_id,horas) VALUES(5,5,12);

--------------------
CREATE SEQUENCE projeto_cliente_sequencia;
-- INSERT INTO Projeto_Cliente(id_projeto_cliente,nome_responsavel,projeto_id,cliente_id) VALUES(projeto_cliente_sequencia.nextval,'',,);

INSERT INTO Projeto_Cliente(id_projeto_cliente,nome_responsavel,projeto_id,cliente_id) VALUES(projeto_cliente_sequencia.nextval,'Big Boss',1,1);
INSERT INTO Projeto_Cliente(id_projeto_cliente,nome_responsavel,projeto_id,cliente_id) VALUES(projeto_cliente_sequencia.nextval,'Tedi Turen',2,2);
INSERT INTO Projeto_Cliente(id_projeto_cliente,nome_responsavel,projeto_id,cliente_id) VALUES(projeto_cliente_sequencia.nextval,'O Coordenador',3,3);
INSERT INTO Projeto_Cliente(id_projeto_cliente,nome_responsavel,projeto_id,cliente_id) VALUES(projeto_cliente_sequencia.nextval,'Responsável',4,4);

-- linha extra adicionada em 2019-08-23
INSERT INTO Projeto_Cliente(id_projeto_cliente,nome_responsavel,projeto_id,cliente_id) VALUES(projeto_cliente_sequencia.nextval,'Big Boss',5,1);
--------------------
---------------> já criei até aqui <------------------