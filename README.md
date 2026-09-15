# Kubernetes 3-Tier Application Infrastructure on AWS

This project automates the provisioning of AWS infrastructure for a Kubernetes cluster using Terraform.

## Infrastructure Overview

The infrastructure consists of 4 EC2 instances running Ubuntu:
- **3 Cluster Nodes** forming the Kubernetes cluster (e.g., master and worker nodes).
- **1 Client API Node** acting as a management machine (`kubectl` client) to interact with the cluster remotely.

### Provisioned Resources

- **VPC & Networking**: Deployed in the Default AWS VPC with a custom Security Group (`k8s-sg`).
- **Security Group Rules**:
  - Allow SSH (Port 22) from `0.0.0.0/0`
  - Allow HTTP (Port 80) from `0.0.0.0/0`
  - Allow HTTPS (Port 443) from `0.0.0.0/0`
  - Allow all outbound traffic.
- **SSH Access**: Configured via an uploaded `aws-infra-key` public key.

### Instances Provisioned

| Instance Name | Instance Type | Masked Public IP |
| ------------- | ------------- | ---------------- |
| Client API kubectl | `t3.micro` | `13.201.xxxx` |
| cluster-node1 | `t3.small` | `3.108.xxxx` |
| cluster-node2 | `t3.small` | `15.252.xxxx` |
| cluster-node3 | `t3.small` | `13.203.xxxx` |

## How to use

Run the following Terraform commands in the `terraform/` directory to manage the infrastructure:
- `terraform init` (Initialize providers)
- `terraform plan` (Preview changes)
- `terraform apply` (Provision resources)
- `terraform destroy` (Tear down infrastructure)
