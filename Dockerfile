###########################################################
#
# Dockerfile for tfk-seneca-counter
#
###########################################################

# Setting the base to nodejs 4.5.0
FROM mhart/alpine-node:4.5.0

# Maintainer
MAINTAINER Geir Gåsodden

#### Begin setup ####

# Installs git
RUN apk add --update --no-cache git

# Extra tools for native dependencies
RUN apk add --no-cache make gcc g++ python

# Bundle app source
COPY . /src

# Change working directory
WORKDIR "/src"

# Install dependencies
RUN npm install --production

# Env variables
ENV TFK_SENECA_COUNTER_TAG tfk-seneca-counter
ENV TFK_SENECA_COUNTER_FIREBASE_URL https://seneca-firebase-test.firebaseio.com
ENV TFK_SENECA_COUNTER_FIREBASE_API_KEY firebase-api-key
ENV TFK_SENECA_COUNTER_HOST localhost
ENV TFK_SENECA_COUNTER_PORT 8000

# Startup
CMD ["node", "service.js", "--seneca-log=type:act"]