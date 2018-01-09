FROM nginx:latest
MAINTAINER Xavier Blanc <blancxav@gmail.com>

COPY nginx.conf /etc/nginx/nginx.conf

# Install node
RUN apt-get update -y \
	&& apt-get install curl -y
RUN curl -o /usr/local/bin/n https://raw.githubusercontent.com/visionmedia/n/master/bin/n
RUN chmod +x /usr/local/bin/n
RUN n latest

RUN mkdir /tmp/app
WORKDIR /tmp/app

COPY . .

RUN npm install
RUN npm run prod

RUN /tmp/ops /var/www/public


