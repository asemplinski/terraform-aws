output "east" {
  description="Outputs the east provider's region"
  value = data.aws_region.east_region
}

output "west" {
  description = "Outputs the west provider's region"
  value = data.aws_region.west_region
}

output "east_ec2_availability_zone" {
  description = "Outputs the east ec2 instance's availability zone"
  value = aws_instance.east.availability_zone
}

output "west_ec2-availability_zone" {
  description = "Outputs the west ec2 instance's availability zone"
  value = aws_instance.west.availability_zone
}