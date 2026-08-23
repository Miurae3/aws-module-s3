variable "bucket_name" {
    description = "Nome dos buckets"
    type = list(string)
}

variable "website_enabled" {
    description = "Habilita bucket para hospedar site estático"
    type = bool
    default = false
}

variable "versioning_enabled" {
    description = "Habilita versionamento do bucket"
    type = bool
    default = false

}