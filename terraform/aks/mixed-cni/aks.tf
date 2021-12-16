resource "azurerm_kubernetes_cluster" "mixed_cni" {
  name                = "${local.base_name}-aks"
  location            = data.azurerm_resource_group.mixed_cni.location
  resource_group_name = data.azurerm_resource_group.mixed_cni.name
  dns_prefix          = "${var.aks_cluster_dns_prefix}${resource.random_string.mixed_cni.result}"

  linux_profile {
    admin_username = var.linux_node_username
    ssh_key {
      key_data = var.linux_node_ssh_key
    }
  }

  network_profile {
    network_plugin = "azure"
  }

  default_node_pool {
    name       = "defpool"
    node_count = var.default_node_pool_count
    vm_size    = var.default_node_pool_vm_size
    vnet_subnet_id = local.subnet1_id
  }

  windows_profile {
    admin_username = var.windows_admin_name
    admin_password = var.windows_admin_password
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "mixed_cni" {
  name                  = "winpl1"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.mixed_cni.id
  vm_size               = var.win_pool_vm_size
  node_count            = var.win_pool_count
  os_type               = "Windows"
  vnet_subnet_id        = local.subnet2_id
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.mixed_cni.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.mixed_cni.kube_config_raw
  sensitive = true
}