FROM --platform=linux/amd64 node:latest
EXPOSE 3000
WORKDIR /frontend
COPY package-lock.json package.json ./
RUN apt update && apt install -y make
RUN apt update && apt install -y bash
RUN npm install --no-progress --ignore-optional
RUN chmod -R 777 /home/node /root
CMD make
CMD make watch
