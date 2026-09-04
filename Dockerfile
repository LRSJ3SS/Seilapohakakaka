# Usar imagem oficial do Node.js versão 20
FROM node:20-alpine

# Definir pasta de trabalho dentro do container
WORKDIR /app

# Copiar primeiro os arquivos de dependências
COPY package.json ./

# Instalar dependências
RUN npm install --production

# Copiar TODO o resto do projeto
COPY . .

# Criar pasta SaveData (evita erro de permissão)
RUN mkdir -p /app/SaveData

# Expor a porta 443
EXPOSE 443

# Comando para iniciar o servidor
CMD ["node", "server.js"]
