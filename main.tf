resource "oci_datascience_model_deployment" "datascience_model_deployments" {
  for_each = var.datascience_model_deployments

  compartment_id     = each.value.compartment_id
  project_id         = each.value.project_id
  defined_tags       = each.value.defined_tags
  description        = each.value.description
  display_name       = each.value.display_name
  freeform_tags      = each.value.freeform_tags
  opc_parent_rpt_url = each.value.opc_parent_rpt_url
  state              = each.value.state

  model_deployment_configuration_details {
    deployment_type = each.value.model_deployment_configuration_details.deployment_type
    dynamic "environment_configuration_details" {
      for_each = each.value.model_deployment_configuration_details.environment_configuration_details != null ? [each.value.model_deployment_configuration_details.environment_configuration_details] : []
      content {
        cmd = environment_configuration_details.value.cmd
        dynamic "custom_http_endpoints" {
          for_each = environment_configuration_details.value.custom_http_endpoints != null ? environment_configuration_details.value.custom_http_endpoints : []
          content {
            endpoint_uri_suffix = custom_http_endpoints.value.endpoint_uri_suffix
            http_methods        = custom_http_endpoints.value.http_methods
          }
        }
        default_environment_variables  = environment_configuration_details.value.default_environment_variables
        entrypoint                     = environment_configuration_details.value.entrypoint
        environment_configuration_type = environment_configuration_details.value.environment_configuration_type
        environment_variables          = environment_configuration_details.value.environment_variables
        health_check_port              = environment_configuration_details.value.health_check_port
        image                          = environment_configuration_details.value.image
        image_digest                   = environment_configuration_details.value.image_digest
        image_signature_id             = environment_configuration_details.value.image_signature_id
        predict_api_specification      = environment_configuration_details.value.predict_api_specification
        server_port                    = environment_configuration_details.value.server_port
      }
    }
    dynamic "infrastructure_configuration_details" {
      for_each = each.value.model_deployment_configuration_details.infrastructure_configuration_details != null ? [each.value.model_deployment_configuration_details.infrastructure_configuration_details] : []
      content {
        bandwidth_mbps      = infrastructure_configuration_details.value.bandwidth_mbps
        compute_target_id   = infrastructure_configuration_details.value.compute_target_id
        infrastructure_type = infrastructure_configuration_details.value.infrastructure_type
        dynamic "instance_configuration" {
          for_each = infrastructure_configuration_details.value.instance_configuration != null ? [infrastructure_configuration_details.value.instance_configuration] : []
          content {
            instance_shape_name = instance_configuration.value.instance_shape_name
            dynamic "model_deployment_instance_shape_config_details" {
              for_each = instance_configuration.value.model_deployment_instance_shape_config_details != null ? [instance_configuration.value.model_deployment_instance_shape_config_details] : []
              content {
                cpu_baseline  = model_deployment_instance_shape_config_details.value.cpu_baseline
                memory_in_gbs = model_deployment_instance_shape_config_details.value.memory_in_gbs
                ocpus         = model_deployment_instance_shape_config_details.value.ocpus
              }
            }
            network_access_type = instance_configuration.value.network_access_type
            private_endpoint_id = instance_configuration.value.private_endpoint_id
            subnet_id           = instance_configuration.value.subnet_id
          }
        }
        maximum_bandwidth_mbps = infrastructure_configuration_details.value.maximum_bandwidth_mbps
        dynamic "model_deployment_resource_configuration" {
          for_each = infrastructure_configuration_details.value.model_deployment_resource_configuration != null ? [infrastructure_configuration_details.value.model_deployment_resource_configuration] : []
          content {
            dynamic "resource_limit_configuration" {
              for_each = model_deployment_resource_configuration.value.resource_limit_configuration != null ? [model_deployment_resource_configuration.value.resource_limit_configuration] : []
              content {
                memory_in_gbs = resource_limit_configuration.value.memory_in_gbs
                ocpus         = resource_limit_configuration.value.ocpus
              }
            }
            resource_request_configuration {
              gpus          = model_deployment_resource_configuration.value.resource_request_configuration.gpus
              memory_in_gbs = model_deployment_resource_configuration.value.resource_request_configuration.memory_in_gbs
              ocpus         = model_deployment_resource_configuration.value.resource_request_configuration.ocpus
            }
          }
        }
        dynamic "scaling_policy" {
          for_each = infrastructure_configuration_details.value.scaling_policy != null ? [infrastructure_configuration_details.value.scaling_policy] : []
          content {
            dynamic "auto_scaling_policies" {
              for_each = scaling_policy.value.auto_scaling_policies != null ? scaling_policy.value.auto_scaling_policies : []
              content {
                auto_scaling_policy_type = auto_scaling_policies.value.auto_scaling_policy_type
                initial_instance_count   = auto_scaling_policies.value.initial_instance_count
                maximum_instance_count   = auto_scaling_policies.value.maximum_instance_count
                minimum_instance_count   = auto_scaling_policies.value.minimum_instance_count
                dynamic "rules" {
                  for_each = auto_scaling_policies.value.rules
                  content {
                    metric_expression_rule_type = rules.value.metric_expression_rule_type
                    metric_type                 = rules.value.metric_type
                    dynamic "scale_configuration" {
                      for_each = rules.value.scale_configuration != null ? [rules.value.scale_configuration] : []
                      content {
                        metric_namespace                  = scale_configuration.value.metric_namespace
                        query                             = scale_configuration.value.query
                        target_scaling_configuration_type = scale_configuration.value.target_scaling_configuration_type
                        threshold                         = scale_configuration.value.threshold
                      }
                    }
                    dynamic "scale_in_configuration" {
                      for_each = rules.value.scale_in_configuration != null ? [rules.value.scale_in_configuration] : []
                      content {
                        instance_count_adjustment  = scale_in_configuration.value.instance_count_adjustment
                        pending_duration           = scale_in_configuration.value.pending_duration
                        query                      = scale_in_configuration.value.query
                        scaling_configuration_type = scale_in_configuration.value.scaling_configuration_type
                        threshold                  = scale_in_configuration.value.threshold
                      }
                    }
                    dynamic "scale_out_configuration" {
                      for_each = rules.value.scale_out_configuration != null ? [rules.value.scale_out_configuration] : []
                      content {
                        instance_count_adjustment  = scale_out_configuration.value.instance_count_adjustment
                        pending_duration           = scale_out_configuration.value.pending_duration
                        query                      = scale_out_configuration.value.query
                        scaling_configuration_type = scale_out_configuration.value.scaling_configuration_type
                        threshold                  = scale_out_configuration.value.threshold
                      }
                    }
                  }
                }
                dynamic "scale_in_policy" {
                  for_each = auto_scaling_policies.value.scale_in_policy != null ? [auto_scaling_policies.value.scale_in_policy] : []
                  content {
                    cool_down_in_seconds      = scale_in_policy.value.cool_down_in_seconds
                    instance_count_adjustment = scale_in_policy.value.instance_count_adjustment
                    pending_duration          = scale_in_policy.value.pending_duration
                  }
                }
                dynamic "scale_out_policy" {
                  for_each = auto_scaling_policies.value.scale_out_policy != null ? [auto_scaling_policies.value.scale_out_policy] : []
                  content {
                    cool_down_in_seconds      = scale_out_policy.value.cool_down_in_seconds
                    instance_count_adjustment = scale_out_policy.value.instance_count_adjustment
                    pending_duration          = scale_out_policy.value.pending_duration
                  }
                }
              }
            }
            cool_down_in_seconds = scaling_policy.value.cool_down_in_seconds
            instance_count       = scaling_policy.value.instance_count
            is_enabled           = scaling_policy.value.is_enabled
            policy_type          = scaling_policy.value.policy_type
          }
        }
      }
    }
    dynamic "model_configuration_details" {
      for_each = each.value.model_deployment_configuration_details.model_configuration_details != null ? [each.value.model_deployment_configuration_details.model_configuration_details] : []
      content {
        bandwidth_mbps = model_configuration_details.value.bandwidth_mbps
        dynamic "instance_configuration" {
          for_each = model_configuration_details.value.instance_configuration != null ? [model_configuration_details.value.instance_configuration] : []
          content {
            instance_shape_name = instance_configuration.value.instance_shape_name
            dynamic "model_deployment_instance_shape_config_details" {
              for_each = instance_configuration.value.model_deployment_instance_shape_config_details != null ? [instance_configuration.value.model_deployment_instance_shape_config_details] : []
              content {
                cpu_baseline  = model_deployment_instance_shape_config_details.value.cpu_baseline
                memory_in_gbs = model_deployment_instance_shape_config_details.value.memory_in_gbs
                ocpus         = model_deployment_instance_shape_config_details.value.ocpus
              }
            }
            network_access_type = instance_configuration.value.network_access_type
            private_endpoint_id = instance_configuration.value.private_endpoint_id
            subnet_id           = instance_configuration.value.subnet_id
          }
        }
        maximum_bandwidth_mbps = model_configuration_details.value.maximum_bandwidth_mbps
        model_id               = model_configuration_details.value.model_id
        dynamic "scaling_policy" {
          for_each = model_configuration_details.value.scaling_policy != null ? [model_configuration_details.value.scaling_policy] : []
          content {
            dynamic "auto_scaling_policies" {
              for_each = scaling_policy.value.auto_scaling_policies != null ? scaling_policy.value.auto_scaling_policies : []
              content {
                auto_scaling_policy_type = auto_scaling_policies.value.auto_scaling_policy_type
                initial_instance_count   = auto_scaling_policies.value.initial_instance_count
                maximum_instance_count   = auto_scaling_policies.value.maximum_instance_count
                minimum_instance_count   = auto_scaling_policies.value.minimum_instance_count
                dynamic "rules" {
                  for_each = auto_scaling_policies.value.rules
                  content {
                    metric_expression_rule_type = rules.value.metric_expression_rule_type
                    metric_type                 = rules.value.metric_type
                    scale_in_configuration {
                      instance_count_adjustment  = rules.value.scale_in_configuration.instance_count_adjustment
                      pending_duration           = rules.value.scale_in_configuration.pending_duration
                      query                      = rules.value.scale_in_configuration.query
                      scaling_configuration_type = rules.value.scale_in_configuration.scaling_configuration_type
                      threshold                  = rules.value.scale_in_configuration.threshold
                    }
                    scale_out_configuration {
                      instance_count_adjustment  = rules.value.scale_out_configuration.instance_count_adjustment
                      pending_duration           = rules.value.scale_out_configuration.pending_duration
                      query                      = rules.value.scale_out_configuration.query
                      scaling_configuration_type = rules.value.scale_out_configuration.scaling_configuration_type
                      threshold                  = rules.value.scale_out_configuration.threshold
                    }
                  }
                }
              }
            }
            cool_down_in_seconds = scaling_policy.value.cool_down_in_seconds
            instance_count       = scaling_policy.value.instance_count
            is_enabled           = scaling_policy.value.is_enabled
            policy_type          = scaling_policy.value.policy_type
          }
        }
      }
    }
    dynamic "model_group_configuration_details" {
      for_each = each.value.model_deployment_configuration_details.model_group_configuration_details != null ? [each.value.model_deployment_configuration_details.model_group_configuration_details] : []
      content {
        model_group_id = model_group_configuration_details.value.model_group_id
      }
    }
  }

  dynamic "category_log_details" {
    for_each = each.value.category_log_details != null ? [each.value.category_log_details] : []
    content {
      dynamic "access" {
        for_each = category_log_details.value.access != null ? [category_log_details.value.access] : []
        content {
          log_group_id = access.value.log_group_id
          log_id       = access.value.log_id
        }
      }
      dynamic "predict" {
        for_each = category_log_details.value.predict != null ? [category_log_details.value.predict] : []
        content {
          log_group_id = predict.value.log_group_id
          log_id       = predict.value.log_id
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

