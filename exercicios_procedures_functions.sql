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
--    Nome Projeto 1 -total de horas
--    Nome Projeto 2 -total de horas
--    ....
-- 
--    Para mostrar o total de horas do projeto usar uma função

-- 3. Faça uma função que receba como parâmetro o nome do funcionário e retorne
--    o total de dependentes desse funcionário. O retorno da função deve ser 
--    apresentada no bloco anônimo.

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

-- 5. Faça um procedimento que imprima a seguinte tela:
-- 
--    Os seguintes projetos foram finalizados após a data prevista de fim:
--    Nome projeto 1 - data de início - data de fim prevista - data real final
--    Nome projeto 2 - data de início - data de fim prevista - data real final
--    ...

-- 6. Faça uma função que retorno o número total de projetos que foram 
-- encerrados dentro do prazo. No bloco anônimo imprimir a informação.

-- 7. Faça um procedimento que recebe como parâmetro o nome de um departamento 
--    e imprima na tela o nome de todos os funcionários que já foram gerentes 
--    daquele departamento. Caso o departamento não tenha ou nunca teve um 
--    gerente, imprimir a mensagem: Departamento sem gerente.