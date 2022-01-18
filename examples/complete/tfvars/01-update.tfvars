ecs_instance_name          = "update-tf-test-instance"
ecs_instance_password      = "YourPassword123!update"
system_disk_size           = "50"
private_ip                 = "172.16.0.11"
internet_charge_type       = "PayByBandwidth"
internet_max_bandwidth_out = "20"
description                = "update-tf-description"
deletion_protection        = false
force_delete               = true
tags = {
  Name = "update-tf-tensorflow"
}