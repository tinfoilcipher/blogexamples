resource "azurerm_app_service_plan" "tinfoilcontainers" {
    name                = "${var.container_prefix}-asp"
    location            = var.location
    resource_group_name = var.resource_group
    kind                = "Linux"
    reserved            = true

    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "tinfoilcontainers" {
    name                = "${var.container_prefix}-appservice"
    location            = var.location
    resource_group_name = var.resource_group
    app_service_plan_id = azurerm_app_service_plan.tinfoilcontainers.id

    site_config {
        app_command_line = ""
        linux_fx_version = "DOCKER|tinfoilcipher/bulletinboard:1.0"
    }

    app_settings = {
        "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
        "DOCKER_REGISTRY_SERVER_URL"          = "https://index.docker.io"
    }
}

resource "azurerm_app_service_custom_hostname_binding" "tinfoilcontainers" {
    hostname            = "board.tinfoilcipher.co.uk"
    app_service_name    = "${var.container_prefix}-appservice"
    resource_group_name = var.resource_group
}

output "container_uid" {
    value   = azurerm_app_service.tinfoilcontainers.id
}

output "container_name" {
    value   = azurerm_app_service.tinfoilcontainers.name
}

output "subscription_id" {
    value   = var.subscription_id
}

output "app_service_plan_name" {
    value   = azurerm_app_service_plan.tinfoilcontainers.name
}

output "container_resource_group" {
    value   = var.resource_group
}

resource "local_file" "ansible_vars" {
    content = <<EOT
---
tf_container_hostname: ${azurerm_app_service.tinfoilcontainers.name}
tf_container_uid: ${azurerm_app_service.tinfoilcontainers.id}
tf_subscriptionid: "${var.subscription_id}"
tf_container_app_service_plan_name: ${azurerm_app_service_plan.tinfoilcontainers.name}
tf_container_resourcegroup: ${var.resource_group}
...
EOT
    filename = "../ansible/ansible_vars.yml"
}
