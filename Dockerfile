FROM public.ecr.aws/docker/library/node:18.15.0

WORKDIR /app

ENV API_PORT=API_PORT_VALUE
ENV DB_DATABASE=DB_DATABASE_VALUE
ENV DB_HOST=DB_HOST_VALUE
ENV DB_PORT=DB_PORT_VALUE
ENV DB_USER=DB_USER_VALUE
ENV DB_PASSWORD=DB_PASSWORD_VALUE

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE API_PORT_VALUE

CMD [ "npm" , "start" ]
