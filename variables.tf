variable "subscription_id" {
  type        = string
  description = "description"
}

variable "resource_group_name" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)

  }))
}


variable "storage_account_name" {
  type = map(object({
    name                             = string
    resource_group_name              = string
    location                         = string
    account_tier                     = string
    account_replication_type         = string
    access_tier                      = optional(string)
    is_public_network_access_enabled = optional(bool)
  }))
  description = "Map of storage account configurations"
}

variable "virtual_network_name" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
  }))
  description = "Name of the virtual network"
}

variable "subnet_name" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "network_security_groups" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

  }))
}


variable "subnet_nsg_mapping" {
  description = "Subnet → NSG mapping with RG/VNet info"
  type = map(object({
    resource_group_name  = string
    virtual_network_name = string
    subnet_name          = string
    nsg_name             = string
  }))
}


variable "public_ip_name" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    sku                 = string

  }))
  description = "Name of the public IP"
}


variable "network_interfaces" {
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    subnet_name                   = string
    public_ip_name                = string
    ip_configuration_name         = string
    private_ip_address_allocation = string
    virtual_network_name          = string
  }))
}

# variable "virtual_machine_name" {
#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string
#     size                = string
#     admin_username      = string
#     admin_password      = string
#     nic_key             = string
#     nginx_install = bool


#   }))
# }


# variable "sql_server" {
#   type = map(object({
#     name                       = string
#     resource_group_name        = string
#     location                   = string
#     version                    = string
#     admin_secret_name          = string
#     admin_password_secret_name = string
#     key_vault_name             = string

#   }))
# }


# variable "mssql_database" {
#   type = map(object({
#     name                = string
#     server_key          = string
#     collation           = string
#     license_type        = string
#     max_size_gb         = string
#     sku_name            = string
#     enclave_type        = string
#     resource_group_name = string
#     sql_server_name     = string

#   }))

# }




