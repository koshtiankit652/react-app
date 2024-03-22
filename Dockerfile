
FROM nginx:alpine
WORKDIR /app
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80