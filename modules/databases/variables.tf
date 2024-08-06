variable "databases" {
  description = "List of databases configurations."
  type = map(object({
    name = string
  }))
}

variable "schemas" {
  description = "List of schemas configurations."
  type = map(object({
    name     = string
    database = string
  }))
}

variable "database_privileges" {
  description = "Privileges for databases."
  type = list(object({
    privilege = string
    database  = string
    roles     = list(string)
  }))
}

variable "schema_privileges" {
  description = "Privileges for schemas."
  type = list(object({
    privilege = string
    schema    = string
    roles     = list(string)
  }))
}
