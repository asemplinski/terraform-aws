variable "names" {
  description = "List of Names"
  default = ["Neo", "Morpheus", "Trinity"]

}

variable "hero_thousand_faces" {
  description = "Map of character roles"
  type = map(string)
  default = {
    neo = "hero"
    trinity = "love interest"
    morpheus  = "mentor"
  }
}