output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "instance_public_ip" {
  value = module.compute.instance_public_ip
}

output "instance_id" {
  value = module.compute.instance_id
}
