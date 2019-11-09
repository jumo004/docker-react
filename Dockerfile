# Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# next FROM statement automatically starts a new phase
# then copy results from previous phase to current phase location
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

