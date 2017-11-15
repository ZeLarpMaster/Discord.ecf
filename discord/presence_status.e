note
	description: "Proxy for a {USER}'s status to ensure a good value"
	author: "ZeLarpMaster"
	date: "Fri, 3 Nov 2017 21:03:24 +0000"
	revision: "0.0.1"
	url: "https://discordapp.com/developers/docs/topics/gateway#gateway-status-update-status-types"

class
	PRESENCE_STATUS

create
	make_from_string,
	make_online,
	make_dnd,
	make_idle,
	make_invisible,
	make_offline

feature {NONE} -- Initialization

	make_from_string(a_status: READABLE_STRING_GENERAL)
			-- Initializes `Current' from the given status string
		require
			Valid_Status: is_valid_status(a_status)
		do
			status := a_status
		ensure
			Status_Set: status ~ a_status
		end

	make_online
			-- Initializes `Current' as `Online'
		do
			make_from_string(Online)
		ensure
			Is_Online: is_online
		end

	make_dnd
			-- Initializes `Current' as `Do_not_disturb'
		do
			make_from_string(Do_not_disturb)
		ensure
			Is_Dnd: is_dnd
		end

	make_idle
			-- Initializes `Current' as `Idle'
		do
			make_from_string(Idle)
		ensure
			Is_Idle: is_idle
		end

	make_invisible
			-- Initializes `Current' as `Invisible'
		do
			make_from_string(Invisible)
		ensure
			Is_Invisible: is_invisible
		end

	make_offline
			-- Initializes `Current' as `Offline'
		do
			make_from_string(Offline)
		ensure
			Is_Offline: is_offline
		end

feature -- Access

	value: READABLE_STRING_GENERAL
			-- The {READABLE_STRING_GENERAL} value of `Current'
		do
			Result := status
		ensure
			Value_Is_Valid: is_valid_status(Result)
		end

feature -- Basic Operations

	is_valid_status(a_status: READABLE_STRING_GENERAL): BOOLEAN
			-- Whether or not `a_status' is a valid status string
			-- TODO: Make this static?
		do
			Result := (
				a_status ~ Online or
				a_status ~ Do_not_disturb or
				a_status ~ Idle or
				a_status ~ Invisible or
				a_status ~ Offline
			)
		end

	is_online: BOOLEAN
			-- Whether or not `Current' is `Online'
		do
			Result := status ~ Online
		end

	is_dnd: BOOLEAN
			-- Whether or not `Current' is `Do_not_disturb'
		do
			Result := status ~ Do_not_disturb
		end

	is_idle: BOOLEAN
			-- Whether or not `Current' is `Idle'
		do
			Result := status ~ Idle
		end

	is_invisible: BOOLEAN
			-- Whether or not `Current' is `Invisible'
		do
			Result := status ~ Invisible
		end

	is_offline: BOOLEAN
			-- Whether or not `Current' is `Offline'
		do
			Result := status ~ Offline
		end

feature {NONE} -- Implementation

	status: READABLE_STRING_GENERAL
			-- `Current's status

	Online: STRING = "online"
	Do_not_disturb: STRING = "dnd"
	Idle: STRING = "idle"
	Invisible: STRING = "invisible"
	Offline: STRING = "offline"

end
