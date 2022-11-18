output "address" {
    value = aws_db_instance.mysql.address
    description = "MySql database address"
  
}

output "port" {
    value = aws_db_instance.mysql.port
    description = "MySql database port"
  
}