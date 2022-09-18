# Build container from Rocker/shiny base image:
# Ubuntu 20.04
# R 4.0 
FROM rocker/rstudio:4

# Update installer and install git and system-level dependencies for common packages (e.g. knitr, tidyverse)
RUN apt-get update && apt-get install -y \
    git \
    make \
    libcurl4-openssl-dev \
    libssl-dev \
    zlib1g-dev \
    libxml2-dev \
    libicu-dev \
    pandoc
    
# Provide Github credentials
RUN git config --global user.name 'David Kingman'
RUN git config --global user.email 'david_kingman@hotmail.co.uk'

# Customise R Studio by copying config file to the container
COPY ./dev_container/rstudio-prefs.json /home/rstudio/.config/rstudio