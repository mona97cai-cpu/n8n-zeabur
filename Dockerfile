FROM n8nio/n8n:latest
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install --production
EXPOSE 5678
CMD ["n8n", "start"]
