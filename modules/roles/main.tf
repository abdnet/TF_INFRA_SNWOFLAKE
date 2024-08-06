resource "snowflake_role" "this" {
  for_each = var.roles

  name = each.value.name
}

resource "snowflake_role_grants" "role_grants" {
  for_each = var.roles

  role_name = snowflake_role.this[each.key].name
  users     = var.users
  roles     = var.inherited_roles
}
