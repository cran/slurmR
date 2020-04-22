## ----getting-names, echo=FALSE------------------------------------------------
file_names <- list(
  r = slurmR::snames("r", tmp_path = "[tmp_path]", job_name = "[job-name]"),
  sh = slurmR::snames("sh", tmp_path = "[tmp_path]", job_name = "[job-name]"),
  out = slurmR::snames("out", tmp_path = "[tmp_path]", job_name = "[job-name]"),
  rds = slurmR::snames("rds", tmp_path = "[tmp_path]", job_name = "[job-name]")
)

file_names <- lapply(
  file_names, gsub, pattern = ".+/(?=[0-9])", replacement = "",
  perl = TRUE
  )

file_names <- lapply(file_names, function(f) paste0("`", f, "`"))

