note
	description: "Socket connected to the Discord gateway"
	author: "ZeLarpMaster"
	date: "Sun, 29 Oct 2017 04:19:05 +0000"
	revision: "0.0.1"

class
	GATEWAY_SOCKET

inherit
	WEB_SOCKET_CLIENT
		redefine
			receive_handshake,
			analyze_request_message
		end

create
	make

feature {NONE} -- Initialization

	make(a_url: READABLE_STRING_GENERAL)
			-- Initializes `Current' to connect to `a_url'
		do
			create open_actions
			create text_message_actions
			create binary_message_actions
			create close_actions
			create error_actions
			initialize(a_url, Void)
			create implementation.make(create {WEB_SOCKET_NULL_CLIENT}, a_url)
		end

feature -- Events API

	open_actions: ACTION_SEQUENCE[TUPLE[message: STRING]]
			-- Launched when `Current' has been opened. `message' have been received at opening

	text_message_actions: ACTION_SEQUENCE[TUPLE[message: STRING]]
			-- Launched when `Current' have receive a text message `message'

	binary_message_actions: ACTION_SEQUENCE[TUPLE[message: STRING]]
			-- Launched when `Current' have receive a binary message `message'

	close_actions: ACTION_SEQUENCE[TUPLE[code: INTEGER; reason: STRING]]
			-- Launched when the connection has been closed.
			-- The reason can be checked with `code' or with a human readable `reason'.

	error_actions: ACTION_SEQUENCE[TUPLE[error: STRING]]
			-- Launched when there has been an error with the connection.
			-- `error' is a human readable reason for the error to occured.

feature {NONE} -- Implementation

	analyze_request_message
			-- Analyze messages extracted from `socket' as a HTTP request
			-- See https://github.com/tioui/Eiffel_Discord_POC/blob/master/discord_web_socket.e for more information
		local
			end_of_stream: BOOLEAN
			pos, n: INTEGER
			line: detachable STRING
			k, val: STRING
			txt: STRING
		do
			create txt.make (64)
			server_handshake.set_request_header (txt)
			if attached next_line as l_request_line and then not l_request_line.is_empty then
				txt.append (l_request_line)
				txt.append_character ('%N')
			else
				server_handshake.mark_error
			end
				--			l_is_verbose := is_verbose
			if not server_handshake.has_error then -- or l_is_verbose then
					-- if `is_verbose' we can try to print the request, even if it is a bad HTTP request
				from
					line := next_line
				until
					line = Void or end_of_stream
				loop
					n := line.count
						--					if l_is_verbose then
						--						log (line)
						--					end
					pos := line.index_of (':', 1)
					if pos > 0 then
						k := line.substring (1, pos - 1)
						if line [pos + 1].is_space then
							pos := pos + 1
						end
						if line [n] = '%R' then
							n := n - 1
						end
						val := line.substring (pos + 1, n)
						server_handshake.put_header (k.as_lower, val)
					end
					txt.append (line)
					txt.append_character ('%N')
					if line.is_empty or else line [1] = '%R' then
						end_of_stream := True
					else
						line := next_line
					end
				end
			end
		end

	receive_handshake
			-- Receive the websocket handsake from the server
			-- See https://github.com/tioui/Eiffel_Discord_POC/blob/master/discord_web_socket.e for more information
		local
			line: detachable STRING_8
		do
			analyze_request_message
			if server_handshake.request_header.as_upper.has_substring ("HTTP/1.1 101") and then attached server_handshake.request_header_map.item ("upgrade") as l_upgrade_key and then -- Upgrade header must be present with value websocket
				l_upgrade_key.is_case_insensitive_equal ("websocket") and then attached server_handshake.request_header_map.item ("connection") as l_connection_key and then -- Connection header must be present with value Upgrade
				l_connection_key.as_lower.has_substring ("upgrade")
			then
				is_server_hanshake_accepted := True
				if attached server_handshake.request_header_map.item ("Sec-WebSocet-Protocol") as l_protocol then
					set_protocol (l_protocol)
				end
			end
		end

	connection: HTTP_STREAM_SOCKET
			-- The connection stream
		do
			Result := socket
		end

	on_open(a_message: STRING)
			-- `Current' has been opened. `a_message' have been received at opening
		do
			open_actions.call(a_message)
		end

	on_text_message(a_message: STRING)
			-- `Current' have receive a text message `a_message'
		do
			text_message_actions.call(a_message)
		end

	on_binary_message(a_message: STRING)
			-- `Current' have receive a binary message `a_message'
		do
			binary_message_actions.call(a_message)
		end

	on_close(a_code: INTEGER; a_reason: STRING)
			-- The connection has been closed. The reason
			-- can be checked with `a_code' or with a human readable `a_reason'.
		do
			close_actions.call(a_code, a_reason)
		end

	on_error(a_error: STRING)
			-- There has been an error with the connection.
			-- `a_error' is a human readable reason for the error to occured.
		do
			error_actions.call(a_error)
		end

end
