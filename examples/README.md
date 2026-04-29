# OCI IAM Policy with Terraform/OpenTofu – Training Examples

This directory contains all progressive examples used with the **terraform-oci-fk-policy** module.
The examples are designed as **incremental building blocks**, starting from a simple policy-only scenario and gradually expanding toward a more realistic dynamic-group and instance-principal pattern.

These examples are part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and are used to show how OCI IAM policy design fits into broader infrastructure architectures.

---

## 🧭 Example Overview

| Example | Title | Key Topics |
|:-------:|:------|:-----------|
| 01 | **Policy Only** | Tenancy-level IAM policy, explicit statements, minimal authorization wiring |
| 02 | **Dynamic Group With Policy** | Dynamic group, instance principal pattern, compartment-scoped matching rule, tenancy-level policy |

Each example builds on the **concepts** introduced in the previous one, but can be applied
independently for learning and experimentation.

---

## ⚙️ How to Use

Each example directory contains:
- Terraform/OpenTofu configuration (`.tf`)
- A focused `README.md` explaining the goal of the example
- A minimal, runnable authorization scenario

To run an example:

```bash
cd examples/01_policy_only
cp terraform.tfvars.example terraform.tfvars
tofu init
tofu plan
tofu apply
```

You can apply examples independently. As the module grows, the **recommended approach is sequential**:
01 → 02

This mirrors real-world IAM design, where you typically start with explicit policy statements first, and then compose them with dynamic groups and instance-principal access patterns.

---

## 🧩 Design Principles

- One example = one authorization goal
- No unused or placeholder infrastructure
- Clear separation of concerns between policy definition and principal model
- IAM logic remains readable and explicit
- Examples designed to integrate with broader OCI workload modules

These examples intentionally avoid:
- Full enterprise IAM frameworks
- Hidden dependencies between examples
- Mixing too many concepts into the first onboarding scenario

---

## 🧩 Related Resources

- [FoggyKitchen OCI IAM Policy Module (terraform-oci-fk-policy)](../)
- [FoggyKitchen OCI VCN Module (terraform-oci-fk-vcn)](https://github.com/mlinxfeld/terraform-oci-fk-vcn)

---

## 🪪 License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.  
See [LICENSE](../LICENSE) for details.

---

© 2026 FoggyKitchen.com - *Cloud. Code. Clarity.*
