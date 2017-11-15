note
	description: "Interface to the Discord REST API"
	author: "ZeLarpMaster"
	date: "Sun, 29 Oct 2017 04:30:17 +0000"
	revision: "0.0.1"

class
	HTTP

create
	make

feature {NONE} -- Initialization

	make(a_config: CLIENT_CONFIG)
			-- Initializes `Current' using `a_config' to fetch configuration constants
		do
			config := a_config
			create {NET_HTTP_CLIENT_SESSION} rest_session.make(config.api_url.as_string_8)
			rest_session.add_header("user-agent", "DiscordBot (" + config.library_url + ", v" + config.library_version + ")")
		ensure
			Config_Assigned: config ~ a_config
		end

feature -- Basic Operations

	get_who_am_i
			-- TODO: https://discordapp.com/developers/docs/topics/oauth2#get-current-application-information
		do
			
		end

	get_gateway_information
			-- Fetches the gateway information for the current logged in account
		require
			Authentified: is_authentified
		local
			l_response: HTTP_CLIENT_RESPONSE
			l_json_parser: JSON_PARSER
		do
			l_response := rest_session.get("/gateway/bot", Void)
			if attached l_response.body as la_body then
				create l_json_parser.make_with_string(la_body)
				l_json_parser.parse_content
				if
					-- TODO: Move those things into the factory cause they don't belong here
					attached {JSON_OBJECT} l_json_parser.parsed_json_value as la_json and then
					attached {JSON_STRING} la_json.item("url") as la_url and then
					attached {JSON_NUMBER} la_json.item("shards") as la_shards
				then
					last_gateway_url := la_url.item
					last_suggested_shards := la_shards.natural_64_item
				end
			end
		end

feature -- Access

	last_gateway_url: detachable READABLE_STRING_GENERAL
			-- The last gateway url acquired in `get_gateway_information'

	last_suggested_shards: detachable NATURAL_64
			-- The last suggested number of shards acquired in `get_gateway_information'

	is_authentified: BOOLEAN
			-- Returns whether or not `Current' is authentified
		do
			Result := attached auth_token
		end

	set_token(a_token: READABLE_STRING_GENERAL)
			-- Sets the authorization token of all requests sent by this interface
		require
			Token_Not_Empty: not a_token.is_empty
		do
			rest_session.add_header("authorization", "Bot " + a_token)
			auth_token := a_token
		ensure
			Token_Set: auth_token ~ a_token
			Is_Authentified: is_authentified
		end

feature {NONE} -- Implementation

	auth_token: detachable READABLE_STRING_GENERAL
			-- Authorization token of all requests sent

	config: CLIENT_CONFIG
			-- General configuration of the library

	rest_session: HTTP_CLIENT_SESSION
			-- HTTP Session used to send information to the Discord REST API

end
