note
	description: "Abstract factory for model deserialization"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 07:59:50 +0000"
	revision: "0.0.1"

deferred class
	MODEL_FACTORY

inherit
	GATEWAY_OPCODES

feature {NONE} -- Initialization

	make
			-- Initializes `Current'
		do
			initialize_serializer
		end

feature -- Access

	serializer: SERIALIZER
			-- The {SERIALIZER} passed down to created models

	has_client: BOOLEAN
			-- Whether or not `Current's client has been set
		do
			Result := attached client
		end

	set_client(a_client: CLIENT)
			-- Sets the client transfered to models
		do
			client := a_client
		ensure
			Client_Set: client ~ a_client
		end

	encoding_name: READABLE_STRING_GENERAL
			-- The name of `Current's encoding
		deferred
		end

feature -- REST Models

	create_server(a_data: ANY): detachable SERVER
			-- Creates a {SERVER} using the information in `a_data'
			-- The result will be detached if the data does not correspond to a {SERVER}
		require
			Client_Set: has_client
		deferred
		end

	create_user(a_data: ANY): detachable USER
			-- Creates a {USER} using the information in `a_data'
			-- The result will be detached if the data does not correspond to a {USER}
		require
			Client_Set: has_client
		deferred
		end

	create_channel(a_data: ANY): detachable CHANNEL
			-- Creates a {CHANNEL} using the information in `a_data'
			-- The result will be detached if the data does not correspond to a {CHANNEL}
		require
			Client_Set: has_client
		deferred
		end

	create_channel_list(a_data: ANY): LIST[CHANNEL]
			-- Creates a list of {CHANNEL} using the information in `a_data'
		deferred
		end

feature -- Miscellaneous REST Responses

	parse_gateway_info(a_response: STRING): TUPLE[a_url: STRING_8; a_shard_count: NATURAL_64]
			-- Parses the answer from a /gateway/bot request
		deferred
		end

feature -- Gateway Models

	create_presence(a_status: PRESENCE_STATUS; a_is_afk: BOOLEAN; a_game: detachable GAME_STATUS; a_idle_since: detachable DATE_TIME): PRESENCE
			-- Creates a {PRESENCE}
		do
			create Result.make(serializer, a_status, a_is_afk, a_game, a_idle_since)
		ensure
			Result_uses_Status: Result.status ~ a_status
			Result_uses_Is_Afk: Result.is_afk ~ a_is_afk
			Result_uses_Game: Result.game ~ a_game
			Result_uses_Idle: Result.idle_since ~ a_idle_since
		end

	create_connection_properties(a_os, a_browser, a_device: READABLE_STRING_GENERAL): GATEWAY_CONNECTION_PROPERTIES
			-- Creates a {GATEWAY_CONNECTION_PROPERTIES}
		do
			create Result.make(serializer, a_os, a_browser, a_device)
		ensure
			Result_uses_OS: Result.os_name ~ a_os
			Result_uses_Browser: Result.browser_name ~ a_browser
			Result_uses_Device: Result.device_name ~ a_device
		end

	create_identify_payload(a_token: READABLE_STRING_GENERAL; a_properties: GATEWAY_CONNECTION_PROPERTIES; a_compress: BOOLEAN;
							a_large_threshold: NATURAL_8; a_shard_number: NATURAL_64; a_presence: PRESENCE; a_shard_id: NATURAL_64): GATEWAY_PAYLOAD
			-- Creates an identify {GATEWAY_PAYLOAD}
		local
			l_identify: IDENTIFICATION_STRUCTURE
		do
			create l_identify.make(serializer, a_token, a_properties, a_compress, a_large_threshold, a_shard_number, a_presence)
			l_identify.set_shard_id(a_shard_id)
			create Result.make(Identify, l_identify)
		ensure
			Result_is_Identify: Result.is_identify
			Result_data_is_Identification_Structure: attached {IDENTIFICATION_STRUCTURE} Result.data
		end

	create_heartbeat_payload(a_sequence: NATURAL_64): GATEWAY_PAYLOAD
			-- Creates a heartbeat {GATEWAY_PAYLOAD} with sequence number `a_sequence'
		do
			create Result.make(Heartbeat, a_sequence)
		ensure
			Result_is_Heartbeat: Result.is_heartbeat
			Result_data_is_Sequence: Result.data ~ a_sequence
		end

	parse_gateway_message(a_message: STRING): detachable GATEWAY_PAYLOAD
			-- Creates a {GATEWAY_PAYLOAD} object from the contents of `a_message'
			-- The result will be detached if the data does not correspond to a gateway payload
		deferred
		end

	parse_hello_interval(a_payload: GATEWAY_PAYLOAD): detachable NATURAL_64
			-- Parses the heartbeat interval from a hello {GATEWAY_PAYLOAD}
			-- The result will be detached if the data does not correspond to a gateway payload
		require
			Payload_Is_Hello: a_payload.is_hello
		deferred
		end

	parse_invalid_session_data(a_payload: GATEWAY_PAYLOAD): BOOLEAN
			-- Parses the resuming boolean from an invalid_session {GATEWAY_PAYLOAD}
			-- The result will be detached if the data does not correspond to a gateway payload
		require
			Payload_Is_Invalid_Session: a_payload.is_invalid_session
		deferred
		end

feature {NONE} -- Implementation

	initialize_serializer
			-- Initializes `serializer' with a concrete instance
		deferred
		end

	client: detachable CLIENT
			-- The {CLIENT} passed down to created models

end
