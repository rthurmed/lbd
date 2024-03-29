-- Com base na estrutura criada em sala de aula do esquema EmpresaProjeto, realizar:
-- 1. Criar um procedimento que receba como parâmetro o nome do empregado e 
--    informar na tela o nome do departamento.
CREATE OR REPLACE PROCEDURE qual_dep (
    nome IN Empregado.nome%type
) AS
    dep Departamento.nome%type;
BEGIN
    SELECT d.nome 
    INTO dep 
    FROM Empregado e
    INNER JOIN Departamento d ON d.id_departamento = e.departamento_id
    WHERE e.nome = nome;
    dbms_output.put_line('Departamento: ' || dep);
END;

DECLARE
    nome = Empregado.nome%type;
BEGIN
    nome := :nome;
    qual_dep(nome);
END

-- 2. Criar um procedimento que recebe como parâmetro o nome de um projeto e o 
--    nome de um cliente e informar se aquele projeto é desse cliente ou não
CREATE OR REPLACE PROCEDURE projeto_pertence (
    proj IN Projeto.nome%type,
    clie IN Cliente.nome%type
) AS
    qtd NUMBER;
BEGIN
    SELECT count(pc.id_projeto_cliente)
    INTO qtd
    FROM Projeto p
    INNER JOIN Projeto_Cliente pc ON p.id_projeto = pc.projeto_id
    INNER JOIN Cliente c ON pc.cliente_id = c.id_cliente
    WHERE p.nome = proj AND c.nome = clie;
    IF qtd > 0 THEN
        dbms_output.put_line(proj || ' pertence ao cliente ' || clie);
    ELSE
        dbms_output.put_line(proj || ' não pertence ao cliente ' || clie);
    END IF;
END;

BEGIN
    projeto_pertence('OJT', 'Pascal');
END;

-- 3. Criar um procedimento que recebe como parâmetro o nome de funcionário e 
--    retornar como parâmetro de saída o nome do gerente desse funcionário. No
--    bloco anônimo informar a seguinte mensagem: O funcionário NOME tem como 
--    gerente o NOMEGERENTE
CREATE OR REPLACE PROCEDURE gerente_dele(
    nomeemp IN Empregado.nome%type,
    gerente OUT Empregado.nome%type
) AS
BEGIN
    SELECT e.nome
    INTO gerente
    FROM Empregado e
    INNER JOIN Gerencia g ON e.id_empregado = g.empregado_id
    -- Quando data_fim é nulo significa que é o gerente atual
    WHERE g.data_fim IS NULL AND g.departamento_id = (
        SELECT e.departamento_id
        FROM Empregado e
        WHERE e.nome = nomeemp);
END;

DECLARE
    emp Empregado.nome%type;
    ger Empregado.nome%type;
BEGIN
    emp := :emp;
    gerente_dele(emp, ger);
    dbms_output.put_line('O funcionário ' || emp || ' tem como gerente o ' || ger);
END;

-- 4. Criar um procedimento que receba como parâmetro o nome do departamento e 
--    imprimir em tela o nome de todos os funcionários vinculados aquele 
--    departamento. Imprimir de acordo com exemplo abaixo: 
--
--    O departamento nome_departamento apresenta os seguintes funcionários: 
--    Nome funcionário 1
--    Nome funcionário 2
--    ....
CREATE OR REPLACE PROCEDURE funcs_dep(
    nomedep Departamento.nome%type
) AS
BEGIN
    dbms_output.put_line('O departamento ' || nomedep || ' apresenta os seguintes funcionários:');
    FOR funcionario IN (
        SELECT e.nome FROM Empregado e
        INNER JOIN Departamento d ON d.id_departamento = e.departamento_id
        WHERE d.nome = nomedep
    ) LOOP
        dbms_output.put_line(funcionario.nome);
    END LOOP;
END;

BEGIN
    funcs_dep('Unidade de desenvolvimento de sistemas');
END

-- 5. Criar um procedimento que recebe como parâmetro o nome de um projeto e 
--    imprima na tela o nome de todos os funcionários desse projeto. 
--
--    O projeto NOME apresenta os seguintes funcionários
--    NOME FUNCIONÁRIO 1
--    NOME FUNCIONÁRIO 2
--    ...
CREATE OR REPLACE PROCEDURE funcs_proj(
    nomeproj Projeto.nome%type
) AS
BEGIN
    dbms_output.put_line('O projeto ' || nomeproj || ' apresenta os seguintes funcionários:');
    FOR funcionario IN (
        SELECT e.nome FROM Empregado e
        INNER JOIN Trabalhano t ON e.id_empregado = t.empregado_id
        INNER JOIN Projeto p ON t.projeto_id = p.id_projeto
        WHERE p.nome = nomeproj
    ) LOOP
        dbms_output.put_line(funcionario.nome);
    END LOOP;
END;

BEGIN
    funcs_proj('OJT');
END;