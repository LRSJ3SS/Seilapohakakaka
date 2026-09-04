# Imagem base do Node.js compatível
FROM node:20-alpine

# Define a pasta de trabalho dentro do servidor
WORKDIR /app

# Copia os arquivos de dependências PRIMEIRO (melhora o cache)
COPY package*.json ./

# Instala as dependências do projeto
RUN npm install --production

# Copia TODO o resto dos arquivos do projeto
COPY . .

# Cria a pasta SaveData (evita erro de permissão em tempo de execução)
RUN mkdir -p /app/SaveData

# Libera a porta que o servidor vai usar
EXPOSE 8080

# Comando que inicia o servidor
CMD ["node", "server.js"]
