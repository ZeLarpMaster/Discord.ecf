note
	description: "High level interface with the Discord API"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 03:08:30 +0000"
	revision: "0.0.1"

class
	DISCORD_CLIENT

create
	make

feature {NONE} -- Initialization

	make(a_factory: MODEL_FACTORY)
			-- Initializes `Current' with `a_factory' to deserialize models
		do
			create config.make("a token", a_factory)
			create http.make_with_token(config)
			create {ARRAYED_LIST[SHARD]} shards.make(1)
			a_factory.set_client(Current)
		ensure
			Config_Has_Factory: config.factory ~ a_factory
			Factory_Has_Client: config.factory.has_client
		end

feature {NONE} -- Implementation

	config: CLIENT_CONFIGURATION
			-- General configuration of `Current'

	shards: LIST[SHARD]
			-- List of shards ordered by id

	http: DISCORD_REST_API
			-- Interface to the Discord REST API

end
