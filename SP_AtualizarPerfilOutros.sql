CREATE PROCEDURE `glpidb`.`AtualizarPerfilOutros`()
BEGIN
	-- Perfil: Super Administrador
 UPDATE glpidb.glpi_profiles_users
 SET profiles_id = 4
 WHERE id = 10809 
 OR id = 10756 
 OR id = 10527 
 OR id = 10821 
 OR id = 10253; 
 
 -- Perfil: N1 
 UPDATE glpidb.glpi_profiles_users
 SET profiles_id = 9 
 WHERE id = 10578 
 OR id = 10814 
 OR id = 10815 
 OR id = 10799; 
 
 -- Perfil: N2
 UPDATE glpidb.glpi_profiles_users
 SET profiles_id = 10 
 WHERE id = 6560 
 OR id = 10428 
 OR id = 10645 
 OR id = 10467 
 OR id = 10801 
 OR id = 10816 
 OR id = 6372 
 OR id = 2130  
 OR id = 6673 
 OR id = 6670  
 OR id = 10818
 OR id = 6361 
 OR id = 10406 
 OR id = 10819 
 OR id = 10819 
 OR id = 9852; 
 
 
 -- Perfil: N3
 UPDATE glpidb.glpi_profiles_users
 SET profiles_id = 11 -- Infraestrutura
 WHERE id = 10766 
 OR id = 10766 
 OR id = 10822 
 OR id = 10813; 
 
 UPDATE glpidb.glpi_profiles_users
 SET profiles_id = 12 -- Banco de Dados
 WHERE id = 10356;
 
  -- Perfil: Supervisor 
 UPDATE glpidb.glpi_profiles_users
 SET profiles_id = 13
 WHERE id = 10676 
 OR id = 10811; 
  
 -- Perfil: Supervisor Connectcom
 UPDATE glpidb.glpi_profiles_users
 SET profiles_id = 24
 WHERE id = 10528; 
END