local mod = get_mod("strip_chat_colors")

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = {
			{
				setting_id = "strip_settings_group",
				type = "group",
				tab = "General",
				sub_widgets = {
					{
						setting_id = "strip_colors",
						type = "checkbox",
						default_value = true,
					},
					{
						setting_id = "strip_fonts",
						type = "checkbox",
						default_value = true,
					},
					{
						setting_id = "strip_sizes",
						type = "checkbox",
						default_value = true,
					},
					{
						setting_id = "strip_decorations",
						type = "checkbox",
						default_value = true,
					},
					{
						setting_id = "force_lowercase",
						type = "checkbox",
						default_value = false,
					}
				}
			}
		}
	}
}
