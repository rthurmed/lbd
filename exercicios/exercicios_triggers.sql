-- 1. Crie uma triggers que, após inserir uma tupla na tabela trabalhano, 
--    imprime a seguinte informação: O empregado de nome TAL está alocado ao 
--    projeto TAL em tantas HORAS. 

-- 2. Crie uma trigger que não permita a inserção de dependentes que não sejam 
--    filhos dos empregados. (FILHO ou FILHA). 

-- 3. Crie uma trigger que não permita a inserção de empregados com idade menor
--    do que 16 anos. 

-- 4. Crie uma trigger que ao informar um funcionário para um projeto verificar
--    se ele já não está alocadomais de 200h em outros projetos. Caso ele
--    esteja já com mais de 200h deve informar mensagem que o funcionário não
--    pode ser alocado ao projeto X, caso contrário, ele poderá ser inserido.

-- 5. Crie um trigger que analise, no momento da atualização de dados na tabela
--    empregado, se o salário que está sendo atualizado é maior ou igual ao 
--    anteriormente inserido. Não permita atualização de salário para valor 
--    inferior.

-- 6. Crie uma tabela de LOG com as seguintes informações: data e descrição. 
--    Essa tabela receberá informações de todas as inserções e atualizações 
--    feitas na tabela ProjetoEmpregado. Portanto, crie um trigger que armazene
--    as informações na tabela LOG, com data de inserção/atualização e o que
--    foi inserido, por exemplo: 
--    Inserção na tabela ProjetoEmpregado, o empregado Nome empregado foi 
--    alocado ao projeto Nome projeto com XX horas, após operações feitas na 
--    tabela Venda.