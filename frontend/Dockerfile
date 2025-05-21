

# --- Stage 1: Build React App ---
FROM node:18-alpine AS build

WORKDIR /app

# Error: error:0308010C:digital envelope routines::unsupported
# Add this line before RUN npm ci
ENV NODE_OPTIONS=--openssl-legacy-provider

COPY package*.json ./
# Use npm ci if package-lock.json is present (recommended for CI/CD)
RUN npm ci
COPY . .
RUN npm run build

# --- Stage 2: Serve with Nginx ---
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
