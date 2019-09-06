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
--    NOME FUNCIONÁRIO 1 – HORAS TRABALHADA NO PROJETO
--    NOME FUNCIONÁRIO 2 – HORAS TRABALHANDA NO PROJETO
--    ...

-- 3. Criar um procedimento que imprima na tela a seguinte tela:
-- 
-- NOME PROJETO 1 – DATA DE INÍCIO – NOME CLIENTE
-- Apresenta os seguintes funcionários:
-- NOME FUNCIONÁRIO 1 – HORAS TRABALHADAS
-- NOME FUNCIONÁRIO 2 – HORAS TRABALHADAS
-- ....
-- NOME PROJETO 2 – DATA DE INÍCIO – NOME CLIENTE
-- Apresenta os seguintes funcionários:
-- NOME FUNCIONÁRIO 1 – HORAS TRABALHADAS
-- NOME FUNCIONÁRIO 2 – HORAS TRABALHADAS
-- ....

