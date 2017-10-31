note
	description: "Configurations of the currently running {CLIENT}"
	author: "ZeLarpMaster"
	date: "Tue, 31 Oct 2017 02:40:48 +0000"
	revision: "0.0.1"

class
	CLIENT_CONFIG

feature -- Access

	library_name: READABLE_STRING_GENERAL
			-- The name of this library
		once("PROCESS")
			Result := "Discord.ecf"
		end

	library_version: READABLE_STRING_GENERAL
			-- The version of this library
		once("PROCESS")
			Result := "0.1"
		end

	library_url: READABLE_STRING_GENERAL
			-- The url of the library
		once("PROCESS")
			Result := "https://github.com/ZeLarpMaster/Discord.ecf"
		end

	api_base_url: READABLE_STRING_GENERAL
			-- The base url of all Discord REST API endpoints
		once("PROCESS")
			Result := "https://discordapp.com/api"
		end

	api_protocol_version: READABLE_STRING_GENERAL
			-- The version of the Discord API used in this version of the library
		once("PROCESS")
			Result := "6"
		end

	api_url: READABLE_STRING_GENERAL
			-- The url of the Discord REST API for the current version
		once("PROCESS")
			Result := api_base_url + "/v" + api_protocol_version
		end

end
