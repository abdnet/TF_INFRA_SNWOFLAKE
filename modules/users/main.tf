resource "snowflake_user" "this" {
  for_each = var.users

  name     = each.value.name
  password = each.value.password
}

resource "snowflake_role_grants" "user_role_grants" {
  for_each = var.users

  role_name = each.value.role
  users     = [snowflake_user.this[each.key].name]
}
