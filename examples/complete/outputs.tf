output "this_ecs_instance_public_ip" {
  description = "The ecs instance public ip."
  value       = module.market-tensorflow.this_ecs_instance_public_ip
}