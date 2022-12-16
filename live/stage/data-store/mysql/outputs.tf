output "address" {
    value = module.mysql.address
    description = "MySql database address"
  
}

output "port" {
    value = module.mysql.port
    description = "MySql database port"
  
}

output "arn" {
    value = module.mysql.arn
}