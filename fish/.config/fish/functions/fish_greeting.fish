function fish_greeting
	if set -q fish_private_mode
		_ "fish is running in private mode, history will not be persisted."; echo
	end

	prompt_login; echo
end
