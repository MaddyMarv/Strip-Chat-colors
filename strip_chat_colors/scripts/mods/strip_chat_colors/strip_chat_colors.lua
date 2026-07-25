local mod = get_mod("strip_chat_colors")

mod:hook("ChatManager", "_handle_event", function(func, self, message)
	if message and type(message.message_body) == "string" and string.sub(message.message_body, 1, 5) == "<loc|" then
		message._is_game_message = true
	end
	return func(self, message)
end)

mod:hook("ConstantElementChat", "cb_chat_manager_message_recieved", function(func, self, channel_handle, participant, message)
	if message and type(message.message_body) == "string" and not message._is_game_message then
		local new_body = message.message_body

		if mod:get("strip_colors") then
			new_body = string.gsub(new_body, "{#color%(.-%)}", "")
		end

		if mod:get("strip_fonts") then
			new_body = string.gsub(new_body, "{#font%(.-%)}", "")
		end

		if mod:get("strip_sizes") then
			new_body = string.gsub(new_body, "{#size%(.-%)}", "")
		end

		if mod:get("strip_colors") or mod:get("strip_fonts") or mod:get("strip_sizes") then
			new_body = string.gsub(new_body, "{#reset%(%)}", "")
		end

		if mod:get("force_lowercase") then
			new_body = string.lower(new_body)
		end

		local new_message = table.clone(message)
		new_message.message_body = new_body
		return func(self, channel_handle, participant, new_message)
	end

	return func(self, channel_handle, participant, message)
end)
