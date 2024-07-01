# Deprecated

Thank you for your interest in Alibaba Cloud Terraform Module. This Module will be out of maintenance as of today and will be officially taken offline in the future. More available Modules can be searched in [Alibaba Cloud Terraform Module](https://registry.terraform.io/browse/modules?provider=alibaba).

Thank you again for your understanding and cooperation.

Terraform Module for deploying Tensorflow based on Alibaba Cloud market place image. 
terraform-alicloud-market-tensorflow
-------

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-market-tensorflow/blob/master/README-CN.md)

Terraform Module used to create ECS Instance based on Alibaba Cloud market place image. 


## Usage

Building the Tensorflow using market place image

```hcl
module "market-tensorflow" {
  source                     = "terraform-alicloud-modules/market-tensorflow/alicloud"

  product_keyword            = "深度学习框架"
  product_suggested_price    = 0

  ecs_instance_name          = "tensorflow-instance"
  ecs_instance_password      = "YourPassword123"
  ecs_instance_type          = "ecs.sn1ne.large"
  system_disk_category       = "cloud_efficiency"
  security_group_ids         = ["sg-132txxxxx"]
  vswitch_id                 = "vsw-32refxxxx"
  internet_max_bandwidth_out = 50
  data_disks = [
    {
      name = "disk-for-tensorflow"
      size = 50
    }
  ]
}  
```

## Examples

* [complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-market-tensorflow/tree/master/examples/complete)

## Notes
From the version v1.1.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/market-tensorflow"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.0.1:

```hcl
module "market-tensorflow" {
  source  = "terraform-alicloud-modules/market-tensorflow/alicloud"
  version     = "1.0.1"
  region      = "cn-beijing"
  profile     = "Your-Profile-Name"
  product_keyword            = "深度学习框架"
  product_suggested_price    = 0
  // ...
}
```

If you want to upgrade the module to 1.1.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
}
module "market-tensorflow" {
  source  = "terraform-alicloud-modules/market-tensorflow/alicloud"
  product_keyword            = "深度学习框架"
  product_suggested_price    = 0
  // ...
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
  alias   = "bj"
}
module "market-tensorflow" {
  source  = "terraform-alicloud-modules/market-tensorflow/alicloud"
  providers = {
    alicloud = alicloud.bj
  }
  product_keyword            = "深度学习框架"
  product_suggested_price    = 0
  // ...
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.71.0 |

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
