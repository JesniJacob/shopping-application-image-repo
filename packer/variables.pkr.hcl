variable "project_name" {
  type        = string
}
variable "project_env" {
  type        = string
}

variable "ami_id" {
  type        = string
}

locals {
  image_timestamp = "${formatdate("YYYY-MM-DD-hhmm", timestamp())}"
  image_name      = "${var.project_name}- ${var.project_env}-${local.image_timestamp}"
}
