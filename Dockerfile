FROM nginx:1.13.3-alpine
COPY /nginx/default.conf /etc/nginx/conf.d/
RUN rm -rf /usr/share/nginx/html/*
COPY dist/shop /usr/share/nginx/html
EXPOSE 8080

# 保持容器正常启动，但删除静态文件导致健康检查报 404
RUN rm -rf /usr/share/nginx/html/*

# 保持原本正常的启动命令（确保容器持续 RUNNING）
CMD ["nginx", "-g", "daemon off;"]