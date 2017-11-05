note
	description: "{JSON_STRING} constants to prevent needless recreation of those strings"
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

end
