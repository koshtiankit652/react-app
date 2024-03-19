FROM node:16
WORKDIR /app
COPY ./build /app
CMD [\"node\", \"app.js\"]
