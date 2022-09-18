## Build image and run container

# Build the Dockerfile in this folder to create the dev_container1 image
docker build -t dev_container1 -f dev_container/Dockerfile .

# Run an instance of the dev_container1 image tagged as rstudio-server
docker run \
  -d \
  -p 8888:8787 \
  --name rstudio-server \
  -v /Users/davidkingman/'My Drive'/'Data Science Training'/R/'3. Projects':/home/rstudio \
  -e PASSWORD=password \
  dev_container1
  
## Docker admin

# List all images
docker images

# List all containers
docker ps -a

# Start or stop rstudio-server
docker start rstudio-server
docker stop rstudio-server

# Delete rstudio-server container
docker rm rstudio-server

# Delete dev_container1 image
docker rmi dev_container1