data "gitlab_group" "parent" {
  count     = var.parent_group != "" ? 1 : 0
  full_path = var.parent_group
}

data "gitlab_user" "members" {
  for_each = var.members

  username = each.key
}

data "gitlab_group" "shared_groups" {
  for_each = var.shared_groups

  full_path = each.key
}
