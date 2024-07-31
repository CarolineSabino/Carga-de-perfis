#!/bin/bash

# Configurações do MariaDB
MARIADB_USER=""
MARIADB_DB=""
MARIADB_PASSWORD=""

# Caminho do arquivo CSV com carga de perfis
MARIADB_CSV_CargaPerfilGLPI="/home/AdmBancoDados/scripts/cargaperfil/planilha.csv"

# Baixar a planilha com carga de perfis

curl -o "/home/AdmBancoDados/scripts/cargaperfil/planilha.csv" "url a ser baixada"

# Verificar se o download foi bem-sucedido
if [ $? -ne 0 ]; then
    echo "Erro ao baixar a planilha."
    exit 1
fi

# Comando para carregar os dados no MariaDB
mysql -u"$MARIADB_USER" -p"$MARIADB_PASSWORD" -D"$MARIADB_DB" -e \
"LOAD DATA LOCAL INFILE '$MARIADB_CSV_CargaPerfilGLPI' \
INTO TABLE CargaUserAD \
FIELDS TERMINATED BY ',' \
ENCLOSED BY '\"' \
LINES TERMINATED BY '\n' \
IGNORE 1 LINES; \
UPDATE CargaUserAD SET nome = REGEXP_REPLACE(nome, '[[:cntrl:]]', '');
CALL AtualizarPerfilAdministrador;
CALL AtualizarPerfilSolicitante;
CALL AtualizarPerfilOutros;
TRUNCATE TABLE CargaUserAD;"

# Verificar se a carga de dados foi bem-sucedida
if [ $? -eq 0 ]; then
    echo "Dados carregados com sucesso no MariaDB."
else
    echo "Erro ao carregar dados no MariaDB."
    exit 1
fi

echo "Transferência de dados concluída."








