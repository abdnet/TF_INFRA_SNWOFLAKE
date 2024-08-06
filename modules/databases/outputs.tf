output "database_names" {
  value = { for d in snowflake_database.this : d.name => d.name }
}

output "schema_names" {
  value = { for s in snowflake_schema.this : s.name => s.name }
}
