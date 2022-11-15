#######################################################################
#  Resources
#######################################################################

resource "aws_efs_file_system" "efs" {
  creation_token   = var.efs_name
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = true
  tags = {
    Name = var.efs_name
  }
}

resource "aws_efs_mount_target" "mount_target" {
  file_system_id  = aws_efs_file_system.efs.id
  count           = length(var.subnet_ids)
  subnet_id       = element(var.subnet_ids, count.index)
  security_groups = var.security_groups
}

#######################################################################
# Outputs
#######################################################################

output "dns_name" {
  value      = aws_efs_file_system.efs.dns_name
  depends_on = [aws_efs_mount_target.mount_target]
}

output "id" {
  value      = aws_efs_file_system.efs.id
  depends_on = [aws_efs_mount_target.mount_target]

}
