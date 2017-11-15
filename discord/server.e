note
	description: "Represents a Discord Guild (aka server)"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 22:54:15 +0000"
	revision: "0.0.1"

class
	SERVER

inherit
	OBJECT

create {MODEL_FACTORY}
	make

feature {NONE} -- Initialization

	make(a_serializer: SERIALIZER; a_client: CLIENT; a_id: READABLE_STRING_GENERAL)
			-- Initializes `Current' with `a_client' to interact with the API and `a_id' as the identifier
		do
			make_object(a_serializer, a_client, a_id)
		ensure
			Serializer_Set: serializer ~ a_serializer
			Client_Set: client ~ a_client
			Id_Set: id ~ a_id
		end

feature -- Basic Operations

	serialize: ANY
			-- <Precursor>
		do
			Result := serializer.serialize_server(Current)
		end

end
