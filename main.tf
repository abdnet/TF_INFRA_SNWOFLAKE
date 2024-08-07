terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "data_platform"

    workspaces {
      name = "DPF_DEV"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db" {
  name    = "DB_FROM_TF_1"
  comment = "Database for Snowflake Terraform demo"
}