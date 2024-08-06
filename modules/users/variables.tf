variable "users" {
  description = "List of user configurations."
  type = map(object({
    name     = string
    password = string
    role     = string
  }))
}
