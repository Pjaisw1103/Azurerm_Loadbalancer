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
🌍 <b>Azure Cloud Infrastructure</b><br>
└── 🗂️ <b>Resource Group</b> (`demo-rg`)<br>
  └── 🌐 <b>Virtual Network</b> (`demo-vnet`)<br>
    └── 🌱 <b>Subnets</b> (`frontend`, `backend`, `bastion`, `database`, `management`)<br>
      └── ⚙️ <b>Load Balancer</b> (`demo-lb`)<br>
        ├── 🌩️ <b>Public IP</b> (`demo-pip`)<br>
        ├── 🔗 <b>Backend Pool</b><br>
        ├── 🚪 <b>Health Probe</b><br>
        └── ⚖️ <b>Load Balancer Rule</b><br>
      └── 💻 <b>Virtual Machines</b> (VM1, VM2)<br>
      └── 🏰 <b>Bastion Host</b> (`demo-bastion`)<br>
      └── 🗄️ <b>SQL Server & Database</b> (`demo-sqlsrv`, `demo-db`)
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

<h2 align="center">🧹 Destroy Resources</h2> <p align="center"> When the environment is no longer needed, clean up all Azure resources: </p> <pre> terraform destroy -auto-approve </pre>

<hr>

<h2 align="center">💡 Key Highlights</h2> <ul> <li>🔁 Reusable modular design for scalability.</li> <li>⚖️ Automated Load Balancer setup for traffic distribution.</li> <li>🔒 Secure Bastion access without exposing VMs publicly.</li> <li>🧩 Dynamic subnet configuration.</li> <li>📊 Easily adaptable for multiple environments (Dev, QA, Prod).</li> <li>💾 SQL Server integration for backend data storage.</li> </ul>

<hr>

<h3 align="center">✨ Built with ❤️ using Terraform + Azure + DevOps ✨</h3>
