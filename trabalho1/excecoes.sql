-- Selecione 1 exemplo que faça uso de exceções pré-definidas e outro exemplo 
-- com exceções criados pelo usuário. Esses exemplos podem ser procedimentos ou 
-- funções. E poderão ser usados as respostas das listas de exercícios e/ou 
-- trabalhos.

-- PRÉ-DEFINIDAS

-- Quantidade de projetos de um empregado
DECLARE
    id Empregado.id_empregado%type;
    quantidade NUMBER;
    nome Empregado.nome%type;
BEGIN
    id := :id;
    SELECT e.nome, count(tn.projeto_id) 
    INTO nome, quantidade
    FROM Empregado e
    INNER JOIN Trabalhano tn ON e.id_empregado = tn.empregado_id
    WHERE e.id_empregado = id
    GROUP BY e.nome;
    dbms_output.put_line('Empregado ' || nome || ' trabalha em ' || quantidade || ' projetos');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Empregado não encontrado');
END;

-- CRIADAS

-- Mudar salário de um empregado
CREATE OR REPLACE PROCEDURE alterar_salario(
    emp_id IN Empregado.id_empregado%type,
    novo_salario IN Empregado.salario%type
) AS
    salario_atual NUMBER;
    novo_salario_menor EXCEPTION;
BEGIN
    SELECT salario
    INTO salario_atual 
    FROM Empregado
    WHERE id_empregado = emp_id;
    IF salario_atual > novo_salario THEN
        RAISE novo_salario_menor;
    ELSE
        UPDATE Empregado
        SET salario = novo_salario
        WHERE id_empregado = emp_id;
        dbms_output.put_line('Salario alterado de ' || salario_atual || ' para ' || novo_salario);
    END IF;
EXCEPTION
    WHEN novo_salario_menor THEN
        dbms_output.put_line('Não é possível diminuir o salário de um empregado.');
END;

DECLARE 
    id Empregado.id_empregado%type;
    novo_salario Empregado.salario%type;
BEGIN
    id := :id;
    novo_salario := :novo_salario;
    alterar_salario(id, novo_salario);
END;