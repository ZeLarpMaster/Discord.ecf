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

	serialize_connection_properties(a_connection_properties: GATEWAY_CONNECTION_PROPERTIES): JSON_OBJECT
			-- <Precursor>
		do
			create Result.make_with_capacity(3)
			Result.put_string(a_connection_properties.os_name, json_string_dollar_os)
			Result.put_string(a_connection_properties.browser_name, json_string_dollar_browser)
			Result.put_string(a_connection_properties.device_name, json_string_dollar_device)
		end

	serialize_presence(a_presence: USER_PRESENCE): JSON_OBJECT
			-- <Precursor>
		do
			create Result.make_with_capacity(4)
			Result.put_string(a_presence.status.value, json_string_status)
			Result.put_boolean(a_presence.is_afk, json_string_afk)
			if attached a_presence.idle_since as la_since then
				Result.put_natural((la_since.duration.fine_seconds_count * 1000).truncated_to_integer_64.as_natural_64, json_string_since)
			else
				Result.put(create {JSON_NULL}, json_string_since)
			end
			if attached a_presence.game as la_game and then attached {JSON_OBJECT} la_game.serialize as la_game_object then
				Result.put(la_game_object, json_string_game)
			else
				Result.put(create {JSON_NULL}, json_string_game)
			end
		end

	serialize_identify_structure(a_identify: IDENTIFICATION_STRUCTURE; a_shard_id: NATURAL_64): STRING_8
			-- <Precursor>
		local
			l_json: JSON_OBJECT
			l_shard_array: JSON_ARRAY
		do
			create l_shard_array.make(2)
			l_shard_array.add(create {JSON_NUMBER}.make_natural(a_shard_id))
			l_shard_array.add(create {JSON_NUMBER}.make_natural(a_identify.shard_number))
			create l_json.make_with_capacity(6)
			l_json.put_boolean(a_identify.compress, json_string_compress)
			l_json.put_natural(a_identify.large_threshold, json_string_large_threshold)
			if attached {JSON_VALUE} a_identify.presence.serialize as la_presence then
				l_json.put(la_presence, json_string_presence)
			end
			if attached {JSON_VALUE} a_identify.properties.serialize as la_properties then
				l_json.put(la_properties, json_string_properties)
			end
			l_json.put(l_shard_array, json_string_shard)
			l_json.put_string(a_identify.token, json_string_token)
			Result := l_json.representation
		end

	serialize_game_status(a_game_status: GAME_STATUS; a_type: NATURAL_8): JSON_OBJECT
			-- <Precursor>
		do
			create Result.make_with_capacity(3)
			Result.put_string(a_game_status.name, json_string_name)
			Result.put_natural(a_type, json_string_type)
			if not a_game_status.url.is_empty then
				Result.put_string(a_game_status.url, json_string_url)
			else
				Result.put(create {JSON_NULL}, json_string_url)
			end
		end

end
