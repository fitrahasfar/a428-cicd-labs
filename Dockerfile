# # Gunakan image node sebagai base image
# FROM node:16-buster-slim

# # Atur direktori kerja
# WORKDIR /app

# # Salin package.json dan package-lock.json (jika ada)
# COPY package.json ./

# # Instal dependencies
# RUN npm install

# # Salin seluruh file proyek ke dalam container
# COPY . .

# # Build aplikasi untuk production
# RUN npm run build

# # Gunakan image nginx untuk menjalankan aplikasi
# FROM nginx:stable-alpine

# # Salin build hasil React ke direktori nginx
# COPY --from=0 /app/build /usr/share/nginx/html

# # Ekspose port 80 untuk akses aplikasi
# EXPOSE 3000

# # Jalankan nginx
# CMD ["nginx", "-g", "daemon off;"]

# Gunakan base image Node.js
FROM node:16-buster-slim

# Set working directory
WORKDIR /usr/src/app

# Copy seluruh file ke container
COPY . .

# Install dependencies
RUN npm install

# Expose port aplikasi
EXPOSE 3000

# Jalankan aplikasi
CMD ["npm", "start"]
