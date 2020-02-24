output "this_ecs_instance_public_ip" {
  description = "The ecs instance public ip."
  value       = module.market-tensorflow.this_ecs_instance_public_ip
}

output "this_instance_id_of_tensorflow_with_ecs" {
  description = "The instance id of tensorflow."
  value       = module.market-tensorflow.this_ecs_instance_id
}

output "this_image_id_of_tensorflow_with_ecs" {
  description = "The image id of tensorflow."
  value       = module.market-tensorflow.this_ecs_instance_image_id
}

output "this_vswitch_id_of_tensorflow_with_ecs" {
  description = "The vswitch id of tensorflow."
  value       = module.market-tensorflow.this_vswitch_id
}