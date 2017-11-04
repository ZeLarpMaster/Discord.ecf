note
	description: "Model containing the information in a gateway payload"
	url: "https://discordapp.com/developers/docs/topics/gateway#gateway-opcodespayloads-gateway-payload-structure"
	author: "ZeLarpMaster"
	date: "Fri, 3 Nov 2017 21:03:24 +0000"
	revision: "0.0.1"

class
	GATEWAY_PAYLOAD

inherit
	GATEWAY_OPCODES

create
	make

feature {NONE} -- Initialization

	make(a_opcode: like Dispatch; a_data: detachable ANY; a_sequence: detachable NATURAL_64; a_name: detachable READABLE_STRING_GENERAL)
			-- Initializes `Current' with variable data contents as a payload with opcode `a_opcode'
		require
			Valid_Opcode: is_valid_opcode(a_opcode)
			Dispatch_is_sequenced: a_opcode ~ Dispatch = attached a_sequence
			Dispatch_is_named: a_opcode ~ Dispatch = attached a_name
		do
			opcode := a_opcode
			data := a_data
			sequence_number := a_sequence
			event_name := a_name
		ensure
			Opcode_Set: opcode ~ a_opcode
			Data_Set: data ~ a_data
			Dispatch_is_sequenced: is_dispatch = attached sequence_number
			Dispatch_is_named: is_dispatch = attached event_name
		end

feature -- Access

	data: detachable ANY
			-- The data contained in `Current' ("d" field in gateway payloads)

	sequence_number: detachable NATURAL_64
			-- The sequence number of the payload

	event_name: detachable READABLE_STRING_GENERAL
			-- The name of the payload's event

feature -- Type Checks

	is_dispatch: BOOLEAN
			-- Whether or not `Current' is a`Dispatch' payload
		do
			Result := opcode ~ Dispatch
		end

	is_heartbeat: BOOLEAN
			-- Whether or not `Current' is a `Heartbeat' payload
		do
			Result := opcode ~ Heartbeat
		end

	is_identify: BOOLEAN
			-- Whether or not `Current' is a `Identify' payload
		do
			Result := opcode ~ Identify
		end

	is_status_update: BOOLEAN
			-- Whether or not `Current' is a `Status_update' payload
		do
			Result := opcode ~ Status_update
		end

	is_voice_state_update: BOOLEAN
			-- Whether or not `Current' is a `Voice_state_update' payload
		do
			Result := opcode ~ Voice_state_update
		end

	is_voice_server_ping: BOOLEAN
			-- Whether or not `Current' is a `Voice_server_ping' payload
		do
			Result := opcode ~ Voice_server_ping
		end

	is_resume: BOOLEAN
			-- Whether or not `Current' is a `Resume' payload
		do
			Result := opcode ~ Resume
		end

	is_reconnect: BOOLEAN
			-- Whether or not `Current' is a `Reconnect' payload
		do
			Result := opcode ~ Reconnect
		end

	is_request_guild_members: BOOLEAN
			-- Whether or not `Current' is a `Request_guild_members' payload
		do
			Result := opcode ~ Request_guild_members
		end

	is_invalid_session: BOOLEAN
			-- Whether or not `Current' is a `Invalid_session' payload
		do
			Result := opcode ~ Invalid_session
		end

	is_hello: BOOLEAN
			-- Whether or not `Current' is a `Hello' payload
		do
			Result := opcode ~ Hello
		end

	is_heartbeat_ack: BOOLEAN
			-- Whether or not `Current' is a `Heartbeat_ack' payload
		do
			Result := opcode ~ Heartbeat_ack
		end

feature {NONE} -- Implementation

	opcode: like Dispatch
			-- The opcode representing which type of payload `Current' is
			-- For a list of opcode, see https://discordapp.com/developers/docs/topics/gateway#gateway-opcodespayloads-gateway-opcodes

end