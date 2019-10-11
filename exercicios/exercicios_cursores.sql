-- Considerar que Cliente agora é Cliente_old
-- renomeei a tabela para não confundir com a da prova

-- 1. Considere o Modelo relacional TrabalhoNo  responder as questões a seguir: 

-- 1. Crie um procedimento que apresente os nomes dos projetos e os nomes dos 
--    empregados que trabalham em cada projeto, bem como a quantidade de horas 
--    trabalhadas. Apresente: 
--     ◦ <Fulano de Tal> trabalha no <Projeto XX> <TANTAS> horas.

-- 2. Crie um procedimento que apresente o nome de cada um dos departamentos e, 
--    ao lado o nome de cada Gerente: 
--     ◦ <Departamento X>: <Gerente X>

-- 3. Crie um procedimento que apresente a quantidade de projetos em que cada 
--    empregado trabalhou:
--     ◦ <Fulano de Tal> já trabalhou em <X> projetos. 
--     ◦ Caso o empregado não tenha trabalhado em nenhum projeto, informe: 
--         ▪ <Fulano de Tal> ainda não trabalhou em projetos

-- 4. Selecione 3 procedimentos criados anteriormente que utilizem laço e 
--    alterar para usar cursores. Pelo menos 1 deles deve utilizar dois (2) FOR.