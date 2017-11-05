note
	description: "Serializes {SERIALIZABLE}s into JSON format"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 23:45:22 +0000"
	revision: "0.0.1"

class
	SERIALIZER_JSON

inherit
	SERIALIZER
		redefine
			serialize_server,
			serialize_payload
		end
	JSON_STRING_CONSTANTS

feature -- REST Models

	serialize_server(a_server: SERVER): JSON_OBJECT
			-- <Precursor>
		do
			create Result.make_with_capacity(1)
			Result.put_string(a_server.id, json_string_id)
		end

feature -- Gateway Models

	serialize_payload(a_payload: GATEWAY_PAYLOAD): STRING_8
			-- <Precursor>
		local
			l_json: JSON_OBJECT
		do
			create l_json.make_with_capacity(2)
			l_json.put_natural(a_payload.opcode, json_string_op)
			if attached {NATURAL_64} a_payload.data as la_data then
				l_json.put_natural(la_data, json_string_d)
			elseif attached {SERIALIZABLE} a_payload.data as la_data and then attached {JSON_OBJECT} la_data.serialize as la_object then
				l_json.put(la_object, json_string_d)
			else
				l_json.put(create {JSON_NULL}, json_string_d)
			end
			Result := l_json.representation
		end

end
