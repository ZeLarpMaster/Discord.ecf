note
	description: "Abstract class which can serialize {SERIALIZABLE}s"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 22:55:22 +0000"
	revision: "0.0.1"

deferred class
	SERIALIZER

feature -- Basic Operations

	serialize_server(a_server: SERVER): ANY
			-- Serializes `a_server'
		deferred
		end

end
