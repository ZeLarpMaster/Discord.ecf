note
	description: "Configurations of the currently running {CLIENT}"
	author: "ZeLarpMaster"
	date: "Tue, 31 Oct 2017 02:40:48 +0000"
	revision: "0.0.1"

class
	CLIENT_CONFIGURATION

create
	make

feature {NONE} -- Initialization

	make(a_token: READABLE_STRING_GENERAL; a_factory: MODEL_FACTORY)
			-- Initializes `Current' with `a_token' as the authentification token and `a_factory' to deserialize
		require
			Token_Not_Empty: not a_token.is_empty
		do
			token := a_token
			factory := a_factory
			create default_presence.make(factory.serializer, create {PRESENCE_STATUS}.make_online, False, Void, Void) -- Will be received as an argument later?
		ensure
			Token_Set: token ~ a_token
			Factory_Set: factory ~ a_factory
		end

feature -- Access

	token: READABLE_STRING_GENERAL
			-- The authentification token

	factory: MODEL_FACTORY
			-- Factory used to deserialize

	handle_compression: BOOLEAN = False
			-- `True' when the gateway can handle compression

	large_threshold: NATURAL_8 = 250
			-- The number of {MEMBER}s in a {SERVER} before Discord stops sending us offline {MEMBER}s

	default_presence: PRESENCE
			-- The {PRESENCE} of the application on startup

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

	gateway_parameters: READABLE_STRING_GENERAL
			-- The gateway url's parameters
		once("PROCESS")
			Result := "/?v=" + api_protocol_version + "&encoding=" + factory.encoding_name
		end

	platform_name: READABLE_STRING_GENERAL
			-- The current platform's OS name
		local
			l_platform: PLATFORM
		once("PROCESS")
			create l_platform
			if l_platform.is_windows then
				Result := "Windows"
			elseif l_platform.is_mac then
				Result := "MacOSX"
			elseif l_platform.is_unix then
				Result := "Unix"
			elseif l_platform.is_vms then
				Result := "VMS"
			elseif l_platform.is_vxworks then
				Result := "VXWorks"
			else
				Result := "Unknown"
			end
		end

	gateway_connection_properties: GATEWAY_CONNECTION_PROPERTIES
			-- Creates the connection properties of the application for the gateway
		once("PROCESS")
			Result := factory.create_connection_properties(platform_name, library_name, library_name)
		end

	new_identify_payload(a_shard_id: NATURAL_64; a_shard_number: NATURAL_64): GATEWAY_PAYLOAD
			-- Creates the identify {GATEWAY_PAYLOAD} for the identification of the shard with id `a_shard_id'
		do
			Result := factory.create_identify_payload(token, gateway_connection_properties, handle_compression,
			                                          large_threshold, a_shard_number, default_presence, a_shard_id)
		end

end
