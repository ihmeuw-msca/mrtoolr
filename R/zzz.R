#
# zzz.R
#
# Reed Sorensen
# March 2021
#

mrtool <- NULL

.onLoad <- function(libname, pkgname) {

  ihme_conda <- "/ihme/code/mscm/miniconda3/bin/conda"
  if (file.exists(ihme_conda)) {
    use_condaenv(condaenv = "mrtool_0.0.1", conda = ihme_conda, required = TRUE)
  }

  if (reticulate::py_module_available("mrtool")) {
    mrtool <<- import("mrtool")
    for (nm in names(mrtool)) assign(nm, mrtool[[nm]], parent.env(environment()))
  } else {
    warning(paste0(
      'To install Python dependencies for the mrtoolr package, please do: \n',
      'source("https://raw.githubusercontent.com/ihmeuw-msca/mrtoolr/main/install/python_dependencies.R")'
    ))
  }
}
