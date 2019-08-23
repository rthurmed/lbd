/* Modelo dia 02-08-2019: */

CREATE TABLE Departamento (
    id_departamento NUMBER CONSTRAINT pkdepartamento PRIMARY KEY,
    nome VARCHAR2(255),
    cidade VARCHAR2(255)
);

CREATE TABLE Empregado (
    id_empregado NUMBER CONSTRAINT pkempregado PRIMARY KEY, 
    nome VARCHAR2(255),
    data_nasc DATE,
    end VARCHAR2(255),
    sexo VARCHAR2(255),
    salario NUMBER,
    data_admissao DATE,
    departamento_id NUMBER
);

CREATE TABLE Projeto (
    id_projeto NUMBER CONSTRAINT pkprojeto PRIMARY KEY,
    nome VARCHAR2(255),
    data_inicio DATE,
    data_previsao_fim DATE,
    data_fim DATE,
    departamento_id NUMBER,
    gerente_id NUMBER
);

CREATE TABLE Dependente (
    id_dependente NUMBER CONSTRAINT pkdependente PRIMARY KEY,
    nome VARCHAR2(255),
    sexo VARCHAR2(255),
    data_nasc DATE,
    parentesco VARCHAR2(255),
    empregado_id NUMBER
);

CREATE TABLE Gerencia (
    id_gerencia NUMBER CONSTRAINT pkgerencia PRIMARY KEY,
    data_inicio DATE,
    data_fim DATE,
    empregado_id NUMBER,
    departamento_id NUMBER
);

CREATE TABLE Cliente (
    id_cliente int PRIMARY KEY,
    nome VARCHAR2(255),
    endereco VARCHAR2(255),
    cnpj NUMBER,
    telefone NUMBER,
    nome_funcionario VARCHAR2(255)
);

CREATE TABLE Trabalhano (
    projeto_id NUMBER,
    empregado_id NUMBER,
    horas NUMBER,
    CONSTRAINT pktrabalhano PRIMARY KEY (projeto_id, empregado_id)
);

CREATE TABLE Projeto_Cliente (
    id_projeto_cliente NUMBER CONSTRAINT pkprojetocliente PRIMARY KEY,
    nome_responsavel VARCHAR2(255),
    projeto_id NUMBER,
    cliente_id NUMBER
);
 
ALTER TABLE Empregado ADD CONSTRAINT fk_emp_dep
    FOREIGN KEY (departamento_id)
    REFERENCES Departamento (id_departamento);

ALTER TABLE Projeto ADD CONSTRAINT fk_projeto_departamento
    FOREIGN KEY (departamento_id)
    REFERENCES Departamento (id_departamento);

ALTER TABLE Projeto ADD CONSTRAINT fk_projeto_gerente
    FOREIGN KEY (gerente_id)
    REFERENCES Empregado (id_empregado);

ALTER TABLE Dependente ADD CONSTRAINT fk_dependente_empregado
    FOREIGN KEY (empregado_id)
    REFERENCES Empregado (id_empregado);

ALTER TABLE Gerencia ADD CONSTRAINT fk_gerencia_empregado
    FOREIGN KEY (empregado_id)
    REFERENCES Empregado (id_empregado);

ALTER TABLE Gerencia ADD CONSTRAINT fk_gerencia_departamento
    FOREIGN KEY (departamento_id)
    REFERENCES Departamento (id_departamento);

ALTER TABLE Trabalhano ADD CONSTRAINT fk_trabalhano_projeto
    FOREIGN KEY (projeto_id)
    REFERENCES Projeto (id_projeto);

ALTER TABLE Trabalhano ADD CONSTRAINT fk_trabalhano_empregado
    FOREIGN KEY (empregado_id)
    REFERENCES Empregado (id_empregado);

ALTER TABLE Projeto_Cliente ADD CONSTRAINT fk_projcli_projeto
    FOREIGN KEY (projeto_id)
    REFERENCES Projeto (id_projeto);

ALTER TABLE Projeto_Cliente ADD CONSTRAINT fk_projcli_cliente
    FOREIGN KEY (cliente_id)
    REFERENCES Cliente (id_cliente);