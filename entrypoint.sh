#!/bin/sh
echo "Iniciando o script de entrada..."

# Converte a chave do GAT Core para base64
echo "Convertendo a chave do GAT Core para base64..."
GAT_API_KEY_BASE64=$(echo -n "$GAT_API_KEY" | base64)

# Executa o Flan Scan
echo "Executando o Flan Scan..."
./run.sh

# Executa o script de integração com o GAT Core
echo "Executando o script de integração com o GAT Core..."
cd /gat_integration
python3 main.py --path /shared/reports --gat_api_host $GAT_API_HOST --gat_api_key $GAT_API_KEY_BASE64 --custom_parser_name Flan

echo "Script de entrada concluído."
exec "$@"
