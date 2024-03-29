-- Com base na estrutura criada em sala de aula do esquema EmpresaProjeto, realizar:
-- Obs.: O retorno deve ser apresentado no bloco anônimo para todas as funções.
-- 1. Criar uma função que receba como parâmetro a matrícula de um funcionário 
--    e retornar o total de horas trabalhadas desse funcionário em todos os projetos. 

CREATE OR REPLACE FUNCTION func_horas (
    matricula IN Empregado.id_empregado%type
) 
RETURN NUMBER AS
    total NUMBER;
BEGIN
    SELECT sum(t.horas) 
    INTO total
    FROM Trabalhano t 
    WHERE t.empregado_id = matricula;
    RETURN total;
END;

BEGIN
    dbms_output.put_line('Total de horas do funcionário 1: ' || func_horas(1) || 'h');
END;

-- 2. Criar uma função que recebe como parâmetro a matrícula do funcionário e 
--    retornar o nome desse funcionário.

CREATE OR REPLACE FUNCTION func_nome (
    matricula IN Empregado.id_empregado%type
) 
RETURN Empregado.nome%type AS
    nomeEmp Empregado.nome%type;
BEGIN
    SELECT nome 
    INTO nomeEmp
    FROM Empregado
    WHERE id_empregado = matricula;
    RETURN nomeEmp;
END;

BEGIN
    dbms_output.put_line('Nome do funcionário 1: ' || func_nome(1));
END;

-- 3. Criar uma função que recebe o código de um departamento e retornar o 
--    total de projetos já vinculados nesse departamento.

CREATE OR REPLACE FUNCTION dep_proj_count (
    codigo IN Departamento.id_departamento%type
)
RETURN NUMBER AS
    qtd NUMBER;
BEGIN
    SELECT count(departamento_id)
    INTO qtd
    FROM Projeto
    WHERE departamento_id = codigo;
    RETURN qtd;
END;

BEGIN
    dbms_output.put_line('O departamento 1 possue ' || dep_proj_count(1) || ' projetos');
END;

-- 4. Criar uma função que recebe como parâmetro o nome de um cliente e retorne 
--    a quantidade total de projetos que esse cliente já realizou.

CREATE OR REPLACE FUNCTION cliente_proj_count(
    nomeCliente IN Cliente.nome%type
)
RETURN NUMBER AS
    qtd NUMBER;
BEGIN
    SELECT count(po.cliente_id)
    INTO qtd
    FROM Projeto_Cliente po
    INNER JOIN Cliente c ON po.cliente_id = c.id_cliente
    WHERE c.nome = nomeCliente;
    RETURN qtd;
END;

BEGIN
    dbms_output.put_line('O cliente Pascal já realizou ' || 
        cliente_proj_count('Pascal') || ' projetos');
END;