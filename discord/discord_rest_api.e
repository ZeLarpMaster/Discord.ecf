note
	description: "Interface to the Discord REST API"
	author: "ZeLarpMaster"
	date: "Sun, 29 Oct 2017 04:30:17 +0000"
	revision: "0.0.1"

class
	DISCORD_REST_API

create
	make,
	make_with_token

feature {NONE} -- Initialization

	make(a_config: CLIENT_CONFIGURATION)
			-- Initializes `Current' using `a_config' to fetch configuration constants
		do
			config := a_config
			create {NET_HTTP_CLIENT_SESSION} rest_session.make(config.api_url.as_string_8)
			rest_session.add_header("user-agent", "DiscordBot (" + config.library_url + ", v" + config.library_version + ")")
		ensure
			Config_Assigned: config ~ a_config
		end

	make_with_token(a_config: CLIENT_CONFIGURATION)
			-- Initializes `Current' using `a_config' and sets the `auth_token'
		do
			make(a_config)
			set_token(a_config.token)
		ensure
			Config_Assigned: config ~ a_config
			Authentified: is_authentified
		end

feature -- Basic Operations

	get_who_am_i
			-- TODO: https://discordapp.com/developers/docs/topics/oauth2#get-current-application-information
		do

		end

	get_gateway_information
			-- Fetches the gateway information for the current logged in account
			-- If found, the information will be in `last_gateway_url' and `last_suggested_shards'
			-- If not found, both of those fields will be Void
		require
			Authentified: is_authentified
		local
			l_response: HTTP_CLIENT_RESPONSE
			l_infos: TUPLE[url: STRING_8; shard_count: NATURAL_64]
		do
			l_response := rest_session.get("/gateway/bot", Void)
			if attached l_response.body as la_body then
				l_infos := config.factory.parse_gateway_info(la_body)
				last_gateway_url := l_infos.url
				create last_suggested_shards.put(l_infos.shard_count)
			else
				last_gateway_url := Void
				last_suggested_shards := Void
			end
		end

feature -- Access

	last_gateway_url: detachable READABLE_STRING_GENERAL
			-- The last gateway url acquired in `get_gateway_information'

	last_suggested_shards: detachable CELL[NATURAL_64]
			-- The last suggested number of shards acquired in `get_gateway_information'

	is_authentified: BOOLEAN
			-- Returns `True' when `Current' is authentified
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

	config: CLIENT_CONFIGURATION
			-- General configuration of the library

	rest_session: HTTP_CLIENT_SESSION
			-- HTTP Session used to send information to the Discord REST API

end
