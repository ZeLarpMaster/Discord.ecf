note
	description: "Abstract Discord Object"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 03:14:06 +0000"
	revision: "0.0.1"

deferred class
	DISCORD_OBJECT

inherit
	SERIALIZABLE

feature {NONE} -- Initialization

	make_object(a_serializer: SERIALIZER; a_client: DISCORD_CLIENT; a_id: READABLE_STRING_GENERAL)
			-- Initializes a basic object
		do
			make_serializable(a_serializer)
			client := a_client
			id := a_id
		ensure
			Serializer_Set: serializer ~ a_serializer
			Client_Set: client ~ a_client
			Id_Set: id ~ a_id
		end

feature -- Access

	id: READABLE_STRING_GENERAL
			-- The id of `Current'

	has_error: BOOLEAN
			-- `True' when `Current' had an error during initialization

feature {NONE} -- Implementation

	client: DISCORD_CLIENT
			-- API used for the various API calls made in the objects

end
