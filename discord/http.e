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
		end

feature -- Access

	set_token(a_token: READABLE_STRING_GENERAL)
			-- Sets the authorization token of all requests sent by this interface
		require
			Token_Not_Empty: not a_token.is_empty
		do
			rest_session.add_header("authorization", "Bot " + a_token)
			auth_token := a_token
		ensure
			Token_Set: auth_token ~ a_token
		end

feature {NONE} -- Implementation

	auth_token: detachable READABLE_STRING_GENERAL
			-- Authorization token of all requests sent

	config: CLIENT_CONFIG
			-- General configuration of the library

	rest_session: HTTP_CLIENT_SESSION
			-- HTTP Session used to send information to the Discord REST API

end
