FROM node:16.20.0-alpine as build
WORKDIR /app
ENV PATH /node_modules/.bin:$PATH
COPY package*.json ./

RUN npm install --silent
COPY . ./

RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80