FROM node:16 as build
WORKDIR /usr/src/app
RUN git clone https://github.com/Taufiq-Y/github-ssh-backend /usr/src/app
RUN npm install
RUN npm run build
FROM nginx:latest
COPY --from=build /usr/src/app/build /usr/share/nginx/html
