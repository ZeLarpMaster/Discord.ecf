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
			serialize_server
		end
	JSON_STRING_CONSTANTS

feature -- Basic Operations

	serialize_server(a_server: SERVER): JSON_OBJECT
			-- Serializes `a_server'
		do
			create Result.make_empty
			Result.put_string(a_server.id, json_string_id)
		end

end
