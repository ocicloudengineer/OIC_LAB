variable compartment_ocid {}
variable autoscaling_variables {}
variable auto_scaling_resources {}
variable auto_scaling_type { type = string }

resource oci_autoscaling_auto_scaling_configuration autoscalint_res {
  auto_scaling_resources {
    id   = var.auto_scaling_resources.id
    type = var.auto_scaling_type
  }
  compartment_id       = var.compartment_ocid
  cool_down_in_seconds = var.autoscaling_variables.cool_down_in_seconds
  display_name         = var.autoscaling_variables.display_name
  freeform_tags        = var.autoscaling_variables.freeform_tags
  is_enabled           = var.autoscaling_variables.is_enabled
  policies {
    is_enabled   = var.autoscaling_variables.policies_list.start.is_enabled
    policy_type  = var.autoscaling_variables.policies_list.start.policy_type
    display_name = var.autoscaling_variables.policies_list.start.display_name
    capacity {
      initial = var.autoscaling_variables.policies_list.start.capacity.initial
      max     = var.autoscaling_variables.policies_list.start.capacity.max
      min     = var.autoscaling_variables.policies_list.start.capacity.min
    }
    execution_schedule {
      expression = var.autoscaling_variables.policies_list.start.execution_schedule.expression
      timezone   = var.autoscaling_variables.policies_list.start.execution_schedule.timezone
      type       = var.autoscaling_variables.policies_list.start.execution_schedule.type
    }
  }
}