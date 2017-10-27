note
	description: "Abstract serializable entity"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 03:22:06 +0000"
	revision: "0.0.1"

deferred class
	SERIALIZABLE

feature {NONE} -- Initialization

	deserialize(a_serialized_data: READABLE_STRING_GENERAL)
			-- Initializes `Current' by using the information in `a_serialized_data'
		deferred
		ensure
			Serialized_is_equal: Current.serialize ~ a_serialized_data
		end

feature -- Basic operations

	serialize: READABLE_STRING_GENERAL
			-- Returns easy to store data representing `Current'
		deferred
		ensure
			--Deserialized_is_equal: deserialize(Result) ~ Current
		end

feature -- Access

	has_error: BOOLEAN
			-- Whether or not `Current' encountered an error while deserializing

end
