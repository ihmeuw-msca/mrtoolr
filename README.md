## mrtoolr

`mrtoolr` is an R package that mirrors the Python-based `mrtool` package (https://github.com/ihmeuw-msca/mrtool) with additional functions for cascading splines. To use `mrtoolr` in our team's Docker image, use the following instructions:

1. Install Docker from https://www.docker.com/products/docker-desktop.
2. On the command line, do: `docker run --rm -p 8787:8787 -e ROOT=TRUE -e PASSWORD=dockpass rocker/rstudio`.
3. In a browser, go to `localhost:8787`. Enter username "rstudio" and password "dockpass" to access the RStudio Server session.
4. In the R interpreter, run `library(reticulate); use_condaenv("mrtool-0.0.1"); library(mrtoolr)`.

Use the following instructions to install `mrtoolr` and its Python dependencies from R (requires Linux). We use the `rocker/rstudio` Docker image for illustration:

1. On the command line, do: `docker run --rm -p 8787:8787 -e ROOT=TRUE -e PASSWORD=dockpass rocker/rstudio`.
2. In a browser, go to `localhost:8787`. Enter username "rstudio" and password "dockpass" to access the RStudio Server session.
3. In the R interpreter, run `source("https://raw.githubusercontent.com/ihmeuw-msca/mrtoolr/main/install/python_dependencies.R")`. This will install Miniconda, libgmp3-dev, the required Python modules and the `mrtoolr` R package.
4. Refresh the R session with "Session --> Restart R" or [Ctrl/Command + Shift + F10].
5. Run `library(mrtoolr)`.

Code examples with simulated data can be found here: https://rpubs.com/rsoren/mrbrt_examples_gbd2020.
