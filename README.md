# HUG Lagos/Ibadan Terraform Challenge – Week Three Project

## Project 3: Deploy a Two-Tier Application on Azure

### Objective
Provision a secure, two-tier environment on Azure using Terraform that follows infrastructure best practices.

---

## Learning Outcomes
- Design and provision secure networking on Azure
- Deploy multiple cloud services with Terraform
- Apply least-privilege security group rules
- Organize Terraform code using modules
- Use variables and outputs effectively
- Store Terraform state remotely

---

## Requirements Implemented

### Networking
- One Virtual Network (VNet)
- One public subnet
- One private subnet
- One Internet Gateway
- One NAT Gateway
- Public and private route tables with associations

### Compute
- One VM in the public subnet running Nginx
- Startup script deploys a simple HTML page

### Database
- MySQL Flexible Server in the private subnet
- Public access disabled
- Storage and instance class configured via variables

### Security Groups
- HTTP/HTTPS (port 80) accessible from the Internet
- SSH (port 22) restricted to my IP
- Database accepts connections only from the compute instance SG
- Database not publicly accessible

---

## Project Structure
- `modules/` → reusable Terraform modules (network, compute, database, security)
- `variables.tf` → input variables
- `outputs.tf` → outputs for resource references
- `main.tf` → root configuration
- `backend.tf` → remote state configuration
- `README.md` → project documentation

---

## Deployment Instructions
1. Clone the repository:
   ```bash
   git clone <repo-url>
   cd project3

- Initialize Terraform:

```
terraform init
```
- Validate configuration:
```
terraform validate
```
- Apply configuration:
```
terraform apply
```
- Destroy resources when done:
```
terraform destroy
```

### Results

- Virtual Network

!["webserver"](./vnet.png/Web-project2.png)

- Server Running

!["webserver"](./images/Web-project2.png)

- Database Server

!["webserver"](./images/Web-project2.png)

- Webpage

!["webserver"](./images/Web-project2.png)