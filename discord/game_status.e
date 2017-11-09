note
	description: "A {USER}'s game status"
	author: "ZeLarpMaster"
	date: "Wed, 8 Nov 2017 23:13:25 +0000"
	revision: "0.0.1"
	url: "https://discordapp.com/developers/docs/topics/gateway#game-object"

class
	GAME_STATUS

inherit
	SERIALIZABLE

create
	make_playing,
	make_streaming

feature {NONE} -- Initialization

	make(a_serializer: SERIALIZER; a_name, a_url: READABLE_STRING_GENERAL)
			-- Initializes `Current' with `a_name' name and `a_url' stream url
		require
			Name_Not_Empty: not a_name.is_empty
		do
			make_serializable(a_serializer)
			name := a_name
			url := a_url
		ensure
			Serializer_Set: serializer ~ a_serializer
			Name_Set: name ~ a_name
			Url_Set: url ~ a_url
		end

	make_playing(a_serializer: SERIALIZER; a_name: READABLE_STRING_GENERAL)
			-- Initializes `Current' to be serialized with `a_serializer' as a `Playing' status
		require
			Name_Not_Empty: not a_name.is_empty
		do
			make(a_serializer, a_name, create {STRING_8}.make_empty)
			type := Playing
		ensure
			Serializer_Set: serializer ~ a_serializer
			Name_Set: name ~ a_name
			Url_Is_Empty: url.is_empty
			Is_Playing: is_playing
		end

	make_streaming(a_serializer: SERIALIZER; a_name, a_url: READABLE_STRING_GENERAL)
			-- Initializes `Current' to be serialized with `a_serializer' as a `Streaming' status
		require
			Name_Not_Empty: not a_name.is_empty
			Url_Is_Twitch: a_url.is_empty or a_url.starts_with("https://twitch.tv/")
		do
			make(a_serializer, a_name, a_url)
			type := Streaming
		ensure
			Serializer_Set: serializer ~ a_serializer
			Name_Set: name ~ a_name
			Url_Set: url ~ a_url
			Is_Streaming: is_streaming
		end

feature -- Access

	name: READABLE_STRING_GENERAL
			-- The status' name

	url: READABLE_STRING_GENERAL
			-- The stream url, is validated when type is 1, only `https://twitch.tv/` urls currently work.

	is_playing: BOOLEAN
			-- Whether or not `Current' is a playing status
		do
			Result := type ~ Playing
		end

	is_streaming: BOOLEAN
			-- Whether or not `Current' is a streaming status
		do
			Result := type ~ Streaming
		end

feature -- Basic Operations

	serialize: ANY
			-- <Precursor>
		do
			Result := serializer.serialize_game_status(Current, type)
		end

feature {NONE} -- Implementation

	type: NATURAL_8
			-- `Current's type

feature {NONE} -- Type Constants

	Playing: like type = 0
			-- Playing `name'

	Streaming: like type = 1
			-- Stremaing `name'

end
