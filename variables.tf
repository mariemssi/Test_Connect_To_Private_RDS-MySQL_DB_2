variable "db-username" {
  type = string
  #default="Your_DEFAULT_DB_USER_NAME"
}
variable "db-password" {
  type = string
  #default="YOUR_DB_PASSWORD"
}

variable "private_key" {
  default = "mykey"
}

variable "public_key" {
  default = "mykey.pub"
}