

# --- Stage 1: Build React App ---
FROM node:18-alpine as build

WORKDIR /app
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
