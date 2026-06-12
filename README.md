<!-- 🌐 Terraform Azure Load Balancer Infrastructure -->

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&height=260&text=Azure%20Load%20Balancer%20Infrastructure&fontSize=38&fontAlignY=38&desc=Terraform%20%7C%20Azure%20Networking%20%7C%20High%20Availability&descSize=18&descAlignY=58&fontColor=ffffff&animation=fadeIn&color=0:0078D4,50:623CE4,100:0D1117"/>
</p>

<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?font=JetBrains+Mono&weight=600&size=22&duration=2500&pause=1000&color=0078D4&center=true&vCenter=true&width=900&lines=Terraform+Based+Azure+Infrastructure;Azure+Load+Balancer+%7C+Virtual+Network+%7C+Bastion;Modular+Infrastructure+as+Code;Scalable+%26+Secure+Cloud+Networking"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Terraform-623CE4?style=for-the-badge&logo=terraform&logoColor=white"/>
  <img src="https://img.shields.io/badge/Microsoft%20Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white"/>
  <img src="https://img.shields.io/badge/IaC-Infrastructure%20as%20Code-0D1117?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Status-Active-22C55E?style=for-the-badge"/>
</p>

---

## 📌 Project Overview

This project provisions a complete **Azure Load Balancer infrastructure** using **Terraform modules**.

It includes networking, compute, secure access, traffic distribution, and database resources in a modular Infrastructure as Code structure.

---

## 🧱 Architecture

```text
Azure Cloud
│
├── Resource Group
│   └── demo-rg
│
├── Virtual Network
│   └── demo-vnet
│       ├── frontend-subnet
│       ├── backend-subnet
│       ├── bastion-subnet
│       ├── database-subnet
│       └── management-subnet
│
├── Public Load Balancer
│   ├── Public IP
│   ├── Backend Address Pool
│   ├── Health Probe
│   └── Load Balancing Rule
│
├── Virtual Machines
│   ├── VM1
│   └── VM2
│
├── Azure Bastion
│   └── Secure VM Access
│
└── Azure SQL
    ├── SQL Server
    └── SQL Database
```

---

## ✨ Key Features

| Feature                  | Description                                 |
| ------------------------ | ------------------------------------------- |
| 🌐 Azure Virtual Network | Isolated network environment for resources  |
| ⚖️ Azure Load Balancer   | Distributes traffic across backend VMs      |
| 💻 Virtual Machines      | Backend compute resources for workloads     |
| 🏰 Azure Bastion         | Secure VM access without public IP exposure |
| 🗄️ Azure SQL Database   | Managed database layer                      |
| 🏗️ Terraform Modules    | Reusable modular infrastructure components  |
| 🔐 Secure Networking     | Subnet-based resource separation            |

---

## 🛠️ Tech Stack

<p align="center">
  <img src="https://skillicons.dev/icons?i=azure,terraform,linux,git,github,vscode"/>
</p>

| Tool                    | Purpose                     |
| ----------------------- | --------------------------- |
| **Terraform**           | Infrastructure provisioning |
| **Microsoft Azure**     | Cloud platform              |
| **Azure Load Balancer** | Traffic distribution        |
| **Azure Bastion**       | Secure remote access        |
| **Azure SQL**           | Managed database            |
| **GitHub**              | Version control             |

---

## 📁 Project Structure

```text
Azure_LoadBalancer_Project/
│
├── Environment/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars
│   └── README.md
│
└── Module/
    ├── azurerm_resource_group/
    │   └── main.tf
    ├── azurerm_virtual_network/
    │   └── main.tf
    ├── azurerm_subnet/
    │   └── main.tf
    ├── azurerm_public_ip/
    │   └── main.tf
    ├── azurerm_loadbalancer/
    │   └── main.tf
    ├── azurerm_lb_association/
    │   └── main.tf
    ├── azurerm_virtual_machine/
    │   └── main.tf
    ├── azurerm_bastion/
    │   └── main.tf
    ├── azurerm_mssql_server/
    │   └── main.tf
    └── azurerm_mssql_database/
        └── main.tf
```

---

## ⚙️ Prerequisites

Before deploying this project, make sure you have:

* Terraform `v1.5+`
* Azure CLI installed
* Active Azure subscription
* Azure account logged in using:

```bash
az login
```

* Required permissions to create:

  * Resource Groups
  * Virtual Networks
  * Load Balancers
  * Virtual Machines
  * Bastion Host
  * Azure SQL resources

---

## 🚀 Deployment Guide

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/Pjaisw1103/Azure_LoadBalancer_Project.git
cd Azure_LoadBalancer_Project/Environment
```

### 2️⃣ Initialize Terraform

```bash
terraform init
```

### 3️⃣ Format Terraform Code

```bash
terraform fmt -recursive
```

### 4️⃣ Validate Configuration

```bash
terraform validate
```

### 5️⃣ Preview Infrastructure

```bash
terraform plan
```

### 6️⃣ Deploy Resources

```bash
terraform apply -auto-approve
```

### 7️⃣ View Outputs

```bash
terraform output
```

---

## 📤 Terraform Outputs

```hcl
output "rg_name" {
  value       = module.azurerm-rg.rg-name
  description = "Name of the Resource Group"
}

output "vnet_name" {
  value       = module.azurerm-vnet.vnet-name
  description = "Name of the Virtual Network"
}

output "load_balancer_name" {
  value       = module.azurerm-lb.lb-name
  description = "Name of the Azure Load Balancer"
}

output "public_ip_name" {
  value       = module.azurerm-pip.pip-name
  description = "Public IP used by Load Balancer"
}

output "bastion_name" {
  value       = module.azurerm-bastion.bastion-name
  description = "Name of the Bastion Host"
}

output "sql_server_name" {
  value       = module.azurerm-sqlserver.sqlserver-name
  description = "Name of the SQL Server"
}

output "database_name" {
  value       = module.azurerm-sqldb.sqldb-name
  description = "Name of the SQL Database"
}
```

---

## 🧹 Destroy Infrastructure

To remove all deployed Azure resources:

```bash
terraform destroy -auto-approve
```

---

## 📌 Use Cases

* Azure networking practice
* Terraform modular infrastructure learning
* Load balancer architecture demo
* DevOps portfolio project
* Infrastructure as Code implementation

---

## ✅ Project Highlights

* Built using modular Terraform structure
* Includes Azure networking and compute resources
* Implements public Load Balancer architecture
* Uses Bastion for secure VM access
* Includes SQL Server and Database provisioning
* Suitable for DevOps and Cloud portfolio demonstration

---

## 🤝 Author

<p align="center">
  <b>Priya Jaiswal</b><br/>
  Azure Cloud & DevOps Enthusiast
</p>

<p align="center">
  <a href="https://github.com/Pjaisw1103">
    <img src="https://img.shields.io/badge/GitHub-Pjaisw1103-0D1117?style=for-the-badge&logo=github"/>
  </a>
  <a href="https://linkedin.com/in/priya-jaiswal1103">
    <img src="https://img.shields.io/badge/LinkedIn-Priya%20Jaiswal-0078D4?style=for-the-badge&logo=linkedin"/>
  </a>
</p>

---

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&height=120&section=footer&color=0:0D1117,50:623CE4,100:0078D4"/>
</p>
