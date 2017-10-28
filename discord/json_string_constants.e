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

end
