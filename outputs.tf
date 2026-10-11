output "datascience_model_deployments_id" {
  description = "Map of id values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no id are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => v.id if v.id != null && length(v.id) > 0 }
}
output "datascience_model_deployments_category_log_details" {
  description = "Map of category_log_details values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no category_log_details are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => one(v.category_log_details) if v.category_log_details != null && length(v.category_log_details) > 0 }
}
output "datascience_model_deployments_compartment_id" {
  description = "Map of compartment_id values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no compartment_id are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "datascience_model_deployments_created_by" {
  description = "Map of created_by values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no created_by are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => v.created_by if v.created_by != null && length(v.created_by) > 0 }
}
output "datascience_model_deployments_defined_tags" {
  description = "Map of defined_tags values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no defined_tags are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "datascience_model_deployments_description" {
  description = "Map of description values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no description are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => v.description if v.description != null && length(v.description) > 0 }
}
output "datascience_model_deployments_display_name" {
  description = "Map of display_name values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no display_name are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "datascience_model_deployments_freeform_tags" {
  description = "Map of freeform_tags values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "datascience_model_deployments_lifecycle_details" {
  description = "Map of lifecycle_details values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "datascience_model_deployments_model_deployment_configuration_details" {
  description = "Map of model_deployment_configuration_details values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no model_deployment_configuration_details are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => one(v.model_deployment_configuration_details) if v.model_deployment_configuration_details != null && length(v.model_deployment_configuration_details) > 0 }
}
output "datascience_model_deployments_model_deployment_system_data" {
  description = "Map of model_deployment_system_data values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no model_deployment_system_data are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => v.model_deployment_system_data if v.model_deployment_system_data != null && length(v.model_deployment_system_data) > 0 }
}
output "datascience_model_deployments_model_deployment_url" {
  description = "Map of model_deployment_url values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no model_deployment_url are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => v.model_deployment_url if v.model_deployment_url != null && length(v.model_deployment_url) > 0 }
}
output "datascience_model_deployments_opc_parent_rpt_url" {
  description = "Map of opc_parent_rpt_url values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no opc_parent_rpt_url are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => v.opc_parent_rpt_url if v.opc_parent_rpt_url != null && length(v.opc_parent_rpt_url) > 0 }
}
output "datascience_model_deployments_project_id" {
  description = "Map of project_id values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no project_id are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}
output "datascience_model_deployments_state" {
  description = "Map of state values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no state are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => v.state if v.state != null && length(v.state) > 0 }
}
output "datascience_model_deployments_time_created" {
  description = "Map of time_created values across all datascience_model_deployments, keyed the same as var.datascience_model_deployments except keys with no time_created are omitted"
  value       = { for k, v in oci_datascience_model_deployment.datascience_model_deployments : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}

