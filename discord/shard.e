note
	description: "Gateway manager for a single shard"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 03:58:36 +0000"
	revision: "0.0.1"

class
	SHARD

create
	make

feature {NONE} -- Initialization

	make(a_config: CLIENT_CONFIG; a_url: READABLE_STRING_GENERAL)
			-- Initializes `Current' to connect to `a_url' with `a_config'
		do
			create socket.make(a_url + a_config.gateway_parameters)
			last_ping := 0
			config := a_config
			socket.open_actions.extend(agent on_connect)
			socket.text_message_actions.extend(agent on_text_message)
			socket.close_actions.extend(agent on_close)
			socket.error_actions.extend(agent on_error)
			create socket_thread.make(agent do socket.execute end)
		ensure
			Config_Set: config ~ a_config
		end

feature -- Access

	launch
			-- Start a new thread which starts the socket
		do
			if attached socket_thread as la_thread then
				la_thread.launch
			end
		end

	last_ping: NATURAL_32
			-- Last round-trip delay time in milliseconds

feature {NONE} -- Implementation

	send_heartbeat
			-- Send a heartbeat in the gateway
		do

		end

	on_text_message(a_message: STRING)
			-- Called when `socket' receives a message
		do

		end

	on_connect(a_message: STRING)
			-- Called when `socket' successfully connects
		do
			print("Gateway connected%N")
		end

	on_error(a_error: STRING)
			-- Called when `socket' has an error
		do
			print("Error: " + a_error + "%N")
		end

	on_close(a_code: INTEGER; a_reason: STRING)
			-- Called when `socket' is closed
		do
			print("The gateway has closed with code " + a_code.out + ": " + a_reason + "%N")
		end

	heartbeat_thread: detachable PERIODIC_THREAD
			-- Thread sending the heartbeat at a constant frequency

	socket_thread: detachable WORKER_THREAD
			-- Thread where the socket listens to messages

	socket: GATEWAY_SOCKET
			-- Socket connection to the Discord gateway

	config: CLIENT_CONFIG
			-- General configurations of this application

end
