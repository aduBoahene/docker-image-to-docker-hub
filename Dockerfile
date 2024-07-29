# FROM node:alpine

# WORKDIR /app

# COPY package*.json .

# RUN npm install

# COPY . .

# EXPOSE 3000

# CMD [ "npm", "start" ]

# Stage 1: Build the application
FROM node:alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Stage 2: Create the final image
FROM node:alpine

WORKDIR /app

COPY --from=builder /app ./

EXPOSE 3000

CMD [ "npm", "start" ]

