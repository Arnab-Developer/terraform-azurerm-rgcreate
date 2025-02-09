variable "application_names" {
  type        = list(string)
  description = "Names of the applications."
}

variable "environment_names" {
  type        = list(string)
  description = "Names of the environments."
}

variable "locations" {
  type = object({
    primary   = string
    secondary = string
  })
  description = "Primary and secondary locations."
}
