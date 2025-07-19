# terraform-cloud-modules
Reusable Terraform modules for multi-cloud platforms

# Multi-Cloud Spot-Like Fleet Manager

This Terraform module deploys cost-optimized spot/preemptible/low-priority compute fleets across AWS, Azure, and GCP.


Key Features
Cloud Provider Flexibility:
You can choose your cloud provider by simply specifying a variable. The module will automatically deploy resources using the appropriate cloud-native constructs — such as AWS Spot Instances, Azure Low Priority VMs, or GCP Preemptible VMs — without changing your Terraform code structure.

Cost Optimization:
By leveraging spot, preemptible, or low-priority compute resources, the module helps reduce infrastructure costs significantly while maintaining the ability to scale dynamically.

Autoscaling and Resilience:
The module provisions autoscaling groups or equivalent, with configurable minimum, maximum, and desired instance counts. This ensures your compute fleet can grow or shrink based on demand.

Unified Tagging and Resource Management:
Tags and naming conventions are consistently applied across cloud providers for easier resource tracking, cost allocation, and governance.

Extensibility and Modularity:
The architecture separates provider-specific implementations into submodules, enabling easy enhancements or additions for other clouds or advanced features in the future.

Intended Use Cases
Running batch jobs or machine learning workloads that can tolerate interruptions and benefit from cost savings.

Hosting development or testing environments with variable compute needs.

Experimenting with multi-cloud infrastructure automation to achieve vendor flexibility and reduce lock-in risk.
