##### Dockerfile #####
## build stage ##
FROM node:18.18-alpine as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm rebuild node-sass
RUN npm run build

## run stage ##
FROM nginx:alpine
WORKDIR /run
COPY --from=build /app/build /run
COPY nginx.conf /etc/nginx/nginx.conf
