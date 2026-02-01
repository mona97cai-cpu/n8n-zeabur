FROM n8nio/n8n:latest

# 设置工作目录（与官方镜像一致）
WORKDIR /usr/src/app

# 复制本地 package.json 并安装依赖（含飞书节点）
COPY package.json ./
RUN npm install --production

# 暴露 n8n 默认端口
EXPOSE 5678

# 启动 n8n（保持官方启动方式）
CMD ["n8n", "start"]
