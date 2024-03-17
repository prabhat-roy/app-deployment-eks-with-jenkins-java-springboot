variable "aws_region" {
  type = string
}

variable "aws_vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
}
variable "aws_instance" {
  type = string
}
variable "aws_ami" {
  type = string
}
variable "ssh_key" {
  type = string
}