note
	description: "Represents a guild or DM channel within Discord"
	author: "Alexandre Caron"
	date: "Mon, 13 Nov 2017 22:00:00 +0000"
	revision: "0.0.1"
	ref: "https://discordapp.com/developers/docs/resources/channel#channel-object"

class
	CHANNEL

inherit
	OBJECT

create {MODEL_FACTORY}
	make

feature {NONE} -- Initialization

	make(a_serializer: SERIALIZER; a_client: CLIENT; a_id: READABLE_STRING_GENERAL; a_type: NUMERIC)
			-- Initializes the `Current'.
		do
			make_object(a_serializer, a_client, a_id)
			type := a_type

			guild_id := create {STRING}.make_empty
			position := 0
			permission_overwrites := create {ARRAYED_LIST[ANY]}.make(0)
			name := create {STRING}.make_empty
			topic := create {STRING}.make_empty
			nsfw := False
			last_message_id := create {STRING}.make_empty
			bitrate := 0
			user_limit := 0
			recipents := create {ARRAYED_LIST[USER]}.make(0)
			icon := create {STRING}.make_empty
			owner_id := create {STRING}.make_empty
			application_id := create {STRING}.make_empty
			parent_id := create {STRING}.make_empty
		end

feature -- Basic Operations

	serialize: ANY
			-- <Precursor>
		do
			Result := serializer.serialize_channel(Current)
		end

feature -- Access

	type: NUMERIC
			-- The type of the `Current'

	guild_id: READABLE_STRING_GENERAL assign set_guild_id
			-- The id of the {SERVER}

	position: NUMERIC assign set_position
			-- Sorting position of the `Current'

	permission_overwrites: LIST[ANY] assign set_permission_overwrites
			-- Explicit permission overwrites for {MEMBER} and {ROLE}

	name: READABLE_STRING_GENERAL assign set_name
			-- The name of the `Current' (2-100 characters)

	topic: READABLE_STRING_GENERAL assign set_topic
			-- The `Current's topic (0-1024 characters)

	nsfw: BOOLEAN assign set_nsfw
			-- If the `Current' is nsfw

	last_message_id: READABLE_STRING_GENERAL assign set_last_message_id
			-- The id of the last message sent in this `Current' (may not point to an existing or valid message)

	bitrate: NUMERIC assign set_bitrate
			-- The bitrate (in bits) of the voice `Current'

	user_limit: NUMERIC assign set_user_limit
			-- The user limit of the voice `Current'

	recipents: LIST[USER] assign set_recipents
			-- The recipients of the DM

	icon: READABLE_STRING_GENERAL assign set_icon
			-- Icon hash

	owner_id: READABLE_STRING_GENERAL assign set_owner_id
			-- Id of the DM creator

	application_id: READABLE_STRING_GENERAL assign set_application_id
			-- Application id of the group DM creator if it is bot-created

	parent_id: READABLE_STRING_GENERAL assign set_parent_id
			-- Id of the parent category for a `Current'

	set_guild_id(a_guild_id: READABLE_STRING_GENERAL)
			-- Sets the `Current's guild_id to `a_guild_id'
		do
			guild_id := a_guild_id
		ensure
			Guild_id_Set: guild_id ~ a_guild_id
		end

	set_position(a_position: NUMERIC)
			-- Sets the `Current's position to `a_position'
		do
			position := a_position
		ensure
			Position_Set: position ~ a_position
		end

	set_permission_overwrites(a_permission_overwrites: LIST[ANY])
			-- Sets the `Current's permission_overwrites to `a_permission_overwrites'
		do
			permission_overwrites := a_permission_overwrites
		ensure
			Permission_overwrites_Set: permission_overwrites ~ a_permission_overwrites
		end

	set_name(a_name: READABLE_STRING_GENERAL)
			-- Sets the `Current's name to `a_name'
		do
			name := a_name
		ensure
			Name_Set: name ~ a_name
		end

	set_topic(a_topic: READABLE_STRING_GENERAL)
			-- Sets the `Current's topic to `a_topic'
		do
			topic := a_topic
		ensure
			Topic_Set: topic ~ a_topic
		end

	set_nsfw(a_nsfw: BOOLEAN)
			-- Sets the `Current's nsfw to `a_nsfw'
		do
			nsfw := a_nsfw
		ensure
			Nsfw_Set: nsfw ~ a_nsfw
		end

	set_last_message_id(a_last_message_id: READABLE_STRING_GENERAL)
			-- Sets the `Current's last_message_id to `a_last_message_id'
		do
			last_message_id := a_last_message_id
		ensure
			Last_message_id_Set: last_message_id ~ a_last_message_id
		end

	set_bitrate(a_bitrate: NUMERIC)
			-- Sets the `Current's bitrate to `a_bitrate'
		do
			bitrate := a_bitrate
		ensure
			Bitrate_Set: bitrate ~ a_bitrate
		end

	set_user_limit(a_user_limit: NUMERIC)
			-- Sets the `Current's user_limit to `a_user_limit'
		do
			user_limit := a_user_limit
		ensure
			User_limit_Set: user_limit ~ a_user_limit
		end

	set_recipents(a_recipents: LIST[USER])
			-- Sets the `Current's recipents to `a_recipents'
		do
			recipents := a_recipents
		ensure
			Recipents_Set: recipents ~ a_recipents
		end

	set_icon(a_icon: READABLE_STRING_GENERAL)
			-- Sets the `Current's icon to `a_icon'
		do
			icon := a_icon
		ensure
			Icon_Set: icon ~ a_icon
		end

	set_owner_id(a_owner_id: READABLE_STRING_GENERAL)
			-- Sets the `Current's owner_id to `a_owner_id'
		do
			owner_id := a_owner_id
		ensure
			Owner_id_Set: owner_id ~ a_owner_id
		end

	set_application_id(a_application_id: READABLE_STRING_GENERAL)
			-- Sets the `Current's application_id to `a_application_id'
		do
			application_id := a_application_id
		ensure
			Application_id_Set: application_id ~ a_application_id
		end

	set_parent_id(a_parent_id: READABLE_STRING_GENERAL)
			-- Sets the `Current's parent_id to `a_parent_id'
		do
			parent_id := a_parent_id
		ensure
			Parent_id_Set: parent_id ~ a_parent_id
		end

end
