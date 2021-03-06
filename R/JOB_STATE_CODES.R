#' Slurm Job state codes
#'
#' This data frame contains information regarding the job state codes that Slurm
#' returns when querying the status of a given job. The last column, `type`,
#' shows a description of how that corresponding state is considered in the
#' package's various operations. This is used in the function [status].
#'
#' @format A data frame with 24 rows and 4 columns.
#' @references Slurm's website \url{https://slurm.schedmd.com/squeue.html}
#' @export
#'
JOB_STATE_CODES <- structure(
  list(
    code = c(
      "BF",
      "CA",
      "CD",
      "CF",
      "CG",
      "DL",
      "F",
      "NF",
      "OOM",
      "PD",
      "PR",
      "R",
      "RD",
      "RF",
      "RH",
      "RQ",
      "RS",
      "RV",
      "SI",
      "SE",
      "SO",
      "ST",
      "S",
      "TO"
    ),
    name = c(
      "BOOT_FAIL",
      "CANCELLED",
      "COMPLETED",
      "CONFIGURING",
      "COMPLETING",
      "DEADLINE",
      "FAILED",
      "NODE_FAIL",
      "OUT_OF_MEMORY",
      "PENDING",
      "PREEMPTED",
      "RUNNING",
      "RESV_DEL_HOLD",
      "REQUEUE_FED",
      "REQUEUE_HOLD",
      "REQUEUED",
      "RESIZING",
      "REVOKED",
      "SIGNALING",
      "SPECIAL_EXIT",
      "STAGE_OUT",
      "STOPPED",
      "SUSPENDED",
      "TIMEOUT"
    ),
    description = c(
      "Job terminated due to launch failure, typically due to a hardware failure (e.g. unable to boot the node or block and the job can not be requeued).",
      "Job was explicitly cancelled by the user or system administrator. The job may or may not have been initiated.",
      "Job has terminated all processes on all nodes with an exit code of zero.",
      "Job has been allocated resources, but are waiting for them to become ready for use (e.g. booting).",
      "Job is in the process of completing. Some processes on some nodes may still be active.",
      "Job terminated on deadline.",
      "Job terminated with non-zero exit code or other failure condition.",
      "Job terminated due to failure of one or more allocated nodes.",
      "Job experienced out of memory error.",
      "Job is awaiting resource allocation.",
      "Job terminated due to preemption.",
      "Job currently has an allocation.",
      "Job is held.",
      "Job is being requeued by a federation.",
      "Held job is being requeued.",
      "Completing job is being requeued.",
      "Job is about to change size.",
      "Sibling was removed from cluster due to other cluster starting the job.",
      "Job is being signaled.",
      "The job was requeued in a special state. This state can be set by users, typically in EpilogSlurmctld, if the job has terminated with a particular exit value.",
      "Job is staging out files.",
      "Job has an allocation, but execution has been stopped with SIGSTOP signal. CPUS have been retained by this job.",
      "Job has an allocation, but execution has been suspended and CPUs have been released for other jobs.",
      "Job terminated upon reaching its time limit."
    ),
    type = c(
      "failed",
      "failed",
      "done",
      "pending",
      "pending",
      "failed",
      "failed",
      "failed",
      "failed",
      "pending",
      "failed",
      "running",
      "pending",
      "pending",
      "pending",
      "pending",
      "pending",
      "pending",
      "pending",
      "failed",
      "pending",
      "failed",
      "failed",
      "failed"
    )
  ),
  row.names = c(NA,-24L),
  class = "data.frame"
)
