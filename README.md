# 🌐 Spot-like Fleet Manager (Multi-Cloud)

This Terraform module provides a unified, reusable framework to deploy *cost-efficient, preemptible compute resources* across major cloud providers — **AWS**, **Azure**, and **GCP**. It abstracts the complexity of setting up low-cost, ephemeral compute environments using Spot Instances, Low Priority VMs, and Preemptible VMs — enabling organizations to optimize cloud spend in a consistent and modular way.

---

## ✅ Supported Clouds & Features

| Cloud Provider | Implementation Type       | Key Features                                                                 |
|----------------|---------------------------|------------------------------------------------------------------------------|
| AWS            | EC2 Auto Scaling Group     | Spot Instances, Launch Templates, Scaling Policies                          |
| Azure          | Virtual Machine Scale Set  | Low Priority VMs, Load Distribution, Scaling                                |
| GCP            | Instance Group Manager     | Preemptible VMs, Autoscaling, Managed Instance Templates                    |

---

## 📁 Project Structure

terraform-cloud-modules/
└── multi-cloud/
    └── spot-like-fleet-manager/
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        ├── modules/
        │   ├── aws/
        │   │   ├── main.tf
        │   │   ├── variables.tf
        │   │   └── outputs.tf
        │   ├── azure/
        │   │   ├── main.tf
        │   │   ├── variables.tf
        │   │   └── outputs.tf
        │   └── gcp/
        │       ├── main.tf
        │       ├── variables.tf
        │       └── outputs.tf
        └── README.md

Each cloud module will be included based on the *_enabled flags.


🌍 Multi-Cloud Ready – Seamlessly switch between cloud providers

💸 Cost Efficient – Built entirely on Spot/Preemptible infrastructure

♻️ Reusable Modules – Cloud-specific submodules are self-contained

📦 Scalable Design – Each module supports autoscaling strategies

🧪 Production-Ready Inputs – Highly configurable with clean defaults



