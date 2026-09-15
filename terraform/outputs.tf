output "cluster_nodes_ips" {
  description = "Names and public ips of the cluster nodes"
  value       = { for name, instance in aws_instance.cluster_nodes : name => instance.public_ip }
}

output "client_node_ip" {
  description = "public ip of the client node"
  value       = aws_instance.Client_api.public_ip
}
