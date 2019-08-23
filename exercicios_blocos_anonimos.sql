-- 1. Solicitar o código do empregado e imprimir na tela o seu nome.
DECLARE
    codemp Empregado.id_empregado%type;
    nomeemp Empregado.nome%type;
BEGIN
    codemp := :codemp;
    SELECT nome INTO nomeemp FROM Empregado WHERE id_empregado = codemp
    dbms_output.put_line('Nome do empregado: ' || nomeemp);
END;

-- 2. Apresentar a soma de todos os salários para todos os funcionários.
DECLARE
    soma Empregado.salario%type;
BEGIN
    SELECT sum(salario) INTO soma FROM Empregado;
    dbms_output.put_line('Soma de todos salários: ' || soma);
END;

-- 3. Informar o total de projetos já realizados pela empresa.
-- 4. Informar o total de projetos realizados para um cliente específico.
-- 5. Informar o código do empregado e imprimir na tela os nomes dos projetos que esse empregado está vinculado.