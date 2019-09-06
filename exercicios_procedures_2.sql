-- Com base na estrutura criada em sala de aula do esquema EmpresaProjeto, realizar:
-- 1. Criar um procedimento que recebe como parâmetro o nome de um projeto e 
--    imprima na tela o nome de todos os funcionários desse projeto. 
--
--    O projeto NOME, data de início, do departamento X (nome departamento) apresenta os seguintes funcionários:
--    NOME FUNCIONÁRIO 1 - HORAS TRABALHADAS - NOME DEPARTAMENTO DO FUNCIONÁRIO
--    NOME FUNCIONÁRIO 2 - HORAS TRABALHADAS - NOME DEPARTAMENTO DO FUNCIONÁRIO
--    ...

CREATE OR REPLACE PROCEDURE relatorio_funcs_proj(
    nomeproj IN Projeto.nome%type
) AS
    inicio DATE;
    departamento VARCHAR2(255);
BEGIN
    SELECT p.data_inicio, d.nome 
    INTO inicio, departamento
    FROM Projeto p 
    INNER JOIN Departamento d ON p.departamento_id = d.id_departamento
    WHERE p.nome = nomeproj;
    dbms_output.put_line('O projeto ' || nomeproj || ', ' || inicio || 
        ', do departamento ' || departamento || 
        ' apresenta os seguintes funcionários:');
    FOR funcionario IN (
        SELECT e.nome, sum(t.horas) as horas, d.nome AS departamento 
        FROM Empregado e
        INNER JOIN Trabalhano t ON e.id_empregado = t.empregado_id
        INNER JOIN Projeto p ON t.projeto_id = p.id_projeto
        INNER JOIN Departamento d ON e.departamento_id = d.id_departamento
        WHERE p.nome = nomeproj
        GROUP BY e.nome, d.nome
    ) LOOP
        dbms_output.put_line(
            funcionario.nome || ' - ' || 
            funcionario.horas || 'h - ' || 
            funcionario.departamento);
    END LOOP;
END;

BEGIN
    relatorio_funcs_proj('OJT');
END;

-- 2. Criar um procedimento que apresente o seguinte relatório:
--
--    Projetos que estão em aberto:
--    NOME PROJETO 1 - DATA DE INÍCIO - NOME CLIENTE
--    NOME PROJETO 2 - DATA DE INÍCIO - NOME CLIENTE
--
--    Projetos que já estão encerrados:
--    NOME PROJETO 1 - DATA DE INÍCIO - DATA FIM - NOME CLIENTE
--    NOME PROJETO 2 - DATA DE INÍCIO - DATA FIM - NOME CLIENTE