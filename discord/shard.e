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

	make(a_config: CLIENT_CONFIG; a_url: READABLE_STRING_GENERAL; a_shard_id: NATURAL_64)
			-- Initializes `Current' to connect to `a_url' with `a_config' as the shard # `a_shard_id'
		do
			create socket.make(a_url + a_config.gateway_parameters)
			last_ping := 0
			config := a_config
			shard_id := a_shard_id
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

	last_ping: NATURAL_64
			-- Last round-trip delay time in milliseconds

	shard_id: NATURAL_64
			-- The id of `Current'

feature {NONE} -- Gateway Actions

	send_identify
			-- Identifies `Current' on the gateway
		do
			socket.send(config.factory.serializer.serialize_payload(config.create_identify_payload(shard_id)))
		end

	send_heartbeat
			-- Send a heartbeat in the gateway
		do
			if attached last_heartbeat_time then
				-- If a client does not receive a heartbeat ack between its attempts at sending heartbeats,
				-- it should immediately terminate the connection with a non 1000 close code, reconnect, and attempt to resume

			else
				create last_heartbeat_time.make_now
				socket.send(config.factory.serializer.serialize_payload(config.factory.create_heartbeat_payload(last_sequence_number)))
			end
		end

feature {NONE} -- Socket Events

	on_text_message(a_message: STRING)
			-- Called when `socket' receives a message
		local
			l_payload: GATEWAY_PAYLOAD
			l_time_now: DATE_TIME
		do
			l_payload := config.factory.parse_gateway_message(a_message)
			if attached l_payload as la_payload then
				if la_payload.is_dispatch then
					-- Parse event type and underlying models
				elseif la_payload.is_heartbeat then
					send_heartbeat
				elseif la_payload.is_heartbeat_ack and attached last_heartbeat_time as la_last_time then
					create l_time_now.make_now
					last_ping := l_time_now.duration.minus(la_last_time.duration).fine_second.product(1000).rounded.to_natural_64
					last_heartbeat_time := Void
				elseif la_payload.is_reconnect then
					-- reconnect and resume instantly
				elseif la_payload.is_invalid_session then
					if config.factory.parse_invalid_session_data(la_payload) then
						-- Attempt resuming
					else
						-- Terminate connection and try reconnecting
					end
				elseif la_payload.is_hello and attached {NATURAL_64} config.factory.parse_hello_interval(la_payload) as la_interval then
					create heartbeat_thread.make_with_interval(la_interval, agent send_heartbeat)
				end
			else
				print("Received invalid payload: " + a_message + "%N")
			end
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

feature {NONE} -- Implementation

	heartbeat_thread: detachable PERIODIC_THREAD
			-- Thread sending the heartbeat at a constant frequency

	socket_thread: detachable WORKER_THREAD
			-- Thread where the socket listens to messages

	socket: GATEWAY_SOCKET
			-- Socket connection to the Discord gateway

	config: CLIENT_CONFIG
			-- General configurations of this application

	last_heartbeat_time: detachable DATE_TIME
			-- {DATE_TIME} of the last heartbeat sent

	last_sequence_number: NATURAL_64
			-- The last event sequence number received

end
