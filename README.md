Terraform Module for deploying Tensorflow based on Alibaba Cloud market place image. 
terraform-alicloud-market-tensorflow
-------

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-market-tensorflow/blob/master/README-CN.md)

Terraform Module used to create ECS Instance based on Alibaba Cloud market place image. 

## Terraform versions

This module requires Terraform 0.12 and Terraform Provider AliCloud 1.71.0+.

## Usage

Building the Tensorflow using market place image

```hcl
module "market-tensorflow" {
  source                     = "terraform-alicloud-modules/market-tensorflow/alicloud"
  region                     = "cn-beijing"
  profile                    = "Your-Profile-Name"

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

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

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
