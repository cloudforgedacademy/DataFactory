![PNG LOGO](https://github.com/user-attachments/assets/e0fba218-6059-4c69-9d46-c9354e392b93)

#         Deploying Azure Data Factory with Integration Runtime and Private Endpoint

This project uses Terraform to provision an Azure Data Factory (ADF) instance with:

* A system-assigned managed identity
* An Azure Integration Runtime
* A managed private endpoint to securely connect to other Azure resources (e.g., Databricks)

---

## 📁 Terraform Resources Used

### 1. `azurerm_data_factory`

Creates the ADF instance with the following settings:

* **Name**: Defined by `var.datafactory_name`
* **Location**: Defined by `var.location`
* **Resource Group**: Defined by `var.resourcegroupname`
* **Public Network Access**: Enabled
* **Managed Virtual Network**: Enabled
* **Identity**: System-assigned
* **Tags**: Passed via `var.tags`

### 2. `azurerm_data_factory_integration_runtime_azure`

Creates an auto-resolving Azure Integration Runtime:

* **Location**: `Canada Central`
* **TTL**: 60 minutes
* **Compute Type**: General
* **Core Count**: 8
* **Virtual Network Enabled**: Yes
* **Cleanup Enabled**: Yes

### 3. `azurerm_data_factory_managed_private_endpoint`

Creates a private endpoint from the Data Factory to securely connect to a target resource:

* **Subresource Name**: `databricks_ui_api`
* **Target Resource ID**: Must be provided
* **Data Factory ID**: References the ADF instance created

---

##  Required Variables

| Variable            | Description                           |
| ------------------- | ------------------------------------- |
| `datafactory_name`  | The name of the Azure Data Factory    |
| `location`          | Azure region (e.g., `Canada Central`) |
| `resourcegroupname` | The name of the resource group        |
| `tags`              | A map of tags for the ADF resource    |

---

## 🚀 Usage Example

```hcl
module "datafactory" {
  source              = "./modules/datafactory"
  datafactory_name    = "example-adf"
  location            = "Canada Central"
  resourcegroupname   = "example-rg"
  tags = {
    environment = "dev"
    team        = "data"
  }
}
```

##  Contact

**Oluseyi Sunny-Okundia**
Cloud Engineer | YouTube: [Cloudforged with Seyi](https://www.youtube.com/@cloudforgedwithseyi)
📧 [oluseyi@cloudforgedacademy.ca](mailto:oluseyi@cloudforgedacademy.ca)

---

## 📄 License

MIT License. Use at your own discretion.

```
