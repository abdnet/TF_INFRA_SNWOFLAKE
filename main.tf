terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
    }
  }
}

provider "snowflake" {
  account                = "lw22623" # required if not using profile. Can also be set via SNOWFLAKE_ACCOUNT env var
  username               = "TF_USR_DEV" # required if not using profile or token. Can also be set via SNOWFLAKE_USER env var
  password               = "changeme"
  region                 = "eu-west-3.aws"
}

provider "snowflake" {
  profile = "securityadmin"
}

resource "snowflake_database" "demo_db" {
  name    = "DB_FROM_TF_1"
  comment = "Database for Snowflake Terraform demo"
}