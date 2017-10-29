note
	description: "Socket connected to the Discord gateway"
	author: "ZeLarpMaster"
	date: "Sun, 29 Oct 2017 04:19:05 +0000"
	revision: "0.0.1"

class
	WEB_SOCKET

create
	make

feature {NONE} -- Initialization

	make(a_url: READABLE_STRING_GENERAL)
			-- Initializes `Current' to connect to `a_url'
		do
			url := a_url
		end

feature {NONE} -- Implementation

	url: READABLE_STRING_GENERAL
			-- Url where `Current' is connected to

end
