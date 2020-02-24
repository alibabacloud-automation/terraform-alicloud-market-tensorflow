terraform-alicloud-market-tensorflow
=====================================================================

本 Terraform 模块将使用 Tensorflow 镜像来创建 ECS 实例, 实现快速搭建 tensorflow。

## Terraform 版本

本模板要求使用版本 Terraform 0.12 和 阿里云 Provider 1.71.0+。

## 用法

使用云市场镜像搭建 Tensorflow

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

## 示例

* [Tensorflow 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-market-tensorflow/tree/master/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置。

提交问题
------
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Li Xue(lixue_9250@163.com) and He Guimin(@xiaozhu36, heguimin36@163.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
