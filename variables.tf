variable "applications" {
  type = list(string)
}

variable "environments" {
  type = list(string)
}

variable "locations" {
  type = object({
    primary   = string
    secondary = string
  })
}
