note
	description: "Abstract factory for model deserialization"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 07:59:50 +0000"
	revision: "0.0.1"

deferred class
	MODEL_FACTORY

feature {NONE} -- Initialization

	make
			-- Initializes `Current'
		do
			initialize_serializer
		end

feature -- Access

	has_client: BOOLEAN
			-- Whether or not `Current's client has been set
		do
			Result := attached client
		end

	set_client(a_client: CLIENT)
			-- Sets the client transfered to models
		do
			client := a_client
		end

	encoding_name: READABLE_STRING_GENERAL
			-- The name of `Current's encoding
		deferred
		end

feature -- REST Models

	create_server(a_data: ANY): detachable SERVER
			-- Creates a server using the information in `a_data'
			-- The result will be detached if the data does not correspond to a server
		require
			Client_Set: has_client
		deferred
		end

feature -- Gateway Models

	parse_gateway_message(a_message: STRING): detachable GATEWAY_PAYLOAD
			-- Creates a {GATEWAY_PAYLOAD} object from the contents of `a_message'
			-- The result will be detached if the data does not correspond to a gateway payload
		deferred
		end

feature {NONE} -- Implementation

	initialize_serializer
			-- Initializes `serializer' with a concrete instance
		deferred
		end

	client: detachable CLIENT
			-- The {CLIENT} passed down to created models

	serializer: SERIALIZER
			-- The {SERIALIZER} passed down to created models

end
