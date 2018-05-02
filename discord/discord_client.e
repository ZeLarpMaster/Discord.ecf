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

	make(a_token: READABLE_STRING_GENERAL; a_factory: MODEL_FACTORY)
			-- Initializes `Current' with `a_factory' to deserialize models
		do
			create config.make(a_token, a_factory)
			create http.make_with_token(config)
			create {ARRAYED_LIST[SHARD]} shards.make(0)
			a_factory.set_client(Current)
		ensure
			Config_Has_Factory: config.factory ~ a_factory
			Factory_Has_Client: config.factory.has_client
		end

feature -- Access

	launch_not_blocking
			-- Initializes and starts the shards without blocking the thread
		do
			launch
		end

	launch_blocking
			-- Initializes and starts the shards by blocking the thread
		do
			launch
			from
			until
				Io.input.last_character ~ 'q'
			loop
				Io.input.read_character
			end
		end

feature {NONE} -- Implementation

	config: CLIENT_CONFIGURATION
			-- General configuration of `Current'

	shards: LIST[SHARD]
			-- List of shards ordered by id

	http: DISCORD_REST_API
			-- Interface to the Discord REST API

	launch
			-- Initializes and starts the shards
		local
			l_shard: SHARD
			l_shard_id: NATURAL_64
		do
			http.get_gateway_information
			if attached http.last_suggested_shards as la_shards and attached http.last_gateway_url as la_url then
				create {ARRAYED_LIST[SHARD]} shards.make(la_shards.item.as_integer_32)
				from
					shards.start
				until
					shards.exhausted
				loop
					create l_shard.make(config, la_url, l_shard_id)
					shards.put(l_shard)
					shards.item.launch
					shards.forth
					l_shard_id := l_shard_id + 1
				end
			end
		end

end
