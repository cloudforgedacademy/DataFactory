variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  # default = {
  #   Environment        = "Development"
  #   Owner              = "CPE"
  # }
}

variable "resourcegroupname" {
  type = string
  #default = "eda-enterprisedata"
}


variable "location" {
  type = string
  #default = "canadaeast"
}

variable "env" {
  type        = string
  description = "Name of the environment"
  #default     = "test"
}

variable "datafactory_name" {
  type = string
  #default = "enterprisedata-datafactory"
}

variable "datafactory_int" {
  type = string
  #default = "enterprisedata-datafactory"
}

variable "integration_runtime_adfintegration" {}