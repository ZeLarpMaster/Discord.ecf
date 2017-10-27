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

	make
		do
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

end
