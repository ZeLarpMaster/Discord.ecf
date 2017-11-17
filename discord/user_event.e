note
	description: "Model containing the information of a user event"
	author: "Alexandre Caron"
	date: "Mon, 06 Nov 2017 21:22:00 +0000"
	revision: "0.0.1"

class
	USER_EVENT

inherit
	EVENT_NAME_CONSTANTS

create
	make

feature -- Initialization

	make(a_event_name: READABLE_STRING_GENERAL; a_data: detachable ANY)
	 		-- Initializes `Current' with the name `a_event_name' and the data `a_data'
		do
			event_name := a_event_name
			data := a_data
		ensure
			Event_Name_Set: event_name ~ a_event_name
			Data_Set: data ~ a_data
		end

feature -- Access

	is_ready: BOOLEAN
			-- Whether or not `Current' is a `Ready' event
		do
			Result := event_name ~ Ready
		end

	is_resumed: BOOLEAN
			-- Whether or not `Current' is a `Resumed' event
		do
			Result := event_name ~ Resumed
		end

	is_channel_create: BOOLEAN
			-- Whether or not `Current' is a `Channel_create' event
		do
			Result := event_name ~ Channel_create
		end

	is_channel_update: BOOLEAN
			-- Whether or not `Current' is a `Channel_update' event
		do
			Result := event_name ~ Channel_update
		end

	is_channel_delete: BOOLEAN
			-- Whether or not `Current' is a `Channel_delete' event
		do
			Result := event_name ~ Channel_delete
		end

	is_channel_pins_update: BOOLEAN
			-- Whether or not `Current' is a `Channel_pins_update' event
		do
			Result := event_name ~ Channel_pins_update
		end

	is_guild_create: BOOLEAN
			-- Whether or not `Current' is a `Guild_create' event
		do
			Result := event_name ~ Guild_create
		end

	is_guild_update: BOOLEAN
			-- Whether or not `Current' is a `Guild_update' event
		do
			Result := event_name ~ Guild_update
		end

	is_guild_delete: BOOLEAN
			-- Whether or not `Current' is a `Guild_delete' event
		do
			Result := event_name ~ Guild_delete
		end

	is_guild_ban_add: BOOLEAN
			-- Whether or not `Current' is a `Guild_ban_add' event
		do
			Result := event_name ~ Guild_ban_add
		end

	is_guild_ban_remove: BOOLEAN
			-- Whether or not `Current' is a `Guild_ban_remove' event
		do
			Result := event_name ~ Guild_ban_remove
		end

	is_guild_emojis_update: BOOLEAN
			-- Whether or not `Current' is a `Guild_emojis_update' event
		do
			Result := event_name ~ Guild_emojis_update
		end

	is_guild_integerations_update: BOOLEAN
			-- Whether or not `Current' is a `Guild_integerations_update' event
		do
			Result := event_name ~ Guild_integerations_update
		end

	is_guild_member_add: BOOLEAN
			-- Whether or not `Current' is a `Guild_member_add' event
		do
			Result := event_name ~ Guild_member_add
		end

	is_guild_member_remove: BOOLEAN
			-- Whether or not `Current' is a `Guild_member_remove' event
		do
			Result := event_name ~ Guild_member_remove
		end

	is_guild_member_update: BOOLEAN
			-- Whether or not `Current' is a `Guild_member_update' event
		do
			Result := event_name ~ Guild_member_update
		end

	is_guild_role_create: BOOLEAN
			-- Whether or not `Current' is a `Guild_role_create' event
		do
			Result := event_name ~ Guild_role_create
		end

	is_guild_role_update: BOOLEAN
			-- Whether or not `Current' is a `Guild_role_update' event
		do
			Result := event_name ~ Guild_role_update
		end

	is_guild_role_delete: BOOLEAN
			-- Whether or not `Current' is a `Guild_role_delete' event
		do
			Result := event_name ~ Guild_role_delete
		end

	is_message_create: BOOLEAN
			-- Whether or not `Current' is a `Message_create' event
		do
			Result := event_name ~ Message_create
		end

	is_message_update: BOOLEAN
			-- Whether or not `Current' is a `Message_update' event
		do
			Result := event_name ~ Message_update
		end

	is_message_delete: BOOLEAN
			-- Whether or not `Current' is a `Message_delete' event
		do
			Result := event_name ~ Message_delete
		end

	is_message_delete_bulk: BOOLEAN
			-- Whether or not `Current' is a `Message_delete_bulk' event
		do
			Result := event_name ~ Message_delete_bulk
		end

	is_message_reaction_add: BOOLEAN
			-- Whether or not `Current' is a `Message_reaction_add' event
		do
			Result := event_name ~ Message_reaction_add
		end

	is_message_reaction_remove: BOOLEAN
			-- Whether or not `Current' is a `Message_reaction_remove' event
		do
			Result := event_name ~ Message_reaction_remove
		end

	is_message_reaction_remove_all: BOOLEAN
			-- Whether or not `Current' is a `Message_reaction_remove_all' event
		do
			Result := event_name ~ Message_reaction_remove_all
		end

	is_presence_update: BOOLEAN
			-- Whether or not `Current' is a `Presence_update' event
		do
			Result := event_name ~ Presence_update
		end

	is_typing_start: BOOLEAN
			-- Whether or not `Current' is a `Typing_start' event
		do
			Result := event_name ~ Typing_start
		end

	is_user_update: BOOLEAN
			-- Whether or not `Current' is a `User_update' event
		do
			Result := event_name ~ User_update
		end

	is_voice_state_update: BOOLEAN
			-- Whether or not `Current' is a `Voice_state_update' event
		do
			Result := event_name ~ Voice_state_update
		end

	is_voice_server_update: BOOLEAN
			-- Whether or not `Current' is a `Voice_server_update' event
		do
			Result := event_name ~ Voice_server_update
		end

	is_webhooks_update: BOOLEAN
			-- Whether or not `Current' is a `Webhooks_update' event
		do
			Result := event_name ~ Webhooks_update
		end

feature {NONE} -- Implementation

	event_name: READABLE_STRING_GENERAL

	data: detachable ANY

end
