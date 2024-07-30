CREATE DEFINER=`glpictc2`@`%.%` PROCEDURE `glpidb`.`AtualizarPerfilAdministrador`()
BEGIN
	DECLARE done INT DEFAULT 0;
    DECLARE val_from_reference INT;

    -- cursor para percorrer as linhas da TabelaReferencia
    DECLARE cur CURSOR FOR
        SELECT id_referencia FROM temp_ids;

    -- manipulador para o cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Tabela temporária
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_ids (
        id_referencia INT
    ); 

    -- Inserir ID's referentes à tabela glpi_users em tabela temporária
    INSERT INTO temp_ids
    SELECT U2.ID 
    FROM glpidb.CargaUserAD UAD
    INNER JOIN glpidb.glpi_users U2 ON UAD.nome = U2.name;

    -- Abrir cursor
    OPEN cur;

    read_loop: LOOP
        -- Lê o valor da coluna valor_referencia da TabelaReferencia
        FETCH cur INTO val_from_reference;

        -- Se o cursor não encontrar mais linhas, saia do loop
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Update na TabelaPrincipal usando o valor da TabelaReferencia
        UPDATE glpidb.glpi_profiles_users
        SET profiles_id = 3
        WHERE users_id = val_from_reference;
    END LOOP;

    CLOSE cur;
END