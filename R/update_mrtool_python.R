#
# update_mrtool_python.R
#
# Reed Sorensen
# March 2021
#

update_mrtool_python <- function(module_location = "git+https://github.com/ihmeuw-msca/mrtool.git@v0.0.1#egg=mrtool") {
  require(reticulate)
  py_current <- reticulate::py_config()$python
  if (!(grepl("r-miniconda", py_current) & grepl("r-reticulate", py_current) )) {
    stop("Current conda environment is not 'r-reticulate'; to switch, please restart the R session")
  }

  cmd_update <- paste0(py_config()$python, " -m pip install --user -e ", module_location)
  system(cmd_update)
}

