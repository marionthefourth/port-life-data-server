# Install Dependencies
FROM node:lts-alpine3.15 AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json yarn.lock ./

RUN yarn

COPY . ./

EXPOSE 3000/tcp

CMD yarn server