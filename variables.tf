#######################################################################
# Declaration of Variables
#######################################################################

variable "efs_name" { 
    description = "Name for the EFS" 
}
variable "subnet_ids" {
  description = "Subnets IDs"
  type        = list
}
variable "security_groups" {
  description = "Mount targets security groups"
  type        = list
}
