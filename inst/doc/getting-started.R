## ----echo=FALSE---------------------------------------------------------------
suppressMessages(library(slurmR))
suppressWarnings({
  opts_slurmR$set_tmp_path("/stagging/slurmr-jobs/")
  opts_slurmR$set_job_name("simulating-pi")
  # Optional parameters are set via set_opts
  opts_slurmR$set_opts(partition="conti", account="lc_dvc")
  
  # We can look at the setup
  opts_slurmR
})

