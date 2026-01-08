variable "name" {
  type        = string
  description = "Name of the gitlab group"
}

variable "description" {
  type        = string
  description = "Description of the gitlab group"
}

variable "parent_group" {
  type        = string
  description = "Gitlab parent group"
}

variable "visibility" {
  type        = string
  default     = "private"
  description = "The group's visibility"

  validation {
    condition = contains([
      "private",
      "internal",
      "public"
    ], var.visibility)
    error_message = "Unsupported group visibility"
  }
}

variable "default_branch" {
  type        = string
  default     = "main"
  description = "The group's default branch"
}

variable "allowed_avatar_types_json" {
  type        = string
  default     = ""
  description = "Path to allowed avatar types json"
}


variable "avatar" {
  type        = string
  description = "Type of the icon for the group (default: from type)"
  default     = ""

  validation {
    condition     = contains(local.allowed_avatar_types, var.avatar)
    error_message = "Unsupported group type"
  }
}

variable "labels" {
  type = map(object({
    description = string
    color       = string
  }))
  default = {}
}

variable "badges" {
  type = map(object({
    link_url  = string
    image_url = string
  }))
  default = {}
}

variable "variables" {
  type = map(object({
    value             = string
    description       = optional(string)
    protected         = optional(bool)
    masked            = optional(bool)
    environment_scope = optional(string)
  }))
  default = {}
}

variable "members" {
  description = "Map of GitLab users to add to the group keyed by username"
  type = map(object({
    access_level = string
    expires_at   = optional(string)
  }))
  default = {}

  validation {
    condition = alltrue([
      for member in var.members :
      contains([
        "guest",
        "reporter",
        "developer",
        "maintainer",
        "owner"
      ], member.access_level)
    ])
    error_message = "Unsupported access level for members"
  }
}

variable "shared_groups" {
  description = "Map of GitLab groups to share access to this group keyed by group full path"
  type = map(object({
    access_level = string
    expires_at   = optional(string)
  }))
  default = {}

  validation {
    condition = alltrue([
      for share in var.shared_groups :
      contains([
        "guest",
        "reporter",
        "developer",
        "maintainer",
        "owner"
      ], share.access_level)
    ])
    error_message = "Unsupported access level for shared groups"
  }
}

variable "avatars_dir" {
  description = "Avatars directory png files"
  type        = string
  default     = ""
}
