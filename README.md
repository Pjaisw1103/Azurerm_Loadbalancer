<h1 align="center">🌐✨ Terraform Azure Load Balancer Infrastructure ✨🌐</h1>

<p align="center">
  <a href="https://www.terraform.io/">
    <img src="https://img.shields.io/badge/Terraform-623CE4?style=for-the-badge&logo=terraform&logoColor=white"/>
  </a>
  <a href="https://azure.microsoft.com/">
    <img src="https://img.shields.io/badge/Azure-0078D4?style=for-the-badge&logo=microsoft-azure&logoColor=white"/>
  </a>
  <a href="https://devops.com/">
    <img src="https://img.shields.io/badge/DevOps-F05032?style=for-the-badge&logo=devops&logoColor=white"/>
  </a>
</p>

---

## 🧭 Architecture Overview

<p align="center">
<pre>

🌍  Azure Cloud Infrastructure
└── 🗂️  Resource Group (demo-rg)
    └── 🌐  Virtual Network (demo-vnet)
        └── 🌱  Subnets (frontend, backend, bastion, database, management)
            ├── ⚙️  Load Balancer (demo-lb)
            │   ├── 🌩️  Public IP (demo-pip)
            │   ├── 🔗  Backend Pool
            │   ├── 🚪  Health Probe
            │   └── ⚖️  Load Balancer Rule
            ├── 💻  Virtual Machines (VM1, VM2)
            ├── 🏰  Bastion Host (demo-bastion)
            └── 🗄️  SQL Server & Database (demo-sqlsrv, demo-db)

</pre>
</p>

<details>
<summary><b>📘 Explanation</b></summary>

- 🗂️ **Resource Group** acts as a logical container for all Azure resources.  
- 🌐 **Virtual Network (VNet)** provides network isolation for resources.  
- 🌱 **Subnets** logically divide the network for frontend, backend, database, and management traffic.  
- ⚙️ **Load Balancer** distributes traffic across backend VMs for high availability.  
- 🌩️ **Public IP** enables external access to the Load Balancer.  
- 💻 **Virtual Machines** host application workloads.  
- 🏰 **Bastion Host** enables secure RDP/SSH access without public IPs on VMs.  
- 🗄️ **Azure SQL Server & Database** manage persistent data.  

</details>

---

## 📁 Project Structure

<pre>
Environment/
├── main.tf          # Calls all module blocks
├── provider.tf      # Azure provider configuration
├── variables.tf     # Input variables for modular setup
├── outputs.tf       # Outputs for created resources
├── terraform.tfvars # Variable values for environment
└── README.md        # Documentation

Module/
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
</pre>

---

<h2 align="center">⚙️ Prerequisites</h2>

<ul>
<li>✅ Terraform installed (<code>v1.5+</code>)</li>
<li>✅ Azure CLI configured (<code>az login</code>)</li>
<li>✅ Active Azure Subscription</li>
<li>✅ Proper role permissions to create Networking, Compute, and SQL resources</li>
</ul>

---

<h2 align="center">🚀 Deployment Steps</h2>

<ol>
<li><b>Clone the Repository:</b>
<pre>
git clone https://github.com/Pjaisw1103/Azure_LoadBalancer_Project.git
cd Azure_LoadBalancer_Project/Environment
</pre>
</li>

<li><b>Initialize Terraform:</b>
<pre>
terraform init
</pre>
</li>

<li><b>Validate Configuration:</b>
<pre>
terraform validate
</pre>
</li>

<li><b>Plan Deployment:</b>
<pre>
terraform plan
</pre>
</li>

<li><b>Apply Infrastructure:</b>
<pre>
terraform apply -auto-approve
</pre>
</li>

<li><b>Check Outputs:</b>
<pre>
Outputs:
rg_name              = "demo-rg"
vnet_name            = "demo-vnet"
load_balancer_name   = "demo-lb"
public_ip_name       = "demo-pip"
bastion_name         = "demo-bastion"
sql_server_name      = "demo-sqlsrv"
database_name        = "demo-db"
</pre>
</li>
</ol>

---

<h2 align="center">📤 Terraform Output Block Example</h2>

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

<hr>

<h2>🧹 Destroy Resources</h2>

<p>When you’re done testing or deploying, you can clean up all created resources using:</p>

<pre><code>terraform destroy -auto-approve</code></pre>

<p><b>Note:</b> Always double-check your current workspace (Dev or Prod) before destroying resources to avoid accidental deletions.</p>

<hr>

<h2>🤝 Contribution</h2>

<p>
  Contributions are always welcome!<br>
  If you’d like to enhance or extend this project, please fork the repo and submit a pull request.
</p>

<hr>

<h2>🛡️ License</h2>

<p>This project is licensed under the <b>MIT License</b>.</p>

<hr>

<p align="center">
  Made with ❤️ using <b>Terraform</b> and <b>Microsoft Azure</b>.<br>
  <i>Automate • Deploy • Manage • Scale</i>
</p>
