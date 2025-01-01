###cloud vars
variable "cloud_id" {
  type        = string
  default     = "ajejcoprn49l5md0ohth"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gbhacf7r8u5h8ie6el"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "add_zone_1b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "add_cidr_1b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network name"
}

variable "vpc_subnet_name_1" {
  type        = string
  default     = "develop_subnet_1"
  description = "VPC subnet name"
}

variable "vpc_subnet_name_2" {
  type        = string
  default     = "develop_subnet_2"
  description = "VPC subnet name"
}

variable "family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "OS family"
}

variable "vm_name_prefix" {
  type        = string
  default     = "netology-develop-platform"
  description = "VM Name Prefix"
}

variable "vm_name_suffix_1" {
  type        = string
  default     = "web"
  description = "VM Name 1 Suffix"
}

variable "vm_name_suffix_2" {
  type        = string
  default     = "db"
  description = "VM Name 2 Suffix"
}

###ssh vars
#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH3U/q9sM9OG+uIo60sRmQfPv9+aQqaupb5T4EMdr5/K root@netology"
#  description = "ssh-keygen -t ed25519"
#}

###test var
variable "test" {
#  type         = list(map(list(any)))
  type         = list(map(list(string)))
  description = "I`ts test var"
}

###stage 9 vars
variable "gateway_name" {
  type        = string
  default     = "test-gateway"
  description = "Stage 9 Gateway Name"
}

variable "route_table_name" {
  type        = string
  default     = "test-route-table"
  description = "Stage 9 Route Table Name"
}
