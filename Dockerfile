# This is a prod docker file

FROM node:18.20.3-alpine as builder

WORKDIR /usr/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx

COPY --from=builder /usr/app/build /usr/share/nginx/html

# Default command of nginx image starts the server so we dont need to specify it

