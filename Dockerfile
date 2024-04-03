# Use a base image with Node.js
FROM node:14 as builder

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to take advantage of Docker layer caching
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the React app
RUN npm run build

# Use NGINX to serve the built app
FROM nginx:alpine

# Copy the built app from the builder stage to NGINX's web root directory
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
