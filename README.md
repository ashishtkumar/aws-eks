# Overview

This is a repo to demo creating an EKS cluster in AWS

## Instructions for Terraform

Run 

```bash
terraform init
terraform plan
terraform apply
```

The default EKS Kubernetes version is `1.32` (configured by `cluster_version` in `Terraform/variables.tf`). The referenced `srepro/eks/aws` module version `0.0.7` creates `AL2_x86_64` node groups, which EKS only supports through Kubernetes `1.32`. Use a newer module version with a supported AMI type before selecting a newer Kubernetes version.

If EKS still rejects the `aws-ebs-csi-driver` add-on version, update the add-on version in the module to one supported for the cluster's Kubernetes version and AWS region.

Once Terraform is done, run the command below to update your kubeconfig and access the cluster:

```bash
aws eks --region $(terraform output -raw region) update-kubeconfig \
    --name $(terraform output -raw cluster_name)
```

Example:
```bash
aws eks --region us-east-1 update-kubeconfig \
    --name my_eks_cluster
```

## Resources that will get provisioned:

- A VPC
- 3 private subnets
- 3 public subnets
- An Internet Gateway
- A NAT Gateway
- An EIP
- Public and private routes and routing tables
- EKS cluster
- EKS cluster encryption
- EKS Node Group
- A KMS Key
- EBS CSI EKS Add-on
- Cloudwatch Log Group
- OIDC provider
- Some security groups
- Some IAM roles and policies