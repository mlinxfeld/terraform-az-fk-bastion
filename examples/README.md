# Azure Bastion with Terraform / OpenTofu — Examples

This directory contains **hands-on Azure Bastion examples** built around the
`terraform-az-fk-bastion` module.

The examples are designed as **progressive building blocks** that introduce how
Azure **Bastion** provides secure, audited access to private workloads without
public IPs.

They are part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and are used across:

- Azure Fundamentals with Terraform / OpenTofu  
- Private networking baselines (no public IPs)  
- Operator access patterns (Bastion + SSH tunneling)  
- Multicloud (Azure + OCI) architectural training  

---

## 🧭 Example Overview

| Example | Title | Key Topics |
|--------|-------|------------|
| 01 | **Private VM with Bastion Access** | AzureBastionSubnet, NIC-level NSG, Bastion tunneling |
| 02 | **Private AKS with Bastion Access** | Private AKS, jump VM, NAT Gateway egress, Bastion tunneling |

Each example introduces **one clear access pattern** and can be applied
**independently** for learning and reuse.

---

## ⚙️ How to Use

Each example directory contains:

- Terraform / OpenTofu configuration (`.tf`)
- A focused `README.md` explaining the architectural goal
- A **fully runnable deployment** (no placeholders, no mock resources)

To run an example:

```bash
cd examples/01_private_vm_with_bastion_access
tofu init
tofu plan
tofu apply
```

---

## 🧩 Related Modules & Training

- [terraform-az-fk-bastion](https://github.com/mlinxfeld/terraform-az-fk-bastion) (this repository)  
- [terraform-az-fk-vnet](https://github.com/mlinxfeld/terraform-az-fk-vnet)  
- [terraform-az-fk-nsg](https://github.com/mlinxfeld/terraform-az-fk-nsg)  
- [terraform-az-fk-compute](https://github.com/mlinxfeld/terraform-az-fk-compute)  
- [terraform-az-fk-natgw](https://github.com/mlinxfeld/terraform-az-fk-natgw)  
- [terraform-az-fk-loadbalancer](https://github.com/mlinxfeld/terraform-az-fk-loadbalancer)  
- [terraform-az-fk-disk](https://github.com/mlinxfeld/terraform-az-fk-disk)  
- [terraform-az-fk-storage](https://github.com/mlinxfeld/terraform-az-fk-storage)  
- [terraform-az-fk-aks](https://github.com/mlinxfeld/terraform-az-fk-aks)  

---

## 🪪 License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.  
See `LICENSE` for details.

---

© 2026 FoggyKitchen.com — Cloud. Code. Clarity.
