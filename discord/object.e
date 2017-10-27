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

feature {NONE} -- Implementation

	client: CLIENT
			-- API used for the various API calls made in the objects

end
