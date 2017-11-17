note
	description: "Abstract factory for model deserialization"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 22:08:55 +0000"
	revision: "0.0.1"

class
	MODEL_FACTORY_JSON

inherit
	MODEL_FACTORY
	JSON_STRING_CONSTANTS

create
	make

feature -- REST Models

	create_server(a_data: JSON_OBJECT): detachable SERVER
			-- <Precursor>
		do
			if
				attached {JSON_STRING} a_data.item(json_string_id) as la_string and
				attached client as la_client
			then
				create Result.make(serializer, la_client, la_string.item)
			end
		end

	create_user(a_data: JSON_OBJECT): detachable USER
			-- <Precursor>
		do
			if
				attached {JSON_STRING} a_data.item(json_string_id) as la_id and
				attached {JSON_STRING} a_data.item(json_string_username) as la_username and
				attached {JSON_STRING} a_data.item(json_string_discriminator) as la_discriminator and
				attached {JSON_STRING} a_data.item(json_string_avatar) as la_avatar and
				attached client as la_client
			then
				create Result.make(serializer, la_client, la_id.item, la_username.item, la_discriminator.item, la_avatar.item)

				if attached {JSON_BOOLEAN} a_data.item(json_string_bot) as la_bot then
					Result.is_bot := la_bot.item
				end
				if attached {JSON_BOOLEAN} a_data.item(json_string_mfa_enabled) as la_mfa_enabled then
					Result.is_mfa_enabled := la_mfa_enabled.item
				end
				if attached {JSON_BOOLEAN} a_data.item(json_string_verified) as la_verified then
					Result.is_verified := la_verified.item
				end
				if attached {JSON_STRING} a_data.item(json_string_email) as la_email then
					Result.email := la_email.item
				end

			end
		end

		create_channel(a_data: JSON_OBJECT): detachable CHANNEL
			-- <Precursor>
		do
			if
				attached {JSON_STRING} a_data.item(json_string_id) as la_id and
				attached {JSON_NUMBER} a_data.item(json_string_type) as la_type and
				attached client as la_client
			then
				create Result.make(serializer, la_client, la_id.item, la_type.integer_64_item)

				-- STILL NEED TO CHECK FOR RECIPIENTS AND PERMISSION_OVERWRITES (LIST)

				if attached {JSON_NUMBER} a_data.item(json_string_position) as la_position then
					Result.position := la_position.integer_64_item
				end
				if attached {JSON_STRING} a_data.item(json_string_name) as la_name then
					Result.name := la_name.item
				end
				if attached {JSON_STRING} a_data.item(json_string_topic) as la_topic then
					Result.topic := la_topic.item
				end
				if attached {JSON_BOOLEAN} a_data.item(json_string_nsfw) as la_nsfw then
					Result.nsfw := la_nsfw.item
				end
				if attached {JSON_STRING} a_data.item(json_string_last_message_id) as la_last_message_id then
					Result.last_message_id := la_last_message_id.item
				end
				if attached {JSON_NUMBER} a_data.item(json_string_bitrate) as la_bitrate then
					Result.bitrate := la_bitrate.integer_64_item
				end
				if attached {JSON_NUMBER} a_data.item(json_string_user_limit) as la_user_limit then
					Result.user_limit := la_user_limit.integer_64_item
				end
				if attached {JSON_STRING} a_data.item(json_string_icon) as la_icon then
					Result.icon := la_icon.item
				end
				if attached {JSON_STRING} a_data.item(json_string_owner_id) as la_owner_id then
					Result.owner_id := la_owner_id.item
				end
				if attached {JSON_STRING} a_data.item(json_string_application_id) as la_application_id then
					Result.application_id := la_application_id.item
				end
				if attached {JSON_STRING} a_data.item(json_string_parent_id) as la_parent_id then
					Result.parent_id := la_parent_id.item
				end
			end
		end

		create_channel_list(a_data: JSON_OBJECT): LIST[CHANNEL]
			-- <Precursor>
		do
			Result := create {LINKED_LIST[CHANNEL]}.make
			if attached {JSON_ARRAY} a_data.item(json_string_private_channels) as la_data then
				across
					la_data.array_representation as item
				loop
					if attached {JSON_OBJECT} item as la_item then
						if attached {CHANNEL} create_channel(la_item) as la_channel then
							Result.put(la_channel)
						end
					end
				end
			end
		end


feature -- Other REST Responses

	parse_gateway_info(a_response: STRING): TUPLE[url: STRING_8; shard_count: NATURAL_64]
			-- <Precursor>
		local
			l_parser: JSON_PARSER
		do
			create Result
			create l_parser.make_with_string(a_response)
			l_parser.parse_content
			if attached {JSON_OBJECT} l_parser.parsed_json_value as la_json then
				if attached {JSON_STRING} la_json.item(json_string_url) as la_url then
					Result.url := la_url.item
				end
				if attached {JSON_NUMBER} la_json.item(json_string_shards) as la_shards then
					Result.shard_count := la_shards.natural_64_item
				end
			end
		end

feature -- Gateway Models

	parse_gateway_message(a_message: STRING): detachable GATEWAY_PAYLOAD
			-- <Precursor>
		local
			l_parser: JSON_PARSER
			l_opcode: NATURAL_8
			l_data: detachable ANY
			l_sequence: detachable CELL[NATURAL_64]
			l_event: detachable READABLE_STRING_GENERAL
		do
			create l_parser.make_with_string(a_message)
			l_parser.parse_content
			if
				attached {JSON_OBJECT} l_parser.parsed_json_object as la_object and then
				attached {JSON_NUMBER} la_object.item(json_string_op) as la_opcode and then la_opcode.is_natural
			then
				if attached {JSON_VALUE} la_object.item(json_string_d) as la_data then
					l_data := la_data
				end
				if attached {JSON_NUMBER} la_object.item(json_string_s) as la_sequence then
					create l_sequence.put(la_sequence.natural_64_item)
				end
				if attached {JSON_STRING} la_object.item(json_string_t) as la_event then
					l_event := la_event.item
				end
				create Result.make_full(l_opcode, l_data, l_sequence, l_event)
			end
		end

	parse_hello_interval(a_payload: GATEWAY_PAYLOAD): detachable NATURAL_64
			-- <Precursor>
		do
			if attached {JSON_OBJECT} a_payload.data as la_data then
				if attached {JSON_NUMBER} la_data.item(json_string_heartbeat_interval) as la_interval then
					Result := la_interval.natural_64_item
				end
			end
		end

	parse_invalid_session_data(a_payload: GATEWAY_PAYLOAD): BOOLEAN
			-- <Precursor>
		do
			if attached {JSON_BOOLEAN} a_payload.data as la_data then
				Result := la_data.item
			end
		end

feature -- Access

	encoding_name: READABLE_STRING_GENERAL
			-- <Precursor>
		once("PROCESS")
			Result := "json"
		end

feature {NONE} -- Implementation

	initialize_serializer
			-- Initializes `serializer' with a concrete instance of {SERIALIZER_JSON}
		do
			create {SERIALIZER_JSON} serializer
		end

invariant
	Serializer_is_JSON: attached {SERIALIZER_JSON} serializer
end
