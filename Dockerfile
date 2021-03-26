FROM node:14.16.0-buster as builder

ARG buildEnvName

WORKDIR /app

ADD . /app/

RUN npm config set registry https://registry.npm.taobao.org

RUN npm install

# RUN npm run build:stage   测试环境
# RUN npm run build:prod    正式环境

RUN npm run build:prod

FROM nginx:latest

COPY --from=builder /app/dist /usr/share/nginx/html 



 