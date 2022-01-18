data "alicloud_zones" "default" {
}

data "alicloud_resource_manager_resource_groups" "default" {
}

data "alicloud_regions" "this" {
  current = true
}

data "alicloud_market_products" "products" {
  search_term           = "深度学习框架"
  supplier_name_keyword = "阿里云"
  suggested_price       = 0
  product_type          = "MIRROR"
}

data "alicloud_market_product" "product" {
  product_code     = data.alicloud_market_products.products.products.0.code
  available_region = data.alicloud_regions.this.ids.0
}

data "alicloud_instance_types" "this" {
  instance_type_family = "ecs.gn5"
  availability_zone    = data.alicloud_zones.default.zones.0.id
}

# Create a new vpc using terraform module
module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_cidr           = "172.16.0.0/16"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_zones.default.zones.0.id]
}

# Create a new security and open 80 22 port
module "security_group" {
  source              = "alibaba/security-group/alicloud"
  vpc_id              = module.vpc.this_vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
}

module "market-tensorflow" {
  source = "../.."

  #alicloud_market_products
  product_keyword               = "深度学习框架"
  product_supplier_name_keyword = "阿里云"
  product_suggested_price       = 0

  #alicloud_instance
  create_instance = true

  image_id                   = data.alicloud_market_product.product.product.0.skus.0.images.0.image_id
  ecs_instance_type          = data.alicloud_instance_types.this.ids.0
  security_group_ids         = [module.security_group.this_security_group_id]
  ecs_instance_name          = var.ecs_instance_name
  ecs_instance_password      = var.ecs_instance_password
  system_disk_category       = "cloud_efficiency"
  system_disk_size           = var.system_disk_size
  vswitch_id                 = module.vpc.this_vswitch_ids[0]
  private_ip                 = var.private_ip
  internet_charge_type       = var.internet_charge_type
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  description                = var.description
  resource_group_id          = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  deletion_protection        = var.deletion_protection
  force_delete               = var.force_delete
  tags                       = var.tags

}