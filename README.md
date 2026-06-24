
## Overview
This Terraform project creates an Azure Route Table and associates it with a subnet using simple terraform code.

## Resources Created

- Azure Resource Group
- Azure Virtual Network (VNet)
- Azure Subnet
- Azure Route Table
- Custom Route
- Route Table Association with Subnet

## Project Structure

```bash
13-terraform-azure-route-table/
│── main.tf
│── provider.tf
│── .gitignore
│── README.md
```

## Terraform Configuration

The configuration creates:

- Resource Group in Azure
- Virtual Network with address space `10.0.0.0/16`
- Subnet with address prefix `10.0.1.0/24`
- Route Table
- Route to allow internet traffic
- Route Table association with subnet

## Commands to Run

Initialize Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Preview execution plan:

```bash
terraform plan
```

Create resources:

```bash
terraform apply -auto-approve
```

## Author

Ranjeet Kumar
