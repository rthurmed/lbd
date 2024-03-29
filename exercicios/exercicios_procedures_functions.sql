-- Com base na estrutura criada em sala de aula do esquema EmpresaProjeto, realizar:

-- 1. Faça um procedimento que recebe como parâmetro de entrada o nome de um 
--    projeto, e retorne como parâmetro de saída o nome do cliente e a 
--    quantidade total de horas do projeto. Imprimir no bloco anônimo a 
--    mensagem:
-- 
--    O projeto X (nome) pertence ao cliente Y (nome) e tem um total de XX horas

CREATE OR REPLACE PROCEDURE projeto_dados(
    nomeproj IN Projeto.nome%type,
    clientenome OUT Cliente.nome%type,
    totalhoras OUT NUMBER
) AS
BEGIN
    SELECT c.nome, sum(t.horas)
    INTO clientenome, totalhoras
    FROM Projeto p
    INNER JOIN Projeto_Cliente pc ON p.id_projeto = pc.projeto_id
    INNER JOIN Cliente c ON pc.cliente_id = c.id_cliente
    INNER JOIN Trabalhano t ON p.id_projeto = t.projeto_id
    WHERE p.nome = nomeproj
    GROUP BY c.nome;
END;

DECLARE
    nproj Projeto.nome%type;
    cnome Cliente.nome%type;
    thoras NUMBER;
BEGIN
    nproj := :nproj;
    projeto_dados(nproj, cnome, thoras);
    dbms_output.put_line('O projeto ' || nproj || ' pertence ao cliente ' 
        || cnome || ' e tem um total de ' || thoras || ' horas');
END;

-- 2. Faça um procedimento que imprima na tela o seguinte relatório:
-- 
--    O cliente X (nome) apresenta os seguintes projetos:
--    Nome Projeto 1 - total de horas
--    Nome Projeto 2 - total de horas
--    ....
--    O cliente Y (nome) apresenta os seguintes projetos:
--    Nome Projeto 1 - total de horas
--    Nome Projeto 2 - total de horas
--    ....
-- 
--    Para mostrar o total de horas do projeto usar uma função

CREATE OR REPLACE FUNCTION get_horas_do_projeto(
    nomeproj IN Projeto.nome%type
) 
RETURN NUMBER AS
    total NUMBER;
BEGIN
    SELECT sum(t.horas)
    INTO total
    FROM Projeto p
    INNER JOIN Trabalhano t ON p.id_projeto = t.projeto_id 
    WHERE p.nome = nomeproj;
    RETURN total;
END;

CREATE OR REPLACE PROCEDURE relatorio_projetos_de_clientes AS
BEGIN
    FOR clie IN (SELECT id_cliente, nome FROM Cliente) LOOP
        dbms_output.put_line('O cliente ' || clie.nome || ' apresenta os seguintes projetos:');
        FOR proj IN (
            SELECT p.nome
            FROM Projeto p
            INNER JOIN Projeto_Cliente pc ON p.id_projeto = pc.projeto_id
            WHERE pc.cliente_id = clie.id_cliente
        ) LOOP
            dbms_output.put_line(proj.nome || ' - ' || get_horas_do_projeto(proj.nome));
        END LOOP;
        dbms_output.put_line('');
    END LOOP;
END;

BEGIN
    relatorio_projetos_de_clientes();
END;

-- 3. Faça uma função que receba como parâmetro o nome do funcionário e retorne
--    o total de dependentes desse funcionário. O retorno da função deve ser 
--    apresentada no bloco anônimo.

CREATE OR REPLACE FUNCTION get_total_dependentes (
    nomefunc IN Empregado.nome%type
) 
RETURN NUMBER AS
    total NUMBER;
BEGIN
    SELECT count(d.nome)
    INTO total
    FROM Dependente d
    INNER JOIN Empregado e ON d.empregado_id = e.id_empregado
    WHERE e.nome = nomefunc;
    RETURN total;
END;

DECLARE
    nome Empregado.nome%type;
    dependentes NUMBER;
BEGIN
    nome := :nome;
    dependentes := get_total_dependentes(nome);
    dbms_output.put_line('O funcionário ' || nome || ' tem ' || dependentes 
        || ' dependentes');
END;

-- 4. Faça um procedimento que imprima na tela o seguinte relatório.
-- 
--    O funcionário X (nome) tem o total de Y dependentes (usar a função criada anteriormente)
--    Nome dependente 1
--    Nome dependente 2
--    ....
--    O funcionário Y (nome) tem o total de Y dependentes (usar a função criada anteriormente)
--    Nome dependente 1
--    Nome dependente 2....
-- 
--    Caso o funcionário não tenha dependentes (ou seja 0) não deve informar os 
--    nomes dos dependentes.

CREATE OR REPLACE PROCEDURE relatorio_func_dependentes AS
BEGIN
    FOR funcionario IN (SELECT nome, id_empregado FROM Empregado) LOOP
        dbms_output.put_line('O funcionário ' || funcionario.nome 
            || ' tem o total de ' || get_total_dependentes(funcionario.nome) 
            || ' dependentes');
        FOR depen IN (
            SELECT nome FROM Dependente
            WHERE empregado_id = funcionario.id_empregado
        ) LOOP
            dbms_output.put_line(depen.nome);
        END LOOP;
        dbms_output.put_line('');
    END LOOP;
END;

BEGIN
    relatorio_func_dependentes();
END;

-- 5. Faça um procedimento que imprima a seguinte tela:
-- 
--    Os seguintes projetos foram finalizados após a data prevista de fim:
--    Nome projeto 1 - data de início - data de fim prevista - data real final
--    Nome projeto 2 - data de início - data de fim prevista - data real final
--    ...

-- Coloca um fim depois da data de previsao
UPDATE Projeto
SET data_fim = '10-05-1989'
WHERE id_projeto = 2

CREATE OR REPLACE PROCEDURE projetos_com_atraso AS
BEGIN
    dbms_output.put_line('Os seguintes projetos foram finalizados após a data prevista de fim:');
    FOR proj IN (
        SELECT nome, data_inicio, data_fim, data_previsao_fim
        FROM Projeto
        WHERE data_fim > data_previsao_fim
    ) LOOP
        dbms_output.put_line(proj.nome || ' - ' || proj.data_inicio || ' - ' || proj.data_previsao_fim || ' - ' || proj.data_fim);
    END LOOP;
END;

BEGIN
    projetos_com_atraso();
END;

-- 6. Faça uma função que retorno o número total de projetos que foram 
--    encerrados dentro do prazo. No bloco anônimo imprimir a informação.
UPDATE Projeto
SET data_previsao_fim = '15-DEC-2001', data_fim = '01-DEC-2001'
WHERE id_projeto = 5

CREATE OR REPLACE FUNCTION qtd_projetos_no_prazo 
RETURN NUMBER AS
    total NUMBER;
BEGIN
    SELECT count(p.id_projeto)
    INTO total
    FROM Projeto p
    WHERE p.data_fim < p.data_previsao_fim;
    return total;
END;

BEGIN
    dbms_output.put_line('Quantidade de projeto encerrados dentro do prazo: ' || qtd_projetos_no_prazo());
END;

-- 7. Faça um procedimento que recebe como parâmetro o nome de um departamento 
--    e imprima na tela o nome de todos os funcionários que já foram gerentes 
--    daquele departamento. Caso o departamento não tenha ou nunca teve um 
--    gerente, imprimir a mensagem: Departamento sem gerente.
CREATE OR REPLACE PROCEDURE relatorio_gerente_de(
    depnome IN Departamento.nome%type
) AS
    qtd_gerentes NUMBER;
BEGIN
    SELECT count(g.id_gerencia)
    INTO qtd_gerentes
    FROM Departamento d
    INNER JOIN Gerencia g ON d.id_departamento = g.departamento_id
    WHERE d.nome = depnome;
    IF qtd_gerentes < 1 THEN
        dbms_output.put_line('Departamento sem gerente');
    ELSE 
        dbms_output.put_line('Gerentes:');
        FOR gerente IN (
            SELECT e.nome FROM Departamento d
            INNER JOIN Gerencia g ON d.id_departamento = g.departamento_id
            INNER JOIN Empregado e ON g.empregado_id = e.id_empregado
            WHERE d.nome = depnome
        ) LOOP
            dbms_output.put_line(gerente.nome);
        END LOOP;
    END IF;
END;

DECLARE
    dep Departamento.nome%type;
BEGIN
    dep := :dep;
    dbms_output.put_line('Relatório funcionários que já foram gerentes de ' || dep);
    relatorio_gerente_de(dep);
END;