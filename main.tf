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

module "roles" {
  source = "./modules/roles"
  roles = {
    dev = {
      name = "RL_DPF_RW_BDRT_DEV"
    }
    prod = {
      name = "RL_DPF_RW_BDRT_PROD"
    }
    tst = {
      name = "RL_DPF_RW_BDRT_TST"
    }
  }
  users = module.users.user_names
}

module "databases" {
  source = "./modules/databases"
  databases = {
    dev = {
      name = "DPF_BDRT_DEV"
    }
    prod = {
      name = "DPF_BDRT_PROD"
    }
    tst = {
      name = "DPF_BDRT_TST"
    }
  }
  schemas = {
    dev = {
      name     = "PUBLIC"
      database = "DPF_BDRT_DEV"
    }
    prod = {
      name     = "PUBLIC"
      database = "DPF_BDRT_PROD"
    }
    tst = {
      name     = "PUBLIC"
      database = "DPF_BDRT_TST"
    }
  }
  database_privileges = [
    {
      privilege = "ALL"
      database  = "DPF_BDRT_DEV"
      roles     = [module.roles.role_names["dev"]]
    },
    {
      privilege = "ALL"
      database  = "DPF_BDRT_PROD"
      roles     = [module.roles.role_names["prod"]]
    },
    {
      privilege = "ALL"
      database  = "DPF_BDRT_TST"
      roles     = [module.roles.role_names["tst"]]
    }
  ]
  schema_privileges = [
    {
      privilege = "ALL"
      schema    = "PUBLIC"
      roles     = [module.roles.role_names["dev"]]
    },
    {
      privilege = "ALL"
      schema    = "PUBLIC"
      roles     = [module.roles.role_names["prod"]]
    },
    {
      privilege = "ALL"
      schema    = "PUBLIC"
      roles     = [module.roles.role_names["tst"]]
    }
  ]
}
