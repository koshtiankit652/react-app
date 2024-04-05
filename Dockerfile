FROM node:18
WORKDIR /app

COPY package.json .

RUN npm install 

COPY . .

RUN npm run build

# Start a new stage for the production image
FROM nginx

# Copy the built files from the previous stage
COPY --from=build build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

# EXPOSE 3000

# CMD ["npm", "start"]
