module "resource_group" {
  source              = "../azurerm_resource_group"
  resource_group_name = var.resource_group_name
}

module "storage_account" {
  depends_on           = [module.resource_group]
  source               = "../azurerm_storage_account"
  storage_account_name = var.storage_account_name
}

module "virtual_network" {
  depends_on           = [module.resource_group]
  source               = "../azurerm_virtual_network"
  virtual_network_name = var.virtual_network_name
}

module "subnet" {
  depends_on  = [module.virtual_network]
  source      = "../azurerm_subnet"
  subnet_name = var.subnet_name
}

module "nsg" {
  depends_on              = [module.subnet]
  source                  = "../azurerm_network_security_group"
  network_security_groups = var.network_security_groups
}


module "association" {
  depends_on         = [module.nsg]
  source             = "../azurerm_subnet_network_security_group_association"
  subnet_nsg_mapping = var.subnet_nsg_mapping

}

module "public_ip" {
  depends_on     = [module.nsg]
  source         = "../azurerm_public_ip"
  public_ip_name = var.public_ip_name

}

module "nic" {
  depends_on         = [module.public_ip]
  source             = "../azurerm_network_interface_card"
  network_interfaces = var.network_interfaces
}

# module "vms" {
#   depends_on           = [module.nic]
#   source               = "../azurerm_linux_virtual_machine"
#   virtual_machine_name = var.virtual_machine_name
#   network_interfaces   = var.network_interfaces
# }


# module "sql_server" {
#   depends_on = [module.vms]
#   source     = "../azurerm_sql_server"
#   sql_server = var.sql_server
# }

# module "sql_database" {
#   depends_on     = [module.sql_server]
#   source         = "../azurerm_sql_database"
#   mssql_database = var.mssql_database
# }





