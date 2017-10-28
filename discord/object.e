note
	description: "Abstract Discord Object"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 03:14:06 +0000"
	revision: "0.0.1"

deferred class
	OBJECT

inherit
	SERIALIZABLE

feature -- Access

	id: READABLE_STRING_GENERAL
			-- The id of `Current'

feature {NONE} -- Initialization

	make_object(a_serializer: SERIALIZER; a_client: CLIENT; a_id: READABLE_STRING_GENERAL)
			-- Initializes a basic object
		do
			make_serializable(a_serializer)
			client := a_client
			id := a_id
		end

feature -- Access

	has_error: BOOLEAN
			-- Whether or not `Current' had an error during initialization

feature {NONE} -- Implementation

	client: CLIENT
			-- API used for the various API calls made in the objects

end
