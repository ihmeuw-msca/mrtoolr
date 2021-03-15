## mrtoolr

`mrtoolr` is an R package that mirrors the Python-based `mrtool` package (https://github.com/ihmeuw-msca/mrtool) with additional functions for cascading splines. To use `mrtoolr` in our team's Docker image, use the following instructions:

1. Install Docker from https://www.docker.com/products/docker-desktop.
2. On the command line, do: `docker run --rm -p 8787:8787 -e ROOT=TRUE -e PASSWORD=dockpass rsoren/mrtoolr`.
3. In a browser, go to `localhost:8787`. Enter username "rstudio" and password "dockpass" to access the RStudio Server session.
4. In the R console, run `library(reticulate); use_condaenv("mrtool-0.0.1"); library(mrtoolr)`.

To install `mrtoolr` and its dependencies locally on a Linux-based system, source the installation script from an interactive R session like this  `source("https://raw.githubusercontent.com/ihmeuw-msca/mrtoolr/main/install/python_dependencies.R")`, refresh the session, and run `library(mrtoolr)`.

Code examples with simulated data can be found here: https://rpubs.com/rsoren/mrbrt_examples_gbd2020.
