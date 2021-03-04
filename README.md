## mrtoolr

`mrtoolr` is an R package that mirrors the Python-based `mrtool` package (https://github.com/ihmeuw-msca/mrtool). Use the follow instructions to install `mrtoolr` and its Python dependencies in a Docker image:

1. Install Docker from https://www.docker.com/products/docker-desktop.
2. On the command line, do: `docker run --rm -p 8787:8787 -e ROOT=TRUE -e PASSWORD=dockpass rocker/rstudio`.
3. In a browser, go to `localhost:8787`. Enter username "rstudio" and password "dockpass" to access the RStudio Server session.
4. In the R interpreter, run `source("https://raw.githubusercontent.com/ihmeuw-msca/mrtoolr/main/install/python_dependencies.R")`. This will install Miniconda, libgmp3-dev, the required Python modules and the `mrtoolr` R package.
5. Refresh the R session with "Session --> Restart R" or [Ctrl/Command + Shift + F10].
6. Run `library(mrtool)`.

Code examples with simulated data can be found here: https://rpubs.com/rsoren/mrbrt_examples_gbd2020.
