FROM n8nio/n8n:latest
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install --production
EXPOSE 5678
# 适配 n8n 的健康检查，增加启动等待时间
HEALTHCHECK --start-period=20s --interval=10s --timeout=5s --retries=3   CMD curl -f http://localhost:5678/healthz || exit 1
CMD ["n8n", "start"]
