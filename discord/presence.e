note
	description: "The presence of a {USER} on Discord"
	author: "ZeLarpMaster"
	date: "Mon, 6 Nov 2017 20:35:33 +0000"
	revision: "0.0.1"

class
	PRESENCE

inherit
	SERIALIZABLE

create
	make

feature {NONE} -- Initialization

	make(a_serializer: SERIALIZER; a_status: PRESENCE_STATUS; a_is_afk: BOOLEAN;
	     a_game: detachable GAME_STATUS; a_idle_since: detachable DATE_TIME)
			-- Initializes `Current' to be serialized with `a_serializer'
		do
			make_serializable(a_serializer)
			status := a_status
			is_afk := a_is_afk
			game := a_game
			idle_since := a_idle_since
		ensure
			Serializer_Set: serializer ~ a_serializer
			Status_Set: status ~ a_status
			Game_Set: game ~ a_game
			Idle_Since_Set: idle_since ~ a_idle_since
		end

feature -- Access

	status: PRESENCE_STATUS
			-- The {USER}'s status

	is_afk: BOOLEAN
			-- Whether or not the {USER} is afk

	game: detachable GAME_STATUS
			-- The {USER}'s new game activity

	idle_since: detachable DATE_TIME
			-- time of when the {USER} went idle, or null if the {USER} is not idle

feature -- Basic Operations

	serialize: ANY
			-- <Precursor>
		do
			Result := serializer.serialize_presence(Current)
		end

end
