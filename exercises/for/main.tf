output "upper_names" {
  value = [for name in var.names: upper(name)]
}

output "only_neo_uppercase" {
  value = [for name in var.names: upper(name) if length(name) < 5]
}

output "bios" {
  value = [for character, role in var.hero_thousand_faces: "${character} is the ${role}"]
}