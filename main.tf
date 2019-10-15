resource "azurerm_app_service_plan" "cursodevops" {
  name                = "cursodevops_alex"
  location            = "West Europe"
  resource_group_name = "CursoDevOps"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "test" {
  name                = "cursodevops_alex"
  location            = "West europe"
  resource_group_name = "cursodevops"
  app_service_plan_id = "cursodevops"

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}
