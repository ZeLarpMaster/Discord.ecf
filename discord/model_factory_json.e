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

feature -- Gateway Models

	parse_gateway_message(a_message: STRING): detachable GATEWAY_PAYLOAD
			-- <Precursor>
		local
			l_parser: JSON_PARSER
			l_opcode: NATURAL_8
			l_data: detachable ANY
			l_sequence: detachable NATURAL_64
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
					l_sequence := la_sequence.natural_64_item
				end
				if attached {JSON_STRING} la_object.item(json_string_t) as la_event then
					l_event := la_event.item
				end
				create Result.make(l_opcode, l_data, l_sequence, l_event)
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

end
