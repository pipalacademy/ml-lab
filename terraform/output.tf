

locals {
  nodes = {
    for instance in aws_instance.mlnode:
    instance.id => instance.public_ip
  }
}

output "nodes" {
  value = "${jsonencode(local.nodes)}"
}
