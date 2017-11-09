note
	description: "Abstract class which can serialize {SERIALIZABLE}s"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 22:55:22 +0000"
	revision: "0.0.1"

deferred class
	SERIALIZER

feature -- REST Models

	serialize_server(a_server: SERVER): ANY
			-- Serializes `a_server'
		deferred
		end

feature -- Gateway Models

	serialize_payload(a_payload: GATEWAY_PAYLOAD): STRING_8
			-- Serializes `a_payload' into a string sent by the socket
		require
			Cant_Serialize_Receive_Payloads: not a_payload.can_be_sent
		deferred
		end

	serialize_connection_properties(a_connection_properties: GATEWAY_CONNECTION_PROPERTIES): ANY
			-- Serializes `a_connection_properties'
		deferred
		end

	serialize_presence(a_presence: PRESENCE): ANY
			-- Serializes `a_presence'
		deferred
		end

	serialize_identify_structure(a_identify: IDENTIFICATION_STRUCTURE; a_shard_id: NATURAL_64): STRING_8
			-- Serializes `a_identify' with `a_shard_id' as it's shard_id
		deferred
		end

	serialize_game_status(a_game_status: GAME_STATUS; a_type: NATURAL_8): ANY
			-- Serializes `a_game_status' with `a_type' as it's type
		deferred
		end

end
