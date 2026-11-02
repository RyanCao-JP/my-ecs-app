FROM nginx:1.13.3-alpine
COPY /nginx/default.conf /etc/nginx/conf.d/
RUN rm -rf /usr/share/nginx/html/*
COPY dist/shop /usr/share/nginx/html
EXPOSE 8080

# 临时制造启动崩溃
CMD ["sh", "-c", "echo 'Simulating fatal failure for rollback test' && exit 1"]