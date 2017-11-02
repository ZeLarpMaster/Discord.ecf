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
			create socket.make("")
			create heartbeat_thread.make_with_interval(45, agent send_heartbeat)
			last_ping := 0
		end

feature -- Access

	last_ping: NATURAL_32
			-- Last round-trip delay time in milliseconds

feature {NONE} -- Implementation

	send_heartbeat
			-- Send a heartbeat in the gateway
		do

		end

	heartbeat_thread: PERIODIC_THREAD
			-- Thread sending the heartbeat at a constant frequency

	socket: WEB_SOCKET
			-- Socket connection to the Discord gateway

end
