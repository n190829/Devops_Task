# Use official Node.js base image
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy remaining app files
COPY . .

# Expose port
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]
