# Build container from Rocker/shiny base image:
# Ubuntu 20.04
# R 4.0 
FROM rocker/shiny:4

# Update installer and install git and system-level package dependencies
RUN apt-get update && apt-get install -y \
    make \
    git \
    pandoc \
    libicu-dev \
    zlib1g-dev
    
# Install renv
ENV RENV_VERSION 0.15.5
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# Clone git repo
RUN git clone https://github.com/David-Kingman/docker_tests.git

# Recreate project package library using renv::restore()
RUN R -e "renv::restore(lockfile = './docker_tests/renv.lock', repos = c(RSPM = 'https://packagemanager.rstudio.com/all/latest'))"

# Copy App.R into /srv/shiny-server/
RUN cp docker_tests/App.R /srv/shiny-server/

# Run app
CMD ["/usr/bin/shiny-server"]