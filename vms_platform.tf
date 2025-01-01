### vm_web vars section
variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "WEB platform name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "VM platform based on ... (see more: https://yandex.cloud/ru/docs/compute/concepts/vm-platforms)"
}

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "Memory capacity in Gb"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 20
  description = "Percent of core fraction"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "VM is preemptible?"
}

variable "vm_web_nat" {
  type        = bool
#  default     = true
  default     = false
  description = "VM using NAT?"
}

variable "vm_web_serial-port-enable" {
  type        = number
  default     = 1
  description = "Serial port is enable"
}

### vm_db vars section
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Database platform name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "VM platform based on ... (see more: https://yandex.cloud/ru/docs/compute/concepts/vm-platforms)"
}

#variable "vm_db_cores" {
#  type        = number
#  default     = 2
#  description = "Number of CPU cores"
#}

#variable "vm_db_memory" {
#  type        = number
#  default     = 2
#  description = "Memory capacity in Gb"
#}

#variable "vm_db_core_fraction" {
#  type        = number
#  default     = 20
#  description = "Percent of core fraction"
#}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "VM is preemptible?"
}

variable "vm_db_nat" {
  type        = bool
#  default     = true
  default     = false
  description = "VM using NAT?"
}

#variable "vm_db_serial-port-enable" {
#  type        = number
#  default     = 1
#  description = "Serial port is enable"
#}

###resource vars declarations
variable "vms_resources" {
  type        = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {}
  description = "VM resource settings"
}

variable "metadata" {
  type        = map(any)
  description = "ssh-keygen -t ed25519"
}
