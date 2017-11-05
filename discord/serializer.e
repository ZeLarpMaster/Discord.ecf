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

end
