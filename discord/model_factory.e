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
		end

	encoding_name: READABLE_STRING_GENERAL
			-- The name of `Current's encoding
		deferred
		end

feature -- REST Models

	create_server(a_data: ANY): detachable SERVER
			-- Creates a server using the information in `a_data'
			-- The result will be detached if the data does not correspond to a server
		require
			Client_Set: has_client
		deferred
		end

feature -- Gateway Models

	create_heartbeat_payload(a_sequence: NATURAL_64): GATEWAY_PAYLOAD
			-- Creates a heartbeat {GATEWAY_PAYLOAD} with sequence number `a_sequence'
		local
			l_sequence: detachable NATURAL_64
			l_name: detachable READABLE_STRING_GENERAL
		do
			create Result.make(Heartbeat, a_sequence, l_sequence, l_name)
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
