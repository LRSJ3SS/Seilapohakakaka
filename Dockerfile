# Etapa de construção
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

# Etapa final
FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app .

RUN npm ci --only=production

RUN mkdir -p /app/SaveData

ENV PORT=443
EXPOSE 443

CMD ["npm", "start"]
