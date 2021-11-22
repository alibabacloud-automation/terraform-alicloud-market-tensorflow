variable "region" {
  description = "(Deprecated from version 1.1.0) The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "(Deprecated from version 1.1.0) The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "(Deprecated from version 1.1.0) This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "(Deprecated from version 1.1.0) Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

// Market Product
variable "product_keyword" {
  description = "The name keyword of Market Product used to fetch the specified product image."
  type        = string
  default     = "深度学习框架"
}
variable "product_supplier_name_keyword" {
  description = "The name keyword of Market Product supplier name used to fetch the specified product image."
  type        = string
  default     = ""
}
variable "product_suggested_price" {
  description = "The suggested price of Market Product used to fetch the specified product image."
  type        = number
  default     = 0
}

// ECS instance
variable "create_instance" {
  description = "Whether to create ecs instance."
  type        = bool
  default     = true
}

variable "ecs_instance_name" {
  description = "The name of ECS Instance."
  type        = string
  default     = "TF-Tensorflow"
}
variable "ecs_instance_password" {
  description = "The password of ECS instance."
  type        = string
  default     = ""
}
variable "image_id" {
  description = "The image id used to launch one ecs instance. If not set, a fetched market place image by product_keyword will be used."
  type        = string
  default     = ""
}
variable "ecs_instance_type" {
  description = "The instance type used to launch ecs instance."
  type        = string
  default     = ""
}
variable "system_disk_category" {
  description = "The system disk category used to launch one ecs instance."
  type        = string
  default     = "cloud_ssd"
}
variable "system_disk_size" {
  description = "The system disk size used to launch ecs instance."
  type        = number
  default     = 40
}
variable "security_group_ids" {
  description = "A list of security group ids to associate with ECS."
  type        = list(string)
  default     = []
}
variable "vswitch_id" {
  description = "The virtual switch ID to launch ECS instance in VPC."
  type        = string
  default     = ""
}
variable "private_ip" {
  description = "Configure ECS Instance private IP address"
  type        = string
  default     = ""
}
variable "internet_charge_type" {
  description = "The internet charge type of ECS instance. Choices are 'PayByTraffic' and 'PayByBandwidth'."
  type        = string
  default     = "PayByTraffic"
}
variable "internet_max_bandwidth_out" {
  description = "The maximum internet out bandwidth of ECS instance."
  type        = number
  default     = 10
}
variable "deletion_protection" {
  description = "Whether enable the deletion protection or not. 'true': Enable deletion protection. 'false': Disable deletion protection."
  type        = bool
  default     = false
}
variable "tags" {
  description = "A mapping of tags to assign to the ECS."
  type        = map(string)
  default     = {}
}
variable "resource_group_id" {
  description = "The Id of resource group which the ECS instance belongs."
  type        = string
  default     = ""
}