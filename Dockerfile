FROM node:20.20.2-alpine3.23 AS builder
WORKDIR /app
COPY package.json .
COPY *.js .
RUN npm install




FROM node:20.20.2-alpine3.23
WORKDIR /app
EXPOSE 8080
COPY --from=builder /app /app
ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"
#Here groupname and username are same.i.e, roboshop.
RUN addgroup -S roboshop && adduser -S -G roboshop roboshop
RUN chown -R roboshop:roboshop /app
USER roboshop
CMD ["node", "server.js"]















# FROM node:20
# # This creates /app and cd into it.
# WORKDIR /app
# COPY package.json .
# COPY *.js .
# RUN npm install
# ENV MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"
# CMD ["node", "server.js"]