resource "gitlab_group" "group" {
  name             = var.name
  path             = var.name
  description      = var.description
  parent_id        = var.parent_group != "" ? data.gitlab_group.parent[0].id : null
  visibility_level = var.visibility
  default_branch   = var.default_branch
  avatar           = local.avatar == null ? null : local.avatar
  avatar_hash      = local.avatar == null ? null : filesha256(local.avatar)
}

resource "gitlab_group_label" "label" {
  for_each = var.labels

  group       = gitlab_group.group.id
  name        = each.key
  description = each.value.description
  color       = each.value.color
}

resource "gitlab_group_badge" "badge" {
  for_each = var.badges

  group     = gitlab_group.group.id
  name      = each.key
  link_url  = each.value.link_url
  image_url = each.value.image_url
}

resource "gitlab_group_variable" "variable" {
  for_each = var.variables

  group             = gitlab_group.group.id
  key               = each.key
  value             = each.value.value
  description       = each.value.description
  protected         = each.value.protected
  masked            = each.value.masked
  environment_scope = each.value.environment_scope
}

resource "gitlab_group_membership" "members" {
  for_each = var.members

  group_id     = gitlab_group.group.id
  user_id      = data.gitlab_user.members[each.key].id
  access_level = each.value.access_level
  expires_at   = try(each.value.expires_at, null)
}

resource "gitlab_group_share_group" "shared_groups" {
  for_each = var.shared_groups

  group_id       = gitlab_group.group.id
  share_group_id = data.gitlab_group.shared_groups[each.key].id
  group_access   = each.value.access_level
  expires_at     = try(each.value.expires_at, null)
}
