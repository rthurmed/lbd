-- 1. Crie uma triggers que, após inserir uma tupla na tabela trabalhano, 
--    imprime a seguinte informação: 
--    O empregado de nome TAL está alocado ao projeto TAL em tantas HORAS. 

CREATE OR REPLACE TRIGGER imprime_trabalhano 
    AFTER INSERT ON Trabalhano
    FOR EACH ROW
DECLARE
    nomeemp Empregado.nome%type;
    nomeproj Projeto.nome%type;
BEGIN
    SELECT nome 
    INTO nomeemp 
    FROM Empregado
    WHERE id_empregado = :new.empregado_id;
    SELECT nome
    INTO nomeproj
    FROM Projeto
    WHERE id_projeto = :new.projeto_id;
    dbms_output.put_line('O empregado de nome ' || nomeemp || ' está alocado ao projeto ' || nomeproj || ' em ' || :new.horas || ' horas. ');
END;

INSERT INTO Trabalhano(projeto_id,empregado_id,horas) VALUES(4,3,60);

-- 2. Crie uma trigger que não permita a inserção de dependentes que não sejam 
--    filhos dos empregados. (FILHO ou FILHA). 

CREATE OR REPLACE TRIGGER somente_filhos
    BEFORE INSERT ON Dependente
    FOR EACH ROW
DECLARE
    nao_filho EXCEPTION;
BEGIN
    IF lower(:new.parentesco) != lower('FILHO') AND lower(:new.parentesco) != lower('FILHA') THEN
        RAISE nao_filho;
    END IF;
EXCEPTION
    WHEN nao_filho THEN
        RAISE_APPLICATION_ERROR(-20502, 'Só podem ser inseridos filhos');
END;

INSERT INTO Dependente(id_dependente,nome,sexo,data_nasc,parentesco,empregado_id) VALUES(dependente_sequencia_empresa.nextval,'Roberto Ribos','Masculino','06-JUL-2006','Pai',3);

-- 3. Crie uma trigger que não permita a inserção de empregados com idade menor
--    do que 16 anos. 

CREATE OR REPLACE TRIGGER idade_minima_emp
    BEFORE INSERT ON Empregado
    FOR EACH ROW
DECLARE
    pouca_idade EXCEPTION;
BEGIN
    IF :new.data_nasc > sysdate - 16*365.25 THEN
        RAISE pouca_idade;
    END IF;
EXCEPTION
    WHEN pouca_idade THEN
        RAISE_APPLICATION_ERROR(-20503, 'Empregados devem ter mais de 16 anos');
END;

INSERT INTO Empregado(id_empregado,nome,data_nasc,end,sexo,salario,data_admissao,departamento_id) VALUES(empregado_sequencia_empresa.nextval,'Vitor Xavier','28-FEB-2006','Rua do qualquer lugar','Masculino','3400','02-OCT-2008',4);

-- 4. Crie uma trigger que ao informar um funcionário para um projeto verificar
--    se ele já não está alocadomais de 200h em outros projetos. Caso ele
--    esteja já com mais de 200h deve informar mensagem que o funcionário não
--    pode ser alocado ao projeto X, caso contrário, ele poderá ser inserido.

-- 5. Crie um trigger que analise, no momento da atualização de dados na tabela
--    empregado, se o salário que está sendo atualizado é maior ou igual ao 
--    anteriormente inserido. Não permita atualização de salário para valor 
--    inferior.

-- 6. Crie uma tabela de LOG com as seguintes informações: data e descrição. 
--    Essa tabela receberá informações de todas as inserções e atualizações 
--    feitas na tabela ProjetoEmpregado. Portanto, crie um trigger que armazene
--    as informações na tabela LOG, com data de inserção/atualização e o que
--    foi inserido, por exemplo: 
--    Inserção na tabela ProjetoEmpregado, o empregado Nome empregado foi 
--    alocado ao projeto Nome projeto com XX horas, após operações feitas na 
--    tabela Venda.