variable "prefix" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "node_count" {
  type = number
}

variable "private_subnet_ids" {
  type = list(string)
}
