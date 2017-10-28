note
	description: "Abstract factory for model deserialization"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 07:59:50 +0000"
	revision: "0.0.1"

deferred class
	MODEL_FACTORY

feature {NONE} -- Initialization

	make(a_client: CLIENT)
			-- Initializes `Current' using `a_client' when creating objects
		do
			client := a_client
			initialize_serializer
		end

feature -- Basic Operations

	create_server(a_data: ANY): detachable SERVER
			-- Creates a server using the information in `a_data'
			-- The result will be detached if the data does not correspond to a server
		deferred
		end

feature {NONE} -- Implementation

	initialize_serializer
			-- Initializes `serializer' with a concrete instance
		deferred
		end

	client: CLIENT
			-- The {CLIENT} passed down to created models

	serializer: SERIALIZER
			-- The {SERIALIZER} passed down to created models

end
