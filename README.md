# 📦 Azure Storage Account Generic Module

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&height=240&text=Azure%20Storage%20Account%20Module&fontSize=40&fontAlignY=40&desc=Terraform%20%7C%20Azure%20Storage%20%7C%20Reusable%20Infrastructure&descAlignY=60&fontColor=ffffff&animation=fadeIn&color=0:0078D4,50:623CE4,100:0D1117"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Terraform-v1.5+-623CE4?style=for-the-badge&logo=terraform&logoColor=white"/>
  <img src="https://img.shields.io/badge/Azure-Provider%204.x-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white"/>
  <img src="https://img.shields.io/badge/Module-Reusable-success?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Status-Production%20Ready-22C55E?style=for-the-badge"/>
</p>

---

## 📌 Overview

A reusable Terraform module for provisioning **Azure Storage Accounts** and their associated resources using a single configuration.

This module supports:

* Blob Containers
* File Shares
* Storage Queues
* Storage Tables
* Managed Identity
* Network Rules
* Enterprise Security Controls

Built using modern Terraform features such as `for_each`, `optional()`, `dynamic blocks`, and object-based configurations.

---

## 🏗️ Architecture

```mermaid
flowchart TD

A[Terraform Configuration]
--> B[Generic Storage Module]

B --> C[Storage Account]

C --> D[Blob Containers]
C --> E[File Shares]
C --> F[Queues]
C --> G[Tables]

C --> H[Managed Identity]
C --> I[Network Rules]
```

---

## ✨ Key Features

| Feature                 | Description                                         |
| ----------------------- | --------------------------------------------------- |
| 📦 Generic Module       | Manage multiple storage accounts using a single map |
| 🔄 Reusable Design      | Eliminates repetitive Terraform code                |
| ☁️ Azure Native         | Built specifically for Azure Storage services       |
| 🔐 Security First       | Supports TLS, Managed Identity & Firewalls          |
| ⚡ Dynamic Configuration | Uses dynamic blocks and optional attributes         |
| 🚀 Enterprise Ready     | Suitable for production deployments                 |

---

## 📊 Module Capabilities

<p align="center">

<img src="https://img.shields.io/badge/Blob%20Containers-Supported-0078D4?style=for-the-badge"/>

<img src="https://img.shields.io/badge/File%20Shares-Supported-623CE4?style=for-the-badge"/>

<img src="https://img.shields.io/badge/Queues-Supported-success?style=for-the-badge"/>

<img src="https://img.shields.io/badge/Tables-Supported-orange?style=for-the-badge"/>

</p>

---

## 📂 Project Structure

```text
Storage_Account/
│
├── provider.tf
├── resource.tf
├── storage.tf
├── variables.tf
├── terraform.tfvars
└── README.md
```

---

## 🚀 Usage

### Module Configuration

```hcl
module "storage_accounts" {
  source = "./Storage_Account"

  strg = var.strg
}
```

---

### Example Configuration

```hcl
strg = {

  my_storage = {

    name                     = "stgenericdemo001"

    resource_group_name      = "storage-rg"

    location                 = "West Europe"

    account_tier             = "Standard"

    account_replication_type = "LRS"

    containers = {
      data = {
        name        = "app-data"
        access_type = "private"
      }
    }
  }
}
```

---

## 🛠️ Supported Resources

| Resource         | Supported |
| ---------------- | --------- |
| Storage Account  | ✅         |
| Blob Containers  | ✅         |
| File Shares      | ✅         |
| Queues           | ✅         |
| Tables           | ✅         |
| Managed Identity | ✅         |
| Network Rules    | ✅         |
| Private Access   | ✅         |

---

## ⚙️ Deployment

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Preview Changes

```bash
terraform plan -out=tfplan
```

### Apply Infrastructure

```bash
terraform apply tfplan
```

---

## 📤 Outputs

```hcl
output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}
```

Example:

```text
storage_account_name = "stgenericdemo001"
```

---

## 🔐 Security Features

* TLS 1.2 Enforcement
* Managed Identity Support
* Network Access Restrictions
* Azure Firewall Compatibility
* Secure Storage Defaults

---

## 📈 Why Use This Module?

* Reduces Terraform code duplication
* Supports enterprise-scale deployments
* Simplifies storage resource management
* Uses modern Terraform design patterns
* Easy to extend and maintain

---

## 🎯 Learning Outcomes

* Terraform Module Design
* Azure Storage Services
* Dynamic Blocks
* Object-Based Variables
* Infrastructure as Code
* Enterprise Terraform Patterns

---

## 👩‍💻 Author

**Priya Jaiswal**

Azure Cloud | DevOps | Terraform

<p align="center">
  <a href="https://github.com/Pjaisw1103">
    <img src="https://img.shields.io/badge/GitHub-Pjaisw1103-181717?style=for-the-badge&logo=github"/>
  </a>

  <a href="https://linkedin.com/in/priya-jaiswal1103">
    <img src="https://img.shields.io/badge/LinkedIn-Priya%20Jaiswal-0078D4?style=for-the-badge&logo=linkedin"/>
  </a>
</p>

---

<p align="center">
⭐ If this module helped you, consider giving it a star.
</p>
