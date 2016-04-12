# Using a compact OS
FROM alpine:latest

# Install Nginx
RUN apk --update add nginx

# Add 2048 stuff into Nginx server
COPY . /usr/share/nginx/html

EXPOSE 80
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

# Start Nginx and keep it from running background
CMD ["nginx", "-g", "daemon off;"]