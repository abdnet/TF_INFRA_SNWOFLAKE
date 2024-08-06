variable "roles" {
  description = "List of roles configurations."
  type = map(object({
    name = string
  }))
}

variable "users" {
  description = "List of users to grant the roles."
  type = list(string)
}

variable "inherited_roles" {
  description = "List of inherited roles for each role."
  type = list(string)
}
