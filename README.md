# <img src="docs/opentofu.png" alt="opentofu" height="20"/> gitlab-group

Zarządzanie grupami w GitLab

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.5 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | 18.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | 18.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [gitlab_group.group](https://registry.terraform.io/providers/gitlabhq/gitlab/18.7.0/docs/resources/group) | resource |
| [gitlab_group_badge.badge](https://registry.terraform.io/providers/gitlabhq/gitlab/18.7.0/docs/resources/group_badge) | resource |
| [gitlab_group_label.label](https://registry.terraform.io/providers/gitlabhq/gitlab/18.7.0/docs/resources/group_label) | resource |
| [gitlab_group_membership.members](https://registry.terraform.io/providers/gitlabhq/gitlab/18.7.0/docs/resources/group_membership) | resource |
| [gitlab_group_share_group.shared_groups](https://registry.terraform.io/providers/gitlabhq/gitlab/18.7.0/docs/resources/group_share_group) | resource |
| [gitlab_group_variable.variable](https://registry.terraform.io/providers/gitlabhq/gitlab/18.7.0/docs/resources/group_variable) | resource |
| [gitlab_group.parent](https://registry.terraform.io/providers/gitlabhq/gitlab/18.7.0/docs/data-sources/group) | data source |
| [gitlab_group.shared_groups](https://registry.terraform.io/providers/gitlabhq/gitlab/18.7.0/docs/data-sources/group) | data source |
| [gitlab_user.members](https://registry.terraform.io/providers/gitlabhq/gitlab/18.7.0/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_avatar_types_json"></a> [allowed\_avatar\_types\_json](#input\_allowed\_avatar\_types\_json) | Path to allowed avatar types json | `string` | `""` | no |
| <a name="input_avatar"></a> [avatar](#input\_avatar) | Type of the icon for the group (default: from type) | `string` | `""` | no |
| <a name="input_avatars_dir"></a> [avatars\_dir](#input\_avatars\_dir) | Avatars directory png files | `string` | `""` | no |
| <a name="input_badges"></a> [badges](#input\_badges) | n/a | <pre>map(object({<br/>    link_url  = string<br/>    image_url = string<br/>  }))</pre> | `{}` | no |
| <a name="input_default_branch"></a> [default\_branch](#input\_default\_branch) | The group's default branch | `string` | `"main"` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the gitlab group | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | n/a | <pre>map(object({<br/>    description = string<br/>    color       = string<br/>  }))</pre> | `{}` | no |
| <a name="input_members"></a> [members](#input\_members) | Map of GitLab users to add to the group keyed by username | <pre>map(object({<br/>    access_level = string<br/>    expires_at   = optional(string)<br/>  }))</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the gitlab group | `string` | n/a | yes |
| <a name="input_parent_group"></a> [parent\_group](#input\_parent\_group) | Gitlab parent group | `string` | n/a | yes |
| <a name="input_shared_groups"></a> [shared\_groups](#input\_shared\_groups) | Map of GitLab groups to share access to this group keyed by group full path | <pre>map(object({<br/>    access_level = string<br/>    expires_at   = optional(string)<br/>  }))</pre> | `{}` | no |
| <a name="input_variables"></a> [variables](#input\_variables) | n/a | <pre>map(object({<br/>    value             = string<br/>    description       = optional(string)<br/>    protected         = optional(bool)<br/>    masked            = optional(bool)<br/>    environment_scope = optional(string)<br/>  }))</pre> | `{}` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | The group's visibility | `string` | `"private"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_full_path"></a> [full\_path](#output\_full\_path) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END_TF_DOCS -->

---
## Contributions
Jeśli masz pomysły na ulepszenia, zgłoś problemy, rozwidl repozytorium lub utwórz Merge Request. Wszystkie wkłady są mile widziane!
[Contributions](CONTRIBUTING.md)

---
## License
Projekt jest udostępniany na warunkach licencji opisanych w pliku [LICENSE](LICENSE).

---
# Author Information
### &emsp; Maciej Rachuna
# <img src="docs/logo.png" alt="rachuna-net.pl" height="100"/>