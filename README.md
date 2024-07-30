* Problemática:

A necessidade é de automatizar o processo de atualização de perfis de usuários no sistema GLPI. O processo envolve extrair informações de usuários de um banco de dados de produção e carregar esses dados em outro banco de dados onde são atualizados e ajustados conforme três perfis específicos no GLPI.

* Solução 

Automação de Extração e Carga:

Script `cargaperfil.sh`: Extrai dados do banco de dados  e carrega esses dados no banco GLPI. O script automatiza o processo, incluindo o download de CSV e a execução de procedimentos armazenados para atualizar os perfis.

Atualização de Perfis:
   - `glpibd.AtualizarPerfilAdministrador`: Atualiza perfis de administradores no GLPI, usando um cursor para processar e atualizar IDs na tabela apropriada.
   - `glpibd.AtualizarPerfilSolicitante`: Atualiza perfis de solicitantes, inserindo IDs que não existem na tabela de carga e ajustando as informações com base nesses IDs.
   - `glpibd.AtualizarPerfilOutros`: Ajusta diversos perfis na tabela `glpi_profiles_users` conforme a lógica definida para cada perfil específico.

Essas etapas garantem que os perfis de acesso no GLPI sejam atualizados de forma eficiente e precisa.
