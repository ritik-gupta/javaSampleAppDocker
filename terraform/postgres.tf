resource "azurerm_postgresql_server" "this" {
  name                = "aks-test-psqlserver"
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login          = "quarkus_test"
  administrator_login_password = "demo@1234"

  sku_name   = "GP_Gen5_4"
  version    = "11"
  storage_mb = 5120

  backup_retention_days = 7

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}