note
	description: "High level interface with the Discord API"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 03:08:30 +0000"
	revision: "0.0.1"

class
	CLIENT

create
	make

feature {NONE} -- Initialization

	make
		do
			create config
			create http.make(config)
			create {ARRAYED_LIST[SHARD]} shards.make(1)
		end

feature {NONE} -- Implementation

	config: CLIENT_CONFIG
			-- General configuration of `Current'

	shards: LIST[SHARD]
			-- List of shards ordered by id

	http: HTTP
			-- Interface to the Discord REST API

end
