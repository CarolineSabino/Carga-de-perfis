CREATE  PROCEDURE `glpidb`.`AtualizarPerfilSolicitante`()
BEGIN
	 DECLARE done INT DEFAULT 0;
        DECLARE val_from_reference_sol INT;

    -- cursor para percorrer as linhas da TabelaReferencia
    DECLARE cur2 CURSOR FOR
        SELECT id_referencia_sol FROM temp_sol;

    --  manipulador para o cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
   
    -- Tabela temporária
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_sol(
        id_referencia_sol INT
    ); 
   
    -- Inserir ID's referentes à tabela glpi_users em tabela temporária
	INSERT INTO temp_sol
	SELECT U2.id 
    FROM glpidb.glpi_users AS U2
    WHERE NOT EXISTS (
        SELECT 1
        FROM glpidb.CargaUserAD AS UAD
        WHERE U2.name = UAD.nome
       );
   
    -- Abrir cursos
        OPEN cur2;

    read_loop: LOOP
        -- Lê o valor da coluna valor_referencia da TabelaReferencia
        FETCH cur2 INTO val_from_reference_sol;
        
        -- Se o cursor não encontrar mais linhas, saia do loop
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Update na TabelaPrincipal usando o valor da TabelaReferencia
        UPDATE glpidb.glpi_profiles_users
        SET profiles_id = 1
        WHERE users_id = val_from_reference_sol;
    END LOOP;

    CLOSE cur2;
END