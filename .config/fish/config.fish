set -x EDITOR vim

umask 022

function fish_user_key_bindings
	fish_default_key_bindings -M insert

	fish_vi_key_bindings insert

	fzf_key_bindings
end
