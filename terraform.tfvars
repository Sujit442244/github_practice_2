subscription_id = "4972e01e-b3c0-45e3-becf-c21112caced1"
# Replace with your Azure subscription ID

resource_group_name = {
  todo = {
    name     = "todo_application_rg"
    location = "korea central"
    tags = {
      environment = "Development"
      project     = "Management_1"
    }
  }
}

storage_account_name = {
  todostorageaccount = {
    name                             = "todostorageaccountmt34"
    resource_group_name              = "todo_application_rg"
    location                         = "korea central"
    account_tier                     = "Standard"
    account_replication_type         = "LRS"
    is_public_network_access_enabled = true

  }
}

virtual_network_name = {
  vnet_for_todo = {
    name                = "vnet_for_todo"
    resource_group_name = "todo_application_rg"
    location            = "korea central"
    address_space       = ["10.0.1.0/24"]
  }
}

subnet_name = {
  frontend_todo = {
    name                 = "todo_frontend_subnet"
    resource_group_name  = "todo_application_rg"
    virtual_network_name = "vnet_for_todo"
    address_prefixes     = ["10.0.1.0/26"]

  }

  backend_todo = {
    name                 = "todo_backend_subnet"
    resource_group_name  = "todo_application_rg"
    virtual_network_name = "vnet_for_todo"
    address_prefixes     = ["10.0.1.64/26"]

  }
}


network_security_groups = {
  nsg1 = {
    name                = "virtualmachines_nsg_frontend"
    location            = "korea central"
    resource_group_name = "todo_application_rg"

  }

  nsg2 = {
    name                = "virtualmachines_nsg_backend"
    location            = "korea central"
    resource_group_name = "todo_application_rg"

  }

}


subnet_nsg_mapping = {
  frontend = {
    resource_group_name  = "todo_application_rg"
    virtual_network_name = "vnet_for_todo"
    subnet_name          = "todo_frontend_subnet"
    nsg_name             = "virtualmachines_nsg_frontend"
  }

  backend = {
    resource_group_name  = "todo_application_rg"
    virtual_network_name = "vnet_for_todo"
    subnet_name          = "todo_backend_subnet"
    nsg_name             = "virtualmachines_nsg_backend"
  }
}

public_ip_name = {
  todo_fontend_public_ip = {
    name                = "todo_frontend_public_ip"
    resource_group_name = "todo_application_rg"
    location            = "korea central"
    allocation_method   = "Static"
    sku                 = "Standard"
  },

  todo_backend_public_ip = {
    name                = "todo_backend_public_ip"
    resource_group_name = "todo_application_rg"
    location            = "korea central"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

       todo_frontend2_public_ip = {
        name                = "todo_frontend2_public_ip"
        resource_group_name = "todo_application_rg"
        location            = "korea central"
        allocation_method   = "Static"
        sku                 = "Standard"
    }
}



network_interfaces = {
  frontend-nic = {
    name                          = "frontend-nic"
    location                      = "korea central"
    resource_group_name           = "todo_application_rg"
    subnet_name                   = "todo_frontend_subnet"
    public_ip_name                = "todo_frontend_public_ip"
    ip_configuration_name         = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    virtual_network_name          = "vnet_for_todo"
  }

  backend-nic = {
    name                          = "backend-nic"
    location                      = "korea central"
    resource_group_name           = "todo_application_rg"
    subnet_name                   = "todo_backend_subnet"
    public_ip_name                = "todo_backend_public_ip"
    ip_configuration_name         = "ipconfig2"
    private_ip_address_allocation = "Dynamic"
    virtual_network_name          = "vnet_for_todo"
  }

  frontend2-nic= {
    name                          = "frontend2-nic"
    location                      = "korea central"
    resource_group_name           = "todo_application_rg"
    subnet_name                   = "todo_frontend_subnet"
    public_ip_name                = "todo_frontend2_public_ip"
    ip_configuration_name         = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    virtual_network_name         = "vnet_for_todo"
  }
}


# virtual_machine_name = {
#   todofrontendvm1 = {
#     name                = "todofrontendvm1"
#     resource_group_name = "todo_application_rg"
#     location            = "korea central"
#     size                = "Standard_B2s"
#     admin_username      = "dudu1"
#     admin_password      = "dudu@12345##"
#     nic_key             = "frontend-nic"
#     nginx_install = false
   
 
#   }

#   todobackendvm1 = {
#     name                = "todobackendvm1"
#     resource_group_name = "todo_application_rg"
#     location            = "korea central"
#     size                = "Standard_B2s"
#     admin_username      = "dudu1"
#     admin_password      = "dudu@12345##"
#     nic_key           = "backend-nic"
#     nginx_install = false
      
# }

#    todofrontendvm2 = {
#     name                = "todofrontendvm2"
#     resource_group_name = "todo_application_rg"
#     location            = "korea central"
#     size                = "Standard_B2s"
#     admin_username      = "dudu1"
#     admin_password      = "dudu@12345##"
#     nic_key             = "frontend2-nic"
#     nginx_install = true
   
# }
# }


# sql_server = {
#   server_1 = {
#     name                       = "sujitsqlserver"
#     resource_group_name        = "todo_application_rg"
#     location                   = "korea central"
#     version                    = "12.0"
#     admin_secret_name          = "user1"
#     admin_password_secret_name = "passuser1"
#     key_vault_name             = "users-and-password"

#   }
# }



# mssql_database = {
#   database1 = {

#     name                = "dudukadatabase"
#     collation           = "SQL_Latin1_General_CP1_CI_AS"
#     license_type        = "LicenseIncluded"
#     max_size_gb         = "2"
#     sku_name            = "Basic"
#     enclave_type        = "Default"
#     server_key          = "server_1"
#     resource_group_name = "todo_application_rg"
#     sql_server_name     = "sujitsqlserver"

#   }

# }