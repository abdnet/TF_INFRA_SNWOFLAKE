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

module "users" {
  source = "./modules/users"
  users = {
    dev = {
      name     = "USR_DPF_DBT_SRV_DEV"
      password = "password"
      role     = "RL_DPF_RW_BDRT_DEV"
    }
    prod = {
      name     = "USR_DPF_DBT_SRV_PROD"
      password = "password"
      role     = "RL_DPF_RW_BDRT_PROD"
    }
    tst = {
      name     = "USR_DPF_DBT_SRV_TST"
      password = "password"
      role     = "RL_DPF_RW_BDRT_TST"
    }
  }
}

