# Start your image with a node base image
FROM ubuntu:18.04

# The /app directory should act as the main application directory
WORKDIR /Users


# Copy local directories to the current local directory of our docker image (/app)
COPY ./src ./src
COPY ./public ./public
COPY ./Sporting_Goods ./public/
SHELL ["/bin/bash", "-c"]

# Install node packages, install serve, build the app, and remove dependencies at the end
RUN apt-get -y update && \
 apt-get -y  install  nginx && \
 apt-get clean && \
  rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["tail", "-f", "/dev/null"]


EXPOSE 80



# Start the app using serve command
CMD [ "echo", "Welcome to Ubuntu"]

