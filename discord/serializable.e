note
	description: "Abstract class representing an object which can be serialized"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 23:17:35 +0000"
	revision: "0.0.1"

deferred class
	SERIALIZABLE

feature {NONE} -- Initialization

	make_serializable(a_serializer: SERIALIZER)
			-- Initializes `serializer' with `a_serializer'
		do
			serializer := a_serializer
		ensure
			Serializer_Set: serializer ~ a_serializer
		end

feature -- Basic Operations

	serialize: ANY
			-- Serialize `Current'
		deferred
		end

feature {NONE} -- Implementation

	serializer: SERIALIZER
			-- Object used to serialize `Current'

end
