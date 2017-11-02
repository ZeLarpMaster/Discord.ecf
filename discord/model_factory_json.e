note
	description: "Abstract factory for model deserialization"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 22:08:55 +0000"
	revision: "0.0.1"

class
	MODEL_FACTORY_JSON

inherit
	MODEL_FACTORY
		redefine
			create_server,
			initialize_serializer,
			encoding_name
		end

create
	make

feature -- Basic Operations

	create_server(a_data: JSON_OBJECT): detachable SERVER
			-- <Precursor>
		do
			if
				attached {JSON_STRING} a_data.item("id") as la_string and
				attached client as la_client
			then
				create Result.make(serializer, la_client, la_string.item)
			end
		end

feature -- Access

	encoding_name: READABLE_STRING_GENERAL
			-- <Precursor>
		do
			Result := "json"
		end

feature {NONE} -- Implementation

	initialize_serializer
			-- Initializes `serializer' with a concrete instance of {SERIALIZER_JSON}
		do
			create {SERIALIZER_JSON} serializer
		end

end
