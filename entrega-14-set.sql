-- # Exercícios para entregar – até dia 14/09
-- - Para a realização dos exercícios usar como base a estrutura EmpresaProjeto.
-- - Colocar o bloco anônimo utilizado.
-- - Dar print na tela com a saída e colocar o print no arquivo.
-- - Postar em tarefa específica do Moodle
-- - Peso 1,0
 
-- 1. Criar uma função que recebe como parâmetro o nome de um projeto e 
--    retornar o total de horas desse projeto, considerando os funcionários 
--    alocados ao projeto.

CREATE OR REPLACE FUNCTION proj_total_horas (
    nomeProjeto IN Projeto.nome%type
)
RETURN NUMBER AS
    total NUMBER;
BEGIN
    SELECT sum(t.horas)
    INTO total
    FROM Trabalhano t
    INNER JOIN Projeto p ON t.projeto_id = p.id_projeto
    WHERE p.nome = nomeProjeto;
    RETURN total;
END;

DECLARE
    nomeProj Projeto.nome%type;
BEGIN
    nomeProj := :nomeProj;
    dbms_output.put_line('O projeto ' || nomeProj || ' teve um total de ' 
        || proj_total_horas(nomeProj) || ' horas trabalhadas');
END;

-- 2. Criar um procedimento que recebe como parâmetro o nome de um projeto e 
--    imprima na tela:
-- 
--    O projeto X (nome projeto) apresentou o total de horas de: (usar a função do exercício 1 para mostrar o total de horas) e tem os seguintes funcionais alocados ao projeto:
--    NOME FUNCIONÁRIO 1 - HORAS TRABALHADA NO PROJETO
--    NOME FUNCIONÁRIO 2 - HORAS TRABALHANDA NO PROJETO
--    ...

CREATE OR REPLACE PROCEDURE relatorio_projeto_func (
    nomeProj Projeto.nome%type
) AS
BEGIN
    dbms_output.put_line('O projeto ' || nomeProj 
        || ' apresentou o total de horas de: ' || proj_total_horas(nomeProj) 
        || ' e tem os seguintes funcionais alocados ao projeto:');
    FOR funcionario IN (
        SELECT e.nome as nome, t.horas as horas
        FROM Empregado e
        INNER JOIN Trabalhano t ON e.id_empregado = t.empregado_id
        INNER JOIN Projeto p ON t.projeto_id = p.id_projeto
        WHERE p.nome = nomeProj
        GROUP BY e.nome
    ) LOOP
        dbms_output.put_line(funcionario.nome || ' - ' || funcionario.horas);
    END LOOP;
END;

BEGIN
    relatorio_projeto_func('OJT');
END;

-- 3. Criar um procedimento que imprima na tela a seguinte tela:
-- 
-- NOME PROJETO 1 - DATA DE INÍCIO - NOME CLIENTE
-- Apresenta os seguintes funcionários:
-- NOME FUNCIONÁRIO 1 - HORAS TRABALHADAS
-- NOME FUNCIONÁRIO 2 - HORAS TRABALHADAS
-- ....
-- NOME PROJETO 2 - DATA DE INÍCIO - NOME CLIENTE
-- Apresenta os seguintes funcionários:
-- NOME FUNCIONÁRIO 1 - HORAS TRABALHADAS
-- NOME FUNCIONÁRIO 2 - HORAS TRABALHADAS
-- ....

CREATE OR REPLACE PROCEDURE relatorio_projetos AS
BEGIN
    FOR proj IN (
        SELECT p.id_projeto as id, p.nome as nome, p.data_inicio as inicio, c.nome as cliente
        FROM Projeto p
        INNER JOIN Projeto_Cliente po ON p.id_projeto = po.projeto_id
        INNER JOIN Cliente c ON po.cliente_id = c.id_cliente
    ) LOOP
        dbms_output.put_line(
            proj.nome || ' - ' || 
            proj.inicio || ' - ' || 
            proj.cliente);
        dbms_output.put_line('Apresenta os seguintes funcionários:');
        FOR funcionario IN (
            SELECT e.nome as nome, t.horas as horas
            FROM Empregado e
            INNER JOIN Trabalhano t ON e.id_empregado = t.empregado_id
            WHERE t.projeto_id = proj.id
        ) LOOP
            dbms_output.put_line(funcionario.nome || ' - ' || funcionario.horas || 'h');
        END LOOP;
        dbms_output.put_line('');
    END LOOP;
END;

BEGIN
    relatorio_projetos();
END;
