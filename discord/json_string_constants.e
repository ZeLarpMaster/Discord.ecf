note
	description: "{JSON_STRING} constants to prevent needless recreation of those string objects"
	author: "ZeLarpMaster"
	date: "Sat, 28 Oct 2017 03:18:24 +0000"
	revision: "0.0.1"

class
	JSON_STRING_CONSTANTS

feature -- Access

	json_string_id: JSON_STRING
			-- {JSON_STRING} of "id"
		once("PROCESS")
			create Result.make_from_string_general("id")
		end

	json_string_d: JSON_STRING
			-- {JSON_STRING} of "d"
		once("PROCESS")
			create Result.make_from_string_general("d")
		end

	json_string_op: JSON_STRING
			-- {JSON_STRING} of "op"
		once("PROCESS")
			create Result.make_from_string_general("op")
		end

	json_string_s: JSON_STRING
			-- {JSON_STRING} of "s"
		once("PROCESS")
			create Result.make_from_string_general("s")
		end

	json_string_t: JSON_STRING
			-- {JSON_STRING} of "t"
		once("PROCESS")
			create Result.make_from_string_general("t")
		end

	json_string_heartbeat_interval: JSON_STRING
			-- {JSON_STRING} of "heartbeat_interval"
		once("PROCESS")
			create Result.make_from_string_general("heartbeat_interval")
		end

	json_string_compress: JSON_STRING
			-- {JSON_STRING} of "compress"
		once("PROCESS")
			create Result.make_from_string_general("compress")
		end

	json_string_large_threshold: JSON_STRING
			-- {JSON_STRING} of "large_threshold"
		once("PROCESS")
			create Result.make_from_string_general("large_threshold")
		end

	json_string_presence: JSON_STRING
			-- {JSON_STRING} of "presence"
		once("PROCESS")
			create Result.make_from_string_general("presence")
		end

	json_string_properties: JSON_STRING
			-- {JSON_STRING} of "properties"
		once("PROCESS")
			create Result.make_from_string_general("properties")
		end

	json_string_shard: JSON_STRING
			-- {JSON_STRING} of "shard"
		once("PROCESS")
			create Result.make_from_string_general("shard")
		end

	json_string_token: JSON_STRING
			-- {JSON_STRING} of "token"
		once("PROCESS")
			create Result.make_from_string_general("token")
		end

	json_string_dollar_os: JSON_STRING
			-- {JSON_STRING} of "$os"
		once("PROCESS")
			create Result.make_from_string_general("$os")
		end

	json_string_dollar_browser: JSON_STRING
			-- {JSON_STRING} of "$browser"
		once("PROCESS")
			create Result.make_from_string_general("$browser")
		end

	json_string_dollar_device: JSON_STRING
			-- {JSON_STRING} of "$device"
		once("PROCESS")
			create Result.make_from_string_general("$device")
		end

	json_string_name: JSON_STRING
			-- {JSON_STRING} of "name"
		once("PROCESS")
			create Result.make_from_string_general("name")
		end

	json_string_type: JSON_STRING
			-- {JSON_STRING} of "type"
		once("PROCESS")
			create Result.make_from_string_general("type")
		end


	json_string_url: JSON_STRING
			-- {JSON_STRING} of "url"
		once("PROCESS")
			create Result.make_from_string_general("url")
		end

	json_string_status: JSON_STRING
			-- {JSON_STRING} of "status"
		once("PROCESS")
			create Result.make_from_string_general("status")
		end

	json_string_afk: JSON_STRING
			-- {JSON_STRING} of "afk"
		once("PROCESS")
			create Result.make_from_string_general("afk")
		end

	json_string_since: JSON_STRING
			-- {JSON_STRING} of "since"
		once("PROCESS")
			create Result.make_from_string_general("since")
		end

	json_string_game: JSON_STRING
			-- {JSON_STRING} of "game"
		once("PROCESS")
			create Result.make_from_string_general("game")
		end

	json_string_shards: JSON_STRING
			-- {JSON_STRING} of "shards"
		once("PROCESS")
			create Result.make_from_string_general("shards")
		end

end
