data "alicloud_regions" "this" {
  current = true
}

data "alicloud_market_products" "products"{
  search_term           = var.product_keyword
  supplier_name_keyword = var.product_supplier_name_keyword
  suggested_price       = var.product_suggested_price
  product_type          = "MIRROR"
}

data "alicloud_market_product" "product"{
  product_code     = data.alicloud_market_products.products.products.0.code
  available_region = data.alicloud_regions.this.ids.0
}


resource "alicloud_instance" "this" {
  count           = var.create_instance ? 1 : 0
  image_id        = var.image_id != "" ? var.image_id : data.alicloud_market_product.product.product.0.skus.0.images.1.image_id
  instance_type   = var.ecs_instance_type
  security_groups = var.security_group_ids

  instance_name = var.ecs_instance_name
  password      = var.ecs_instance_password

  system_disk_category = var.system_disk_category
  system_disk_size     = var.system_disk_size

  vswitch_id = var.vswitch_id
  private_ip = var.private_ip

  internet_charge_type       = var.internet_charge_type
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  description                = "An ECS instance used to deploy Tensorflow."

  resource_group_id   = var.resource_group_id
  deletion_protection = var.deletion_protection
  force_delete        = true
  tags = merge(
    {
      Created     = "Terraform"
      Application = "Market-Tensorflow"
    }, var.tags,
  )
}