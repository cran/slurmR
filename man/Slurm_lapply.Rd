% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Slurm_Map.R, R/Slurm_lapply.R, R/Slurm_sapply.R
\name{Slurm_Map}
\alias{Slurm_Map}
\alias{Slurm_lapply}
\alias{Slurm_sapply}
\title{The Slurm version of the \code{\link[=lapply]{*apply}} family of functions.}
\usage{
Slurm_Map(
  f,
  ...,
  njobs = 2L,
  mc.cores = 1L,
  job_name = opts_slurmR$get_job_name(),
  tmp_path = opts_slurmR$get_tmp_path(),
  plan = "collect",
  sbatch_opt = list(),
  rscript_opt = list(),
  seeds = NULL,
  compress = TRUE,
  export = NULL,
  export_env = NULL,
  libPaths = .libPaths(),
  hooks = NULL,
  overwrite = TRUE
)

Slurm_lapply(
  X,
  FUN,
  ...,
  njobs = 2L,
  mc.cores = 1L,
  job_name = opts_slurmR$get_job_name(),
  tmp_path = opts_slurmR$get_tmp_path(),
  plan = "collect",
  sbatch_opt = list(),
  rscript_opt = list(),
  seeds = NULL,
  compress = TRUE,
  export = NULL,
  export_env = NULL,
  libPaths = .libPaths(),
  hooks = NULL,
  overwrite = TRUE
)

Slurm_sapply(X, FUN, ..., simplify = TRUE, USE.NAMES = TRUE)
}
\arguments{
\item{njobs}{Integer. Number of jobs to use in the job-array. This specifies
the number of R sessions to initialize. This does not specify the number of
cores to be used.}

\item{job_name}{Character. Name of the job to be passed to \code{Slurm}.}

\item{tmp_path}{Character. Path to the directory where all the data (including
scripts) will be stored. Notice that this path must be accessible by all the
nodes in the network (See \link{opts_slurmR}).}

\item{plan}{A character scalar. (See \link{the_plan}).}

\item{sbatch_opt}{List of options to be passed to \code{sbatch}. This is usually
done by adding the flags \verb{#SBATCH} to the bash file.}

\item{rscript_opt}{List. Options to be passed to \code{Rscript}.}

\item{seeds}{Integer vector of length \code{njobs}. Seeds to be passed to each
job. When \code{NULL} (default), seeds will be picked automatically (see \link{new_rscript}).}

\item{compress}{Logical scalar (default \code{TRUE}). Passed to \link{saveRDS}. Setting
this value to \code{FALSE} can be useful when the user requires faster read/write
of R objects on disk.}

\item{export}{A named list with objects to be included in the Spawned sessions.}

\item{export_env}{An environment. Environment where the objects listed in
\code{export} are located (default \code{\link[=parent.frame]{parent.frame()}}).}

\item{libPaths}{A character vector. See \link{.libPaths}.}

\item{hooks}{A list of functions (passed to \link{new_slurm_job}).}

\item{overwrite}{Logical scalar. When \code{TRUE}, if the path specified by
\code{tmp_path/job_name} already exists, it will overwrite it, otherwise the
function returns with an error.}

\item{X, FUN, f, mc.cores, ...}{Arguments passed to either \link[parallel:mclapply]{parallel::mclapply} or
\link[parallel:mcMap]{parallel::mcMap}.}

\item{simplify, USE.NAMES}{Logical scalar. See \link{sapply}.}
}
\value{
If \code{plan == "collect"}, then whatever the analogous function returns,
otherwise, an object of class \link{slurm_job}.
}
\description{
The Slurm version of the \code{\link[=lapply]{*apply}} family of functions.
}
\details{
The function \code{Slurm_lapply} will submit \code{njobs} to the queue and distribute
\code{X} according to \link[parallel:splitIndices]{parallel::splitIndices}. For example, if \code{X} is list with
1,000 elements, and \code{njobs = 2}, then \code{Slurm_lapply} will submit 2 jobs with
500 elements of \code{X} each (2 chunks of data). The same principle applies to
\code{Slurm_sapply} and \code{Slurm_Map}, this is, the data is split by chunks so all
the information is sent at once when the job is submitted.

Just like \link{sapply} is to \link{lapply}, \code{Slurm_sapply} is just a wrapper of
\code{Slurm_lapply} with an extra argument, \code{simplify}. When \code{TRUE}, once the job
is collected, the function \link{simplify2array} is called.
}
\examples{
\dontrun{
  # A job drawing 1e6 uniforms on 10 jobs (array)
  # The option plan = "wait" makes it return only once the job is completed.
  job1 <- Slurm_lapply(1:20, function(i) runif(1e6), njobs=10, plan = "wait")

  # To collect
  ans <- Slurm_collect(job1)

  # As before, but this time not waiting, and now we are passing more
  # arguments to the function
  # plan = "none" only creates the job object (and the files), we submit
  # later
  job1 <- Slurm_lapply(1:20, function(i, a) runif(1e6, a), a = -1, njobs=10,
      plan = "none")

  # We submit
  job1 <- sbatch(job1)

  # In order to cancel a job
  scancel(job1)

  # How to clean up
  Slurm_clean(job1)
}
}
\references{
Job Array Support https://slurm.schedmd.com/job_array.html
}
\seealso{
For resubmitting a job, see the example in \link{sbatch}.
}
