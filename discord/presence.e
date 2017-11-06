note
	description: "The presence of the application on Discord"
	author: "ZeLarpMaster"
	date: "Mon, 6 Nov 2017 20:35:33 +0000"
	revision: "0.0.1"

class
	PRESENCE

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
			Result := serializer.serialize_presence(Current)
		end

end
