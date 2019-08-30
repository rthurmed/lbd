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

-- 4. Criar um procedimento que receba como parâmetro o nome do departamento e 
--    imprimir em tela o nome de todos os funcionários vinculados aquele 
--    departamento. Imprimir de acordo com exemplo abaixo: 
--
--    O departamento nome_departamento apresenta os seguintes funcionários: 
--    Nome funcionário 1
--    Nome funcionário 2
--    ....

-- 5. Criar um procedimento que recebe como parâmetro onome de um projeto e 
--    imprima na tela o nome de todos os funcionários desse projeto. 
--
--    O projeto NOME apresenta os seguintes funcionários
--    NOME FUNCIONÁRIO 1
--    NOME FUNCIONÁRIO 2
--    ...