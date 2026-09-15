resource "aws_key_pair" "cluster_key" {
  key_name   = var.key_name
  public_key = file("../Keys/${var.key_name}.pub") #public key from folder
}


resource "aws_instance" "cluster_nodes" {
  for_each               = toset((var.cluster_node_names))
  ami                    = var.ami_id
  instance_type          = var.cluster_instance_type
  key_name               = aws_key_pair.cluster_key.key_name
  vpc_security_group_ids = [aws_security_group.k8s_sg.id]
  tags = {
    Name = each.key
  }

}

resource "aws_instance" "Client_api" {
  ami                    = var.ami_id
  instance_type          = var.client_instance_type
  key_name               = aws_key_pair.cluster_key.key_name
  vpc_security_group_ids = [aws_security_group.k8s_sg.id]
  tags = {
    Name = "Client API kubectl"
  }

}
