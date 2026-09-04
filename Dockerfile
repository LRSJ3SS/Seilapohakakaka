# Etapa de construção
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

# Etapa final
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

# Copia apenas o código-fonte, sem node_modules do builder
COPY --from=builder /app/src ./src
# (ajuste conforme a estrutura do seu projeto)

RUN mkdir -p /app/SaveData

ENV PORT=443
EXPOSE 443

CMD ["npm", "start"]
