FROM node:18
WORKDIR /src

COPY package.json .

RUN npm install 

COPY . .

RUN npm run build

# Start a new stage for the production image
FROM nginx:alpine

# Copy the built files from the previous stage
COPY --from=build ./src/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# # Start Nginx server
# CMD ["nginx", "-g", "daemon off;"]

# EXPOSE 3000

# CMD ["npm", "start"]
