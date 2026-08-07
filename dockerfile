# 1. Use an official lightweight Node.js base image
FROM node:18-alpine

# 2. Set the working directory inside the container
WORKDIR /usr/src/app

# 3. Copy package definition files first (leverages Docker cache)
COPY package*.json ./

# 4. Install production dependencies
RUN npm install --only=production

# 5. Copy the rest of the application code
COPY . .

# 6. Expose the port your Express app listens on
EXPOSE 3000

# 7. Use a non-root user for security best practices in DevSecOps
USER node

# 8. Define the default command to run the app
CMD ["node", "app.js"]
