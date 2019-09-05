

locals {
  nodes = {
    for instance in aws_instance.mlnode:
    instance.tags["Name"] => instance.public_ip
  }
}

output "nodes" {
  value = jsonencode(local.nodes)
}
