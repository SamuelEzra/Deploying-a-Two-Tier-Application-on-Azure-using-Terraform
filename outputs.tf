output "webserver_ip" {
  value = module.compute.public_ip
}

output "webserver_url" {
  value = "http://${module.compute.public_ip}"
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "private_subnet_id" {
  value = module.network.private_subnet_id
}

output "mysql_server_name" {
  value = module.database.server_name
}

output "mysql_server_fqdn" {
  value = module.database.server_fqdn
}

output "database_name" {
  value = module.database.database_name
}