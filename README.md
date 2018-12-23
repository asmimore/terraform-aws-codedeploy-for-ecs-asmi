# terraform-aws-codedeploy-ecs

[![CircleCI](https://circleci.com/gh/tmknom/terraform-aws-codedeploy-ecs.svg?style=svg)](https://circleci.com/gh/tmknom/terraform-aws-codedeploy-ecs)
[![GitHub tag](https://img.shields.io/github/tag/tmknom/terraform-aws-codedeploy-ecs.svg)](https://registry.terraform.io/modules/tmknom/codedeploy-ecs/aws)
[![License](https://img.shields.io/github/license/tmknom/terraform-aws-codedeploy-ecs.svg)](https://opensource.org/licenses/Apache-2.0)

Terraform module template following [Standard Module Structure](https://www.terraform.io/docs/modules/create.html#standard-module-structure).

## Usage

Named `terraform-<PROVIDER>-<NAME>`. Module repositories must use this three-part name format.

```sh
curl -fsSL https://raw.githubusercontent.com/tmknom/terraform-aws-codedeploy-ecs/master/install | sh -s terraform-aws-sample
cd terraform-aws-sample && make install
```

## Examples

- [Minimal](https://github.com/tmknom/terraform-aws-codedeploy-ecs/tree/master/examples/minimal)
- [Complete](https://github.com/tmknom/terraform-aws-codedeploy-ecs/tree/master/examples/complete)

## Inputs

| Name                             | Description                                                                                                                         |  Type  |                        Default                         | Required |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | :----: | :----------------------------------------------------: | :------: |
| blue_lb_target_group_name        | Name of the blue target group.                                                                                                      | string |                           -                            |   yes    |
| ecs_cluster_name                 | The ECS Cluster name.                                                                                                               | string |                           -                            |   yes    |
| ecs_service_name                 | The ECS Service name.                                                                                                               | string |                           -                            |   yes    |
| green_lb_target_group_name       | Name of the green target group.                                                                                                     | string |                           -                            |   yes    |
| lb_listener_arns                 | List of Amazon Resource Names (ARNs) of the load balancer listeners.                                                                |  list  |                           -                            |   yes    |
| name                             | The name of the application.                                                                                                        | string |                           -                            |   yes    |
| action_on_timeout                | When to reroute traffic from an original environment to a replacement environment in a blue/green deployment.                       | string |                 `CONTINUE_DEPLOYMENT`                  |    no    |
| auto_rollback_enabled            | Indicates whether a defined automatic rollback configuration is currently enabled for this Deployment Group.                        | string |                         `true`                         |    no    |
| auto_rollback_events             | The event type or types that trigger a rollback.                                                                                    |  list  | `[ "DEPLOYMENT_FAILURE", "DEPLOYMENT_STOP_ON_ALARM" ]` |    no    |
| ecs_codedeploy_description       | The description of the ecs codedeploy role and the ecs codedeploy policy.                                                           | string |                 `Managed by Terraform`                 |    no    |
| ecs_codedeploy_path              | Path in which to create the ecs codedeploy role and the ecs codedeploy policy.                                                      | string |                          `/`                           |    no    |
| tags                             | A mapping of tags to assign to all resources.                                                                                       |  map   |                          `{}`                          |    no    |
| termination_wait_time_in_minutes | The number of minutes to wait after a successful blue/green deployment before terminating instances from the original environment.  | string |                          `5`                           |    no    |
| test_traffic_route_listener_arns | List of Amazon Resource Names (ARNs) of the load balancer to route test traffic listeners.                                          |  list  |                          `[]`                          |    no    |
| wait_time_in_minutes             | The number of minutes to wait before the status of a blue/green deployment changed to Stopped if rerouting is not started manually. | string |                          `10`                          |    no    |

## Outputs

| Name                              | Description                                                   |
| --------------------------------- | ------------------------------------------------------------- |
| codedeploy_app_id                 | Amazon's assigned ID for the application.                     |
| codedeploy_app_name               | The application's name.                                       |
| codedeploy_deployment_group_id    | Application name and deployment group name.                   |
| ecs_codedeploy_policy_arn         | The ARN assigned by AWS to this ecs codedeploy policy.        |
| ecs_codedeploy_policy_description | The description of the ecs codedeploy policy.                 |
| ecs_codedeploy_policy_document    | The policy document of the ecs codedeploy policy.             |
| ecs_codedeploy_policy_id          | The ecs codedeploy policy's ID.                               |
| ecs_codedeploy_policy_name        | The name of the ecs codedeploy policy.                        |
| ecs_codedeploy_policy_path        | The path of the ecs codedeploy policy in IAM.                 |
| ecs_codedeploy_role_arn           | The Amazon Resource Name (ARN) specifying the ecs codedeploy. |
| ecs_codedeploy_role_create_date   | The creation date of the ecs codedeploy.                      |
| ecs_codedeploy_role_description   | The description of the ecs codedeploy.                        |
| ecs_codedeploy_role_name          | The name of the ecs codedeploy.                               |
| ecs_codedeploy_role_unique_id     | The stable and unique string identifying the ecs codedeploy.  |

## Development

### Requirements

- [Docker](https://www.docker.com/)

### Configure environment variables

```shell
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=ap-northeast-1
```

### Installation

```shell
git clone git@github.com:tmknom/terraform-aws-codedeploy-ecs.git
cd terraform-aws-codedeploy-ecs
make install
```

### Makefile targets

```text
check-format                   Check format code
cibuild                        Execute CI build
clean                          Clean .terraform
docs                           Generate docs
format                         Format code
help                           Show help
install                        Install requirements
lint                           Lint code
release                        Release GitHub and Terraform Module Registry
terraform-apply-complete       Run terraform apply examples/complete
terraform-apply-minimal        Run terraform apply examples/minimal
terraform-destroy-complete     Run terraform destroy examples/complete
terraform-destroy-minimal      Run terraform destroy examples/minimal
terraform-plan-complete        Run terraform plan examples/complete
terraform-plan-minimal         Run terraform plan examples/minimal
upgrade                        Upgrade makefile
```

### Releasing new versions

Bump VERSION file, and run `make release`.

### Terraform Module Registry

- <https://registry.terraform.io/modules/tmknom/codedeploy-ecs/aws>

## License

Apache 2 Licensed. See LICENSE for full details.
