FROM node:24-alpine

RUN addgroup -S nodejs && adduser -S express -G nodejs

WORKDIR /app

COPY package*.json ./

RUN npm ci

RUN chown -R express:nodejs /app

COPY --chown=express:nodejs . .

USER express

EXPOSE 3000

CMD ["npm", "start"]
