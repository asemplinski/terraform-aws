output "primary_address" {
    value = module.mysql_primary.address
    description = "Primary MySql database address"
}

output "primary_port" {
    value = module.mysql_primary.port
    description = "Primary MySql database port"
}

output "primary_arn" {
    value = module.mysql_primary.arn
    description = "Arn of the primary DB"
}

output "replica_address" {
    value = module.mysql_replica.address
    description = "Replica MySql database address"
}

output "replica_port" {
    value = module.mysql_replica.port
    description = "Replica MySql database port"
}

output "replica_arn" {
    value = module.mysql_replica.arn
    description = "Arn of the replica DB"
}