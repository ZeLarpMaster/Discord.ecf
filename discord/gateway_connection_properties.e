note
	description: "Data structure of the connection properties of the application to the gateway"
	author: "ZeLarpMaster"
	date: "Mon, 6 Nov 2017 20:39:17 +0000"
	revision: "0.0.1"

class
	GATEWAY_CONNECTION_PROPERTIES

inherit
	SERIALIZABLE

create
	make

feature {NONE} -- Initialization

	make(a_serializer: SERIALIZER)
			-- Initializes `Current' to be serialized with `a_serializer'
		do
			make_serializable(a_serializer)
		end

feature -- Basic Operations

	serialize: ANY
			-- <Precursor>
		do
			Result := serializer.serialize_connection_properties(Current)
		end

end
