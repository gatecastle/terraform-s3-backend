variable "common_config" {
  type = object({
    region = string
  })
}

variable "environment" {
  type = list(object({
    name = string
    terraform_state_bucket = string
    terraform_lock_db = string
  }))
}

