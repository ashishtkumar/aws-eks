variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_version" {
  description = "Kubernetes cluster version (module v0.0.7 node groups support up to 1.32)"
  type        = string
  default     = "1.32"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "my_eks_cluster"
}

variable "instance_types" {
  description = "EC2 instances used for K8s nodes"
  type        = list
  default     = ["t2.small"]
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cluster_min_size" {
  description = "K8s Cluster minimum size"
  type        = number
  default     = 1
}

variable "cluster_max_size" {
  description = "K8s Cluster maximum size"
  type        = number
  default     = 3
}

variable "cluster_desired_size" {
  description = "K8s Cluster desired size"
  type        = number
  default     = 2
}
