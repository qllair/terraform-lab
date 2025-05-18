variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "billing_mode" {
  description = "Billing mode for the table"
  type        = string
}

variable "hash_key" {
  description = "Primary hash key"
  type        = string
}

variable "attributes" {
  description = "Attributes of the table"
  type = list(object({
    name = string
    type = string
  }))
}