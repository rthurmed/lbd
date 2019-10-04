-- 1. Faça uma função que receba como parâmetro o código de um produto. A função
--    deve retornar o total (em valor) já obtivo pela venda desse produto 
--    (o valor total já vendido em todas as notas). Mostre esse valor no bloco chamador. 
CREATE OR REPLACE FUNCTION valor_produto(
    prod IN Produto.cod_prod%type
) 
RETURN NUMBER AS
    total NUMBER;
BEGIN
    SELECT sum(nf.valor)
    INTO total
    FROM Nota_Prod np
    INNER JOIN NotaFiscal nf ON np.cod_nota = nf.cod_nota
    WHERE np.cod_prod = prod;
    RETURN total;
END;

DECLARE
    prod_id NUMBER;
BEGIN
    prod_id := :prod_id;
    dbms_output.put_line('Valor do produto ' || prod_id || ': ' || valor_produto(prod_id));
END;

-- 2. Faça um procedimento que apresente a seguinte saída:
-- 
--    O cliente X (nome cliente) já realizou a compra dos seguintes produtos:
-- 
--    Nome do produto - quantidade total comprada
--    Nome do produto - quantidade total comprada
--    ...
CREATE OR REPLACE PROCEDURE historico_de_compras(
    cod_cliente IN Cliente.codc%type
) AS
    nomec Cliente.nome%type;
BEGIN
    SELECT nome
    INTO nomec
    FROM Cliente
    WHERE codc = cod_cliente;
    dbms_output.put_line('O cliente ' || nomec || ' já realizou a compra dos seguintes produtos:');
    FOR comprados IN (
        SELECT p.nome as produto, sum(np.quantidade) as quantidade
        FROM NotaFiscal nf
        INNER JOIN Nota_Prod np ON np.cod_nota = nf.cod_nota
        INNER JOIN Produto p ON np.cod_prod = p.cod_prod
        WHERE nf.codc = cod_cliente
        GROUP BY p.nome
    ) LOOP
        dbms_output.put_line(comprados.produto || ' - ' || comprados.quantidade);
    END LOOP;
END;

DECLARE
    clie_id NUMBER;
BEGIN
    clie_id := :clie_id;
    historico_de_compras(clie_id);
END;

-- 3. Faça um procedimento que receba como parâmetro de entrada o número de uma 
--    nota fiscal e retorne como parâmetro de saída o total de produtos vendidos
--    nessa nota. Mostrar esse valor no bloco chamador.

-- 4. Faça um procedimento que apresente a seguinte saída:
-- 
--    O produto X (nome produto) já foi vendido YY vezes (total de vezes que o produto foi vendido) com as notas fiscais de número: 
-- 
--    Número nota - XX unidades
--    Número nota - XX unidades
-- 
--    Esses são os clientes que adquiriram o produto: 
--    Nome cliente 1
--    Nome cliente 2
--    ...
-- 
--    O produto Y (nome produto) já foi vendido XX vezes(total de vezes que o produto foi vendido) com as notas fiscais de número: 
-- 
--    Número nota - XX unidades
--    Número nota - XX unidades
-- 
--    Esses são os clientes que adquiriram o produto: 
--    Nome cliente 1
--    Nome cliente 2
--    ...