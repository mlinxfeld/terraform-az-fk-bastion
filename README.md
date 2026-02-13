# terraform-az-fk-bastion

This repository contains a reusable **Terraform / OpenTofu module** and a focused example for deploying **Azure Bastion** to provide secure, audited access to private workloads without public IPs.

It is part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and is designed as a dedicated **secure access layer** for Azure workloads.

---

## 🎯 Purpose

The goal of this repository is to provide a **clear, educational, and composable reference implementation** for **Azure Bastion** using Infrastructure as Code.

It focuses on:

- Azure Bastion as a **secure operator access layer**
- Explicit deployment in **AzureBastionSubnet**
- Optional native **tunneling** and **IP connect** (Standard SKU)
- Clear separation between **access**, **networking**, and **compute**

This is **not** a landing zone or platform framework.  
It is a **learning-first building block** designed to integrate cleanly with other FoggyKitchen modules.

---

## ✨ What the module does

Depending on configuration, the module can:

- Create an **Azure Bastion Host**
- Create a **Standard Public IP** for Bastion (optional)
- Enable **tunneling** and **IP connect** features

The module intentionally does **not** create or manage:

- Virtual Networks or subnets (handled by `terraform-az-fk-vnet`)
- Network Security Groups (handled by `terraform-az-fk-nsg`)
- Virtual Machines (handled by `terraform-az-fk-compute`)
- Load Balancers (handled by `terraform-az-fk-loadbalancer`)
- NAT Gateway (handled by `terraform-az-fk-natgw`)

Each of those concerns belongs in its own dedicated module.

---

## ⚙️ Subnet Requirements

Azure Bastion **must** be deployed into a subnet named `AzureBastionSubnet`.
For Standard SKU, Microsoft recommends a dedicated subnet with a **/26 or larger** address space.

Example:

```hcl
subnets = {
  AzureBastionSubnet = {
    address_prefixes = ["10.10.2.0/26"]
  }
}
```

---

## 📂 Repository Structure

```bash
terraform-az-fk-bastion/
├── examples/
│   └── 01_private_vm_with_bastion_access/
├── main.tf
├── inputs.tf
├── outputs.tf
├── versions.tf
├── LICENSE
└── README.md
```

---

## 🚀 Example Usage

```hcl
module "bastion" {
  source = "git::https://github.com/mlinxfeld/terraform-az-fk-bastion.git?ref=v1.0.0"

  name                = "fk-bastion"
  location            = "westeurope"
  resource_group_name = "fk-rg"

  subnet_id = module.vnet.subnet_ids["AzureBastionSubnet"]

  sku                = "Standard"
  tunneling_enabled  = true
  ip_connect_enabled = true

  tags = {
    project = "foggykitchen"
    env     = "dev"
  }
}
```

---

## 📤 Outputs

| Output | Description |
|--------|-------------|
| `bastion_id` | ID of the Azure Bastion resource |
| `bastion_name` | Name of the Azure Bastion resource |
| `bastion_public_ip` | Public IP of Bastion (if created) |

---

## 🧩 Related Modules & Training

- [terraform-az-fk-vnet](https://github.com/mlinxfeld/terraform-az-fk-vnet)
- [terraform-az-fk-nsg](https://github.com/mlinxfeld/terraform-az-fk-nsg)
- [terraform-az-fk-loadbalancer](https://github.com/mlinxfeld/terraform-az-fk-loadbalancer)
- [terraform-az-fk-natgw](https://github.com/mlinxfeld/terraform-az-fk-natgw)
- [terraform-az-fk-compute](https://github.com/mlinxfeld/terraform-az-fk-compute)
- [terraform-az-fk-disk](https://github.com/mlinxfeld/terraform-az-fk-disk)
- [terraform-az-fk-storage](https://github.com/mlinxfeld/terraform-az-fk-storage)
- [terraform-az-fk-aks](https://github.com/mlinxfeld/terraform-az-fk-aks)

---

## 🪪 License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.  
See [LICENSE](LICENSE) for details.

---

© 2026 FoggyKitchen.com — Cloud. Code. Clarity.
