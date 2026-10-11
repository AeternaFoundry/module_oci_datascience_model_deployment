variable "datascience_model_deployments" {
  description = <<EOT
Map of datascience_model_deployments, attributes below
Required:
    - compartment_id
    - project_id
    - model_deployment_configuration_details (block):
        - deployment_type (required)
        - environment_configuration_details (optional, block):
            - cmd (optional)
            - custom_http_endpoints (optional, block):
                - endpoint_uri_suffix (optional)
                - http_methods (optional)
            - default_environment_variables (optional)
            - entrypoint (optional)
            - environment_configuration_type (required)
            - environment_variables (optional)
            - health_check_port (optional)
            - image (optional)
            - image_digest (optional)
            - image_signature_id (optional)
            - predict_api_specification (optional)
            - server_port (optional)
        - infrastructure_configuration_details (optional, block):
            - bandwidth_mbps (optional)
            - compute_target_id (optional)
            - infrastructure_type (required)
            - instance_configuration (optional, block):
                - instance_shape_name (required)
                - model_deployment_instance_shape_config_details (optional, block):
                    - cpu_baseline (optional)
                    - memory_in_gbs (optional)
                    - ocpus (optional)
                - network_access_type (optional)
                - private_endpoint_id (optional)
                - subnet_id (optional)
            - maximum_bandwidth_mbps (optional)
            - model_deployment_resource_configuration (optional, block):
                - resource_limit_configuration (optional, block):
                    - memory_in_gbs (required)
                    - ocpus (required)
                - resource_request_configuration (required, block):
                    - gpus (optional)
                    - memory_in_gbs (required)
                    - ocpus (required)
            - scaling_policy (optional, block):
                - auto_scaling_policies (optional, block):
                    - auto_scaling_policy_type (required)
                    - initial_instance_count (required)
                    - maximum_instance_count (required)
                    - minimum_instance_count (required)
                    - rules (required, block):
                        - metric_expression_rule_type (required)
                        - metric_type (optional)
                        - scale_configuration (optional, block):
                            - metric_namespace (optional)
                            - query (optional)
                            - target_scaling_configuration_type (optional)
                            - threshold (optional)
                        - scale_in_configuration (optional, block):
                            - instance_count_adjustment (optional)
                            - pending_duration (optional)
                            - query (optional)
                            - scaling_configuration_type (optional)
                            - threshold (optional)
                        - scale_out_configuration (optional, block):
                            - instance_count_adjustment (optional)
                            - pending_duration (optional)
                            - query (optional)
                            - scaling_configuration_type (optional)
                            - threshold (optional)
                    - scale_in_policy (optional, block):
                        - cool_down_in_seconds (optional)
                        - instance_count_adjustment (optional)
                        - pending_duration (optional)
                    - scale_out_policy (optional, block):
                        - cool_down_in_seconds (optional)
                        - instance_count_adjustment (optional)
                        - pending_duration (optional)
                - cool_down_in_seconds (optional)
                - instance_count (optional)
                - is_enabled (optional)
                - policy_type (required)
        - model_configuration_details (optional, block):
            - bandwidth_mbps (optional)
            - instance_configuration (optional, block):
                - instance_shape_name (optional)
                - model_deployment_instance_shape_config_details (optional, block):
                    - cpu_baseline (optional)
                    - memory_in_gbs (optional)
                    - ocpus (optional)
                - network_access_type (optional)
                - private_endpoint_id (optional)
                - subnet_id (optional)
            - maximum_bandwidth_mbps (optional)
            - model_id (optional)
            - scaling_policy (optional, block):
                - auto_scaling_policies (optional, block):
                    - auto_scaling_policy_type (required)
                    - initial_instance_count (required)
                    - maximum_instance_count (required)
                    - minimum_instance_count (required)
                    - rules (required, block):
                        - metric_expression_rule_type (required)
                        - metric_type (optional)
                        - scale_in_configuration (required, block):
                            - instance_count_adjustment (optional)
                            - pending_duration (optional)
                            - query (optional)
                            - scaling_configuration_type (optional)
                            - threshold (optional)
                        - scale_out_configuration (required, block):
                            - instance_count_adjustment (optional)
                            - pending_duration (optional)
                            - query (optional)
                            - scaling_configuration_type (optional)
                            - threshold (optional)
                - cool_down_in_seconds (optional)
                - instance_count (optional)
                - is_enabled (optional)
                - policy_type (required)
        - model_group_configuration_details (optional, block):
            - model_group_id (optional)
Optional:
    - defined_tags
    - description
    - display_name
    - freeform_tags
    - opc_parent_rpt_url
    - state
    - category_log_details (block):
        - access (optional, block):
            - log_group_id (required)
            - log_id (required)
        - predict (optional, block):
            - log_group_id (required)
            - log_id (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id     = string
    project_id         = string
    defined_tags       = optional(map(string))
    description        = optional(string)
    display_name       = optional(string)
    freeform_tags      = optional(map(string))
    opc_parent_rpt_url = optional(string)
    state              = optional(string)
    model_deployment_configuration_details = object({
      deployment_type = string
      environment_configuration_details = optional(object({
        cmd = optional(list(string))
        custom_http_endpoints = optional(list(object({
          endpoint_uri_suffix = optional(string)
          http_methods        = optional(list(string))
        })))
        default_environment_variables  = optional(map(string))
        entrypoint                     = optional(list(string))
        environment_configuration_type = string
        environment_variables          = optional(map(string))
        health_check_port              = optional(number)
        image                          = optional(string)
        image_digest                   = optional(string)
        image_signature_id             = optional(string)
        predict_api_specification      = optional(string)
        server_port                    = optional(number)
      }))
      infrastructure_configuration_details = optional(object({
        bandwidth_mbps      = optional(number)
        compute_target_id   = optional(string)
        infrastructure_type = string
        instance_configuration = optional(object({
          instance_shape_name = string
          model_deployment_instance_shape_config_details = optional(object({
            cpu_baseline  = optional(string)
            memory_in_gbs = optional(number)
            ocpus         = optional(number)
          }))
          network_access_type = optional(string)
          private_endpoint_id = optional(string)
          subnet_id           = optional(string)
        }))
        maximum_bandwidth_mbps = optional(number)
        model_deployment_resource_configuration = optional(object({
          resource_limit_configuration = optional(object({
            memory_in_gbs = number
            ocpus         = number
          }))
          resource_request_configuration = object({
            gpus          = optional(number)
            memory_in_gbs = number
            ocpus         = number
          })
        }))
        scaling_policy = optional(object({
          auto_scaling_policies = optional(list(object({
            auto_scaling_policy_type = string
            initial_instance_count   = number
            maximum_instance_count   = number
            minimum_instance_count   = number
            rules = list(object({
              metric_expression_rule_type = string
              metric_type                 = optional(string)
              scale_configuration = optional(object({
                metric_namespace                  = optional(string)
                query                             = optional(string)
                target_scaling_configuration_type = optional(string)
                threshold                         = optional(number)
              }))
              scale_in_configuration = optional(object({
                instance_count_adjustment  = optional(number)
                pending_duration           = optional(string)
                query                      = optional(string)
                scaling_configuration_type = optional(string)
                threshold                  = optional(number)
              }))
              scale_out_configuration = optional(object({
                instance_count_adjustment  = optional(number)
                pending_duration           = optional(string)
                query                      = optional(string)
                scaling_configuration_type = optional(string)
                threshold                  = optional(number)
              }))
            }))
            scale_in_policy = optional(object({
              cool_down_in_seconds      = optional(number)
              instance_count_adjustment = optional(number)
              pending_duration          = optional(string)
            }))
            scale_out_policy = optional(object({
              cool_down_in_seconds      = optional(number)
              instance_count_adjustment = optional(number)
              pending_duration          = optional(string)
            }))
          })))
          cool_down_in_seconds = optional(number)
          instance_count       = optional(number)
          is_enabled           = optional(bool)
          policy_type          = string
        }))
      }))
      model_configuration_details = optional(object({
        bandwidth_mbps = optional(number)
        instance_configuration = optional(object({
          instance_shape_name = optional(string)
          model_deployment_instance_shape_config_details = optional(object({
            cpu_baseline  = optional(string)
            memory_in_gbs = optional(number)
            ocpus         = optional(number)
          }))
          network_access_type = optional(string)
          private_endpoint_id = optional(string)
          subnet_id           = optional(string)
        }))
        maximum_bandwidth_mbps = optional(number)
        model_id               = optional(string)
        scaling_policy = optional(object({
          auto_scaling_policies = optional(list(object({
            auto_scaling_policy_type = string
            initial_instance_count   = number
            maximum_instance_count   = number
            minimum_instance_count   = number
            rules = list(object({
              metric_expression_rule_type = string
              metric_type                 = optional(string)
              scale_in_configuration = object({
                instance_count_adjustment  = optional(number)
                pending_duration           = optional(string)
                query                      = optional(string)
                scaling_configuration_type = optional(string)
                threshold                  = optional(number)
              })
              scale_out_configuration = object({
                instance_count_adjustment  = optional(number)
                pending_duration           = optional(string)
                query                      = optional(string)
                scaling_configuration_type = optional(string)
                threshold                  = optional(number)
              })
            }))
          })))
          cool_down_in_seconds = optional(number)
          instance_count       = optional(number)
          is_enabled           = optional(bool)
          policy_type          = string
        }))
      }))
      model_group_configuration_details = optional(object({
        model_group_id = optional(string)
      }))
    })
    category_log_details = optional(object({
      access = optional(object({
        log_group_id = string
        log_id       = string
      }))
      predict = optional(object({
        log_group_id = string
        log_id       = string
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_deployments : (
        v.model_deployment_configuration_details.infrastructure_configuration_details == null || (v.model_deployment_configuration_details.infrastructure_configuration_details.scaling_policy == null || (v.model_deployment_configuration_details.infrastructure_configuration_details.scaling_policy.auto_scaling_policies == null || alltrue([for item in v.model_deployment_configuration_details.infrastructure_configuration_details.scaling_policy.auto_scaling_policies : (length(item.rules) >= 1)])))
      )
    ])
    error_message = "Each rules list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_deployments : (
        v.model_deployment_configuration_details.model_configuration_details == null || (v.model_deployment_configuration_details.model_configuration_details.scaling_policy == null || (v.model_deployment_configuration_details.model_configuration_details.scaling_policy.auto_scaling_policies == null || alltrue([for item in v.model_deployment_configuration_details.model_configuration_details.scaling_policy.auto_scaling_policies : (length(item.rules) >= 1)])))
      )
    ])
    error_message = "Each rules list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_deployments : (
        contains([for v in ["MODEL_GROUP", "SINGLE_MODEL", "SINGLE_MODEL_FLEX"] : lower(v)], lower(v.model_deployment_configuration_details.deployment_type))
      )
    ])
    error_message = "must be one of: \"MODEL_GROUP\", \"SINGLE_MODEL\", \"SINGLE_MODEL_FLEX\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_deployments : (
        v.model_deployment_configuration_details.environment_configuration_details == null || (contains([for v in ["DEFAULT", "OCIR_CONTAINER"] : lower(v)], lower(v.model_deployment_configuration_details.environment_configuration_details.environment_configuration_type)))
      )
    ])
    error_message = "must be one of: \"DEFAULT\", \"OCIR_CONTAINER\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_deployments : (
        v.model_deployment_configuration_details.infrastructure_configuration_details == null || (contains([for v in ["INSTANCE_POOL", "MANAGED_COMPUTE_CLUSTER"] : lower(v)], lower(v.model_deployment_configuration_details.infrastructure_configuration_details.infrastructure_type)))
      )
    ])
    error_message = "must be one of: \"INSTANCE_POOL\", \"MANAGED_COMPUTE_CLUSTER\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_deployments : (
        v.model_deployment_configuration_details.infrastructure_configuration_details == null || (v.model_deployment_configuration_details.infrastructure_configuration_details.scaling_policy == null || (contains([for v in ["AUTOSCALING", "FIXED_SIZE"] : lower(v)], lower(v.model_deployment_configuration_details.infrastructure_configuration_details.scaling_policy.policy_type))))
      )
    ])
    error_message = "must be one of: \"AUTOSCALING\", \"FIXED_SIZE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_deployments : (
        v.model_deployment_configuration_details.infrastructure_configuration_details == null || (v.model_deployment_configuration_details.infrastructure_configuration_details.scaling_policy == null || (v.model_deployment_configuration_details.infrastructure_configuration_details.scaling_policy.auto_scaling_policies == null || alltrue([for item in v.model_deployment_configuration_details.infrastructure_configuration_details.scaling_policy.auto_scaling_policies : (contains([for v in ["THRESHOLD"] : lower(v)], lower(item.auto_scaling_policy_type)))])))
      )
    ])
    error_message = "must be one of: \"THRESHOLD\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_deployments : (
        v.model_deployment_configuration_details.infrastructure_configuration_details == null || (v.model_deployment_configuration_details.infrastructure_configuration_details.scaling_policy == null || (v.model_deployment_configuration_details.infrastructure_configuration_details.scaling_policy.auto_scaling_policies == null || alltrue([for item in v.model_deployment_configuration_details.infrastructure_configuration_details.scaling_policy.auto_scaling_policies : (alltrue([for item in item.rules : (contains([for v in ["CUSTOM_EXPRESSION", "PREDEFINED_EXPRESSION", "TARGET_CUSTOM_EXPRESSION", "TARGET_PREDEFINED_EXPRESSION"] : lower(v)], lower(item.metric_expression_rule_type)))]))])))
      )
    ])
    error_message = "must be one of: \"CUSTOM_EXPRESSION\", \"PREDEFINED_EXPRESSION\", \"TARGET_CUSTOM_EXPRESSION\", \"TARGET_PREDEFINED_EXPRESSION\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_deployments : (
        v.model_deployment_configuration_details.model_configuration_details == null || (v.model_deployment_configuration_details.model_configuration_details.scaling_policy == null || (contains([for v in ["AUTOSCALING", "FIXED_SIZE"] : lower(v)], lower(v.model_deployment_configuration_details.model_configuration_details.scaling_policy.policy_type))))
      )
    ])
    error_message = "must be one of: \"AUTOSCALING\", \"FIXED_SIZE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_deployments : (
        v.model_deployment_configuration_details.model_configuration_details == null || (v.model_deployment_configuration_details.model_configuration_details.scaling_policy == null || (v.model_deployment_configuration_details.model_configuration_details.scaling_policy.auto_scaling_policies == null || alltrue([for item in v.model_deployment_configuration_details.model_configuration_details.scaling_policy.auto_scaling_policies : (contains([for v in ["THRESHOLD"] : lower(v)], lower(item.auto_scaling_policy_type)))])))
      )
    ])
    error_message = "must be one of: \"THRESHOLD\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_deployments : (
        v.model_deployment_configuration_details.model_configuration_details == null || (v.model_deployment_configuration_details.model_configuration_details.scaling_policy == null || (v.model_deployment_configuration_details.model_configuration_details.scaling_policy.auto_scaling_policies == null || alltrue([for item in v.model_deployment_configuration_details.model_configuration_details.scaling_policy.auto_scaling_policies : (alltrue([for item in item.rules : (contains([for v in ["CUSTOM_EXPRESSION", "PREDEFINED_EXPRESSION"] : lower(v)], lower(item.metric_expression_rule_type)))]))])))
      )
    ])
    error_message = "must be one of: \"CUSTOM_EXPRESSION\", \"PREDEFINED_EXPRESSION\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_model_deployments : (
        v.state == null || (contains([for v in ["INACTIVE", "ACTIVE"] : lower(v)], lower(v.state)))
      )
    ])
    error_message = "must be one of: \"INACTIVE\", \"ACTIVE\""
  }
}

