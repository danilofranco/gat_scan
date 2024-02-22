FROM python:3.11-alpine

# Copia os arquivos do script de integração para o contêiner
COPY gat_integration /gat_integration

# Instala as dependências do script de integração
RUN pip install --no-cache-dir -r /gat_integration/requirements.txt

# Instala as dependências necessárias
RUN apk add --no-cache nmap nmap-scripts git make && \
    git clone https://github.com/danilofranco/flan.git /flan && \
    git clone https://github.com/vulnersCom/nmap-vulners \
      /usr/share/nmap/scripts/vulners && \
    nmap --script-updatedb \
    apk del git && \
    mv /flan/* /

COPY run_local.sh run.sh
# Script de entrada que executa o Flan e o script de integração
RUN mkdir app && chmod -R 777 /app
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["./app/entrypoint.sh"]
