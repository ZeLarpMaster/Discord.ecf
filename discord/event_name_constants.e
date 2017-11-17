note
	description: "{STRING} constantes for user event"
	author: "Alexandre Caron"
	date: "Mon, 06 Nov 2017 21:22:00 +0000"
	revision: "0.0.1"

class
	EVENT_NAME_CONSTANTS

feature -- Access

	Ready: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "READY"
		end

	Resumed: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "RESUMED"
		end

	Channel_create: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "CHANNEL_CREATE"
		end

	Channel_update: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "CHANNEL_UPDATE"
		end

	Channel_delete: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "CHANNEL_DELETE"
		end

	Channel_pins_update: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "CHANNEL_PINS_UPDATE"
		end

	Guild_create: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "GUILD_CREATE"
		end

	Guild_update: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "GUILD_UPDATE"
		end

	Guild_delete: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "GUILD_DELETE"
		end

	Guild_ban_add: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "GUILD_BAN_ADD"
		end

	Guild_ban_remove: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "GUILD_BAN_REMOVE"
		end

	Guild_emojis_update: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "GUILD_EMOJIS_UPDATE"
		end

	Guild_integerations_update: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "GUILD_INTEGERATIONS_UPDATE"
		end

	Guild_member_add: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "GUILD_MEMBER_ADD"
		end

	Guild_member_remove: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "GUILD_MEMBER_REMOVE"
		end

	Guild_member_update: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "GUILD_MEMBER_UPDATE"
		end

	Guild_role_create: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "GUILD_ROLE_CREATE"
		end

	Guild_role_update: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "GUILD_ROLE_UPDATE"
		end

	Guild_role_delete: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "GUILD_ROLE_DELETE"
		end

	Message_create: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "MESSAGE_CREATE"
		end

	Message_update: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "MESSAGE_UPDATE"
		end

	Message_delete: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "MESSAGE_DELETE"
		end

	Message_delete_bulk: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "MESSAGE_DELETE_BULK"
		end

	Message_reaction_add: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "MESSAGE_REACTION_ADD"
		end

	Message_reaction_remove: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "MESSAGE_REACTION_REMOVE"
		end

	Message_reaction_remove_all: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "MESSAGE_REACTION_REMOVE_ALL"
		end

	Presence_update: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "PRESENCE_UPDATE"
		end

	Typing_start: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "TYPING_START"
		end

	User_update: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "USER_UPDATE"
		end

	Voice_state_update: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "VOICE_STATE_UPDATE"
		end

	Voice_server_update: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "VOICE_SERVER_UPDATE"
		end

	Webhooks_update: READABLE_STRING_GENERAL
		once("PROCESS")
			Result := "WEBHOOKS_UPDATE"
		end

end
