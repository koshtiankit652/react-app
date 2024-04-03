FROM node:18 as build

WORKDIR /app

COPY package*.json ./
RUN npm install 
COPY . .
RUN npm run build
# Copy the built React app to Nginx's web server directory
COPY --from=build /app /usr/share/nginx/html
# Expose port 80 for the Nginx server
EXPOSE 80
# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
# EXPOSE 3000

# CMD ["node", "index.js"]
