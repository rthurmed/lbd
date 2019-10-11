-- Considerar que Cliente agora é Cliente_old
-- renomeei a tabela para não confundir com a da prova

-- 1. Considere o Modelo relacional TrabalhoNo  responder as questões a seguir: 

-- 1. Crie um procedimento que apresente os nomes dos projetos e os nomes dos 
--    empregados que trabalham em cada projeto, bem como a quantidade de horas 
--    trabalhadas. Apresente: 
--     ◦ <Fulano de Tal> trabalha no <Projeto XX> <TANTAS> horas.

CREATE OR REPLACE PROCEDURE relatorio_trabalhano
AS
BEGIN
    FOR r IN (
        SELECT e.nome as empregado, p.nome as projeto, sum(t.horas) as horas
        FROM Projeto p 
        INNER JOIN Trabalhano t ON t.projeto_id = p.id_projeto
        INNER JOIN Empregado e ON t.empregado_id = e.id_empregado
        GROUP BY p.nome, e.nome
    ) LOOP
        dbms_output.put_line(r.empregado || ' trabalha no ' || r.projeto || ' ' || r.horas || ' horas.');
    END LOOP;
END;

BEGIN
    relatorio_trabalhano();
END;

-- 2. Crie um procedimento que apresente o nome de cada um dos departamentos e, 
--    ao lado o nome de cada Gerente: 
--     ◦ <Departamento X>: <Gerente X>

CREATE OR REPLACE PROCEDURE gerentes_deps
AS 
BEGIN
    FOR gerente IN (
        SELECT d.nome as departamento, e.nome
        FROM Departamento d
        INNER JOIN Gerencia g ON d.id_departamento = g.departamento_id
        INNER JOIN Empregado e ON g.empregado_id = e.id_empregado
    ) LOOP
        dbms_output.put_line(gerente.departamento || ': ' || gerente.nome);
    END LOOP;
END;

BEGIN
    dbms_output.put_line('Gerentes de cada departamento: ');
    gerentes_deps();
END;

-- 3. Crie um procedimento que apresente a quantidade de projetos em que cada 
--    empregado trabalhou:
--     ◦ <Fulano de Tal> já trabalhou em <X> projetos. 
--     ◦ Caso o empregado não tenha trabalhado em nenhum projeto, informe: 
--         ▪ <Fulano de Tal> ainda não trabalhou em projetos

-- 4. Selecione 3 procedimentos criados anteriormente que utilizem laço e 
--    alterar para usar cursores. Pelo menos 1 deles deve utilizar dois (2) FOR.