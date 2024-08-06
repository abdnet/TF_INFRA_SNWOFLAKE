resource "snowflake_database" "this" {
  for_each = var.databases

  name = each.value.name
}

resource "snowflake_schema" "this" {
  for_each = var.schemas

  name     = each.value.name
  database = each.value.database
}

resource "snowflake_grant" "database_privileges" {
  for_each = var.database_privileges

  privilege = each.value.privilege
  database  = each.value.database
  roles     = each.value.roles
}

resource "snowflake_grant" "schema_privileges" {
  for_each = var.schema_privileges

  privilege = each.value.privilege
  schema    = each.value.schema
  roles     = each.value.roles
}
