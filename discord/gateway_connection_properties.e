note
	description: "Data structure of the connection properties of the application to the gateway"
	author: "ZeLarpMaster"
	date: "Mon, 6 Nov 2017 20:39:17 +0000"
	revision: "0.0.1"
	url: "https://discordapp.com/developers/docs/topics/gateway#gateway-identify-gateway-identify-connection-properties"

class
	GATEWAY_CONNECTION_PROPERTIES

inherit
	SERIALIZABLE

create
	make

feature {NONE} -- Initialization

	make(a_serializer: SERIALIZER; a_os, a_browser, a_device: READABLE_STRING_GENERAL)
			-- Initializes `Current' to be serialized with `a_serializer'
		require
			No_Empty_String: not (a_os.is_empty or a_browser.is_empty or a_device.is_empty)
		do
			make_serializable(a_serializer)
			os_name := a_os
			browser_name := a_browser
			device_name := a_device
		ensure
			Serializer_Set: serializer ~ a_serializer
			OS_Set: os_name ~ a_os
			Browser_Set: browser_name ~ a_browser
			Device_Set: device_name ~ a_device
		end

feature -- Access

	os_name: READABLE_STRING_GENERAL
			-- The current application's OS name

	browser_name: READABLE_STRING_GENERAL
			-- The current application's browser name

	device_name: READABLE_STRING_GENERAL
			-- The current application's device name

feature -- Basic Operations

	serialize: ANY
			-- <Precursor>
		do
			Result := serializer.serialize_connection_properties(Current)
		end

invariant
	No_Empty_Attribute: not (os_name.is_empty or browser_name.is_empty or device_name.is_empty)
end
