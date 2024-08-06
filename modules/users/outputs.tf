output "user_names" {
  value = { for u in snowflake_user.this : u.name => u.name }
}
