#application build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install 
COPY . .
RUN npm run build


#running the application
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
