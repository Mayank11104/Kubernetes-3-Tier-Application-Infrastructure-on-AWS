variable "key_name" {
  description = "Name of the SSH key"
  type        = string

}

variable "cluster_instance_type" {
  description = "Type of the instance for Cluster nodes"
  type        = string
}

variable "client_instance_type" {
  description = "Type of the instance Client node"
  type        = string
}

variable "cluster_node_names" {
  description = "List of the instance names"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}
