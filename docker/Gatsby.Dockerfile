# base image
FROM node:18

# set working directory
WORKDIR /app

ADD run.sh /opt/run.sh

# add `/app/node_modules/.bin` to $PATH
#ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies using yarn
RUN npm install -g gatsby-cli

CMD ["sh", "/opt/run.sh"]

EXPOSE 9000
