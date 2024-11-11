FROM node:20.15.0-alpine

RUN mkdir -p /app
WORKDIR /app

RUN apk update && apk upgrade
RUN apk add git

COPY . /app/
RUN npm install -g pnpm
RUN pnpm install
RUN pnpm build

ENV HOST=0.0.0.0

EXPOSE 3000

CMD ["node", "./dist/node.js"]
