note
	description: "Data structure of the identification of a shard"
	author: "ZeLarpMaster"
	date: "Mon, 6 Nov 2017 20:18:43 +0000"
	revision: "0.0.1"
	url: "https://discordapp.com/developers/docs/topics/gateway#gateway-identify-gateway-identify-structure"

class
	IDENTIFICATION_STRUCTURE

inherit
	SERIALIZABLE

create
	make

feature {NONE} -- Initialization

	make(a_serializer: SERIALIZER; a_token: READABLE_STRING_GENERAL; a_properties: GATEWAY_CONNECTION_PROPERTIES;
		 a_compress: BOOLEAN; a_large_threshold: NATURAL_8; a_shard_number: NATURAL_64; a_presence: PRESENCE)
			-- Initializes `Current' to be serialized with `a_serializer' and to contain the given data
		require
			Token_Not_Empty: not a_token.is_empty
			Shard_Number_Not_Null: a_shard_number > 0
		do
			make_serializable(a_serializer)
			token := a_token
			properties := a_properties
			compress := a_compress
			large_threshold := a_large_threshold
			shard_number := a_shard_number
			presence := a_presence
		ensure
			Serializer_Set: serializer ~ a_serializer
			Token_Set: token ~ a_token
			Properties_Set: properties ~ a_properties
			Compress_Set: compress ~ a_compress
			Threshold_Set: large_threshold ~ a_large_threshold
			Shard_Number_Set: shard_number ~ a_shard_number
			Presence_Set: presence ~ a_presence
		end

feature -- Basic Operations

	serialize: STRING_8
			-- <Precursor>
		require else
			Shard_Id_Set: attached shard_id
		do
			if attached shard_id as la_shard_id then
				Result := serializer.serialize_identify_structure(Current, la_shard_id.item)
			else
				Result := ""
			end
		ensure then
			No_Shard_Id_Empty_Result: not Result.is_empty = attached shard_id
		end

	set_shard_id(a_shard_id: NATURAL_64)
			-- Assigns `a_shard_id' into `shard_id'
		do
			if attached shard_id as la_shard then
				la_shard.replace(a_shard_id)
			else
				create shard_id.put(a_shard_id)
			end
		ensure
			Shard_Id_Set: attached shard_id as la_shard and then la_shard.item ~ a_shard_id
		end

feature -- Access

	token: READABLE_STRING_GENERAL
			-- Authentification token of the current application

	properties: GATEWAY_CONNECTION_PROPERTIES
			-- Properties of the current gateway connection

	compress: BOOLEAN
			-- Whether or not the current gateway connection is compressed

	large_threshold: NATURAL_8
			-- The number of {MEMBER}s in a {SERVER} before Discord stops sending us offline {MEMBER}s

	shard_number: NATURAL_64
			-- The total number of {SHARD}s in the current application

	shard_id: detachable CELL[NATURAL_64]
			-- The identifier of the shard currently identified

	presence: PRESENCE
			-- The initial presence of the current application on connection

end
