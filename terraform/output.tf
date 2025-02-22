output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "ecs_cluster_id" {
  description = "ECS Cluster ID"
  value       = aws_ecs_cluster.main.id
}

output "alb_dns_name" {
  description = "ALB DNS Name"
  value       = aws_lb.main.dns_name
}

output "waf_id" {
  description = "WAF Web ACL ID"
  value       = aws_waf_web_acl.main.id
}

output "cognito_user_pool_id" {
  description = "Cognito User Pool ID"
  value       = aws_cognito_user_pool.main.id
}

output "cloudwatch_log_group_name" {
  description = "CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.api_logs.name
}

output "prometheus_service_url" {
  description = "Prometheus Service Endpoint"
  value       = aws_ecs_service.prometheus.id
}

output "grafana_service_url" {
  description = "Grafana Service Endpoint"
  value       = aws_ecs_service.grafana.id
