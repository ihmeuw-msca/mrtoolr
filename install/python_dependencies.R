#
# python_dependencies.R
#
# Reed Sorensen
# March 2021
#


install_mrtool_python <- function(tag = "v0.0.1") {

  require(reticulate)
  py_current <- reticulate::py_config()$python
  if (!(grepl("r-miniconda", py_current) & grepl("r-reticulate", py_current) )) {
    stop("Current conda environment is not 'r-reticulate'; to switch, please restart the R session")
  }

  if (reticulate::py_module_available("mrtool")) {
    cat("Module 'mrtool' is already available for Python:", py_current,
        "\nUse the update_mrtool_python() function to change the version"
    )
  } else {

    # install libgmp3-dev
    system("sudo apt-get -y install libgmp3-dev")

    # install mrtool
    cmd_mrtool <- paste0(
      py_config()$python, " -m pip install --user ",
      "git+https://github.com/ihmeuw-msca/mrtool.git@", tag, "#egg=mrtool"
    )
    system(cmd_mrtool)

    if (!py_module_available("dataclasses")) conda_install(packages = "dataclasses")
    if (!py_module_available("dill")) conda_install(packages = "dill")
    if (!py_module_available("cyipopt")) conda_install(packages = "cyipopt", forge = TRUE)
    if (!py_module_available("pycddlib")) py_install(packages = "pycddlib", pip = TRUE)

    cmd_limetr <- paste0(
      py_config()$python, " -m pip install --user ",
      "git+https://github.com/zhengp0/limetr.git@master"
    )
    system(cmd_limetr)
  }
}



#####


install.packages("reticulate")
require(reticulate)

if (!dir.exists(reticulate::miniconda_path())) {
  reticulate::install_miniconda()
}

install_mrtool_python()
install.packages("remotes")
library(remotes)
remotes::install_github("ihmeuw-msca/mrtoolr")

cat(paste0(
  "\nTo have access to the mrtoolr R functions, restart the session \n",
  "with Session --> Restart R, or [Ctrl/Cmd + Shift + F10], and do: \n",
  "library(mrtoolr)"
))
