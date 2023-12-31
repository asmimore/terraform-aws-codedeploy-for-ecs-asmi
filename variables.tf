variable "name" {
  type        = string
  description = "The name of the application."
  default     = "bg-application"
}

variable "ecs_cluster_name" {
  type        = string
  description = "The ECS Cluster name."
  default     = "bg-ecs-cluster"
}

variable "ecs_service_name" {
  type        = string
  description = "The ECS Service name."
  default     = "bg-ecs-service"
}

variable "lb_listener_arns" {
  type        = list
  description = "List of Amazon Resource Names (ARNs) of the load balancer listeners."
  default = [
    "arn:aws:elasticloadbalancing:ap-northeast-1:092964301276:targetgroup/blue-tg/8337c998027d57fb",
    "arn:aws:elasticloadbalancing:ap-northeast-1:092964301276:targetgroup/green-tg/d287cf57cc47f67a",
  
  ]
}

variable "blue_lb_target_group_name" {
  type        = string
  description = "Name of the blue target group."
  default     = "blue-tg"
}

variable "green_lb_target_group_name" {
  type        = string
  description = "Name of the green target group."
  default     = "green-tg"
}

variable "auto_rollback_enabled" {
  default     = true
  type        = string
  description = "Indicates whether a defined automatic rollback configuration is currently enabled for this Deployment Group."
}

variable "auto_rollback_events" {
  default     = ["DEPLOYMENT_FAILURE", "DEPLOYMENT_STOP_ON_ALARM"]
  type        = list
  description = "The event type or types that trigger a rollback."
}

variable "action_on_timeout" {
  default     = "CONTINUE_DEPLOYMENT"
  type        = string
  description = "When to reroute traffic from an original environment to a replacement environment in a blue/green deployment."
}

variable "wait_time_in_minutes" {
  default     = 0
  type        = string
  description = "The number of minutes to wait before the status of a blue/green deployment changed to Stopped if rerouting is not started manually."
}

variable "termination_wait_time_in_minutes" {
  default     = 5
  type        = string
  description = "The number of minutes to wait after a successful blue/green deployment before terminating instances from the original environment."
}

variable "test_traffic_route_listener_arns" {
  default     = []
  type        = list
  description = "List of Amazon Resource Names (ARNs) of the load balancer to route test traffic listeners."
}

variable "iam_path" {
  default     = "/"
  type        = string
  description = "Path in which to create the IAM Role and the IAM Policy."
}

variable "description" {
  default     = "Managed by Terraform"
  type        = string
  description = "The description of the all resources."
}

variable "tags" {
  default     = {}
  type        = map
  description = "A mapping of tags to assign to all resources."
}
