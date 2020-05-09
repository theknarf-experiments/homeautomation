FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html
COPY ./sui/ /usr/share/nginx/html

COPY apps.json /usr/share/nginx/html
COPY links.json /usr/share/nginx/html

EXPOSE 80
