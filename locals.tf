locals {
  avatars_dir = var.avatars_dir == "" ? "${path.root}/images/group" : var.avatars_dir

  allowed_avatar_types_json = var.allowed_avatar_types_json == "" ? "${path.root}/data/allowed_avatar_group_types.json" : var.allowed_avatar_types_json
  allowed_avatar_types      = jsondecode(file(local.allowed_avatar_types_json))

  # Define the allowed project types as a map
  avatar = try(file("${local.avatars_dir}/${var.avatar}.png"), null) == null ? "${local.avatars_dir}/${var.avatar}.png" : null
}