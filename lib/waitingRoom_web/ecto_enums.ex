# lib/my_app/ecto_enums.ex

import EctoEnum

defenum AdminRolesEnum, :admin_roles, [:owner, :developer, :admin, :editor, :contributor, :viewer]

defenum AlertTypesEnum, :alert_types, [:initial, :confirmation, :req_for_conf, :cancellation, :change]
