variable "user_names" {
    description = "Names for IAM users"
    type = list(string)
    default = [ "Neo", "Trinity", "Morpheus" ]
}