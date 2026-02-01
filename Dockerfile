FROM n8nio/n8n:latest
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install --production
EXPOSE 5678
# 添加健康检查，适配 n8n 的 /healthz 路径，设置超时和重试
HEALTHCHECK --interval=10s --timeout=5s --retries=3   CMD curl -f http://localhost:5678/healthz || exit 1
CMD ["n8n", "start"]
