# Use an existing docker image as a base
FROM node:alpine

# Copy needed files
COPY ./ ./

# Download and install dependency
RUN npm install

# Tell the image what to do when it starts as a container
CMD ["npm", "start"]
