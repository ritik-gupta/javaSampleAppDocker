resource "azurerm_private_endpoint" "example" {
  name                = "postgres-aks-test-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.this.id

  private_service_connection {
    name                           = "postgres-aks-privateserviceconnection"
    private_connection_resource_id = azurerm_postgresql_server.this.id
    subresource_names              = ["postgresqlServer"]
    is_manual_connection           = false
  }
}