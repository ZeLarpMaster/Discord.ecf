note
	description: "{JSON_STRING} constants to prevent needless recreation of those string objects"
	author: "ZeLarpMaster"
	date: "Sat, 28 Oct 2017 03:18:24 +0000"
	revision: "0.0.1"

class
	JSON_STRING_CONSTANTS

feature -- Access

	json_string_id: JSON_STRING
			-- {JSON_STRING} of "id"
		once("PROCESS")
			create Result.make_from_string_general("id")
		end

	json_string_d: JSON_STRING
			-- {JSON_STRING} of "d"
		once("PROCESS")
			create Result.make_from_string_general("d")
		end

	json_string_op: JSON_STRING
			-- {JSON_STRING} of "op"
		once("PROCESS")
			create Result.make_from_string_general("op")
		end

	json_string_s: JSON_STRING
			-- {JSON_STRING} of "s"
		once("PROCESS")
			create Result.make_from_string_general("s")
		end

	json_string_t: JSON_STRING
			-- {JSON_STRING} of "t"
		once("PROCESS")
			create Result.make_from_string_general("t")
		end

	json_string_heartbeat_interval: JSON_STRING
			-- {JSON_STRING} of "heartbeat_interval"
		once("PROCESS")
			create Result.make_from_string_general("heartbeat_interval")
		end

	json_string_compress: JSON_STRING
			-- {JSON_STRING} of "compress"
		once("PROCESS")
			create Result.make_from_string_general("compress")
		end

	json_string_large_threshold: JSON_STRING
			-- {JSON_STRING} of "large_threshold"
		once("PROCESS")
			create Result.make_from_string_general("large_threshold")
		end

	json_string_presence: JSON_STRING
			-- {JSON_STRING} of "presence"
		once("PROCESS")
			create Result.make_from_string_general("presence")
		end

	json_string_properties: JSON_STRING
			-- {JSON_STRING} of "properties"
		once("PROCESS")
			create Result.make_from_string_general("properties")
		end

	json_string_shard: JSON_STRING
			-- {JSON_STRING} of "shard"
		once("PROCESS")
			create Result.make_from_string_general("shard")
		end

	json_string_token: JSON_STRING
			-- {JSON_STRING} of "token"
		once("PROCESS")
			create Result.make_from_string_general("token")
		end

	json_string_dollar_os: JSON_STRING
			-- {JSON_STRING} of "$os"
		once("PROCESS")
			create Result.make_from_string_general("$os")
		end

	json_string_dollar_browser: JSON_STRING
			-- {JSON_STRING} of "$browser"
		once("PROCESS")
			create Result.make_from_string_general("$browser")
		end

	json_string_dollar_device: JSON_STRING
			-- {JSON_STRING} of "$device"
		once("PROCESS")
			create Result.make_from_string_general("$device")
		end

	json_string_name: JSON_STRING
			-- {JSON_STRING} of "name"
		once("PROCESS")
			create Result.make_from_string_general("name")
		end

	json_string_type: JSON_STRING
			-- {JSON_STRING} of "type"
		once("PROCESS")
			create Result.make_from_string_general("type")
		end


	json_string_url: JSON_STRING
			-- {JSON_STRING} of "url"
		once("PROCESS")
			create Result.make_from_string_general("url")
		end

	json_string_status: JSON_STRING
			-- {JSON_STRING} of "status"
		once("PROCESS")
			create Result.make_from_string_general("status")
		end

	json_string_afk: JSON_STRING
			-- {JSON_STRING} of "afk"
		once("PROCESS")
			create Result.make_from_string_general("afk")
		end

	json_string_since: JSON_STRING
			-- {JSON_STRING} of "since"
		once("PROCESS")
			create Result.make_from_string_general("since")
		end

	json_string_game: JSON_STRING
			-- {JSON_STRING} of "game"
		once("PROCESS")
			create Result.make_from_string_general("game")
		end

	json_string_shards: JSON_STRING
			-- {JSON_STRING} of "shards"
		once("PROCESS")
			create Result.make_from_string_general("shards")
		end

	json_string_guild_id: JSON_STRING
			-- {JSON_STRING} of "guild_id"
		once("PROCESS")
			create Result.make_from_string_general("guild_id")
		end

	json_string_position: JSON_STRING
			-- {JSON_STRING} of "position"
		once("PROCESS")
			create Result.make_from_string_general("position")
		end

	json_string_permission_overwrites: JSON_STRING
			-- {JSON_STRING} of "permission_overwrites"
		once("PROCESS")
			create Result.make_from_string_general("permission_overwrites")
		end

	json_string_topic: JSON_STRING
			-- {JSON_STRING} of "topic"
		once("PROCESS")
			create Result.make_from_string_general("topic")
		end

	json_string_nsfw: JSON_STRING
			-- {JSON_STRING} of "nsfw"
		once("PROCESS")
			create Result.make_from_string_general("nsfw")
		end

	json_string_last_message_id: JSON_STRING
			-- {JSON_STRING} of "last_message_id"
		once("PROCESS")
			create Result.make_from_string_general("last_message_id")
		end

	json_string_bitrate: JSON_STRING
			-- {JSON_STRING} of "bitrate"
		once("PROCESS")
			create Result.make_from_string_general("bitrate")
		end

	json_string_user_limit: JSON_STRING
			-- {JSON_STRING} of "user_limit"
		once("PROCESS")
			create Result.make_from_string_general("user_limit")
		end

	json_string_recipients: JSON_STRING
			-- {JSON_STRING} of "recipients"
		once("PROCESS")
			create Result.make_from_string_general("recipients")
		end

	json_string_icon: JSON_STRING
			-- {JSON_STRING} of "icon"
		once("PROCESS")
			create Result.make_from_string_general("icon")
		end

	json_string_owner_id: JSON_STRING
			-- {JSON_STRING} of "owner_id"
		once("PROCESS")
			create Result.make_from_string_general("owner_id")
		end

	json_string_application_id: JSON_STRING
			-- {JSON_STRING} of "application_id"
		once("PROCESS")
			create Result.make_from_string_general("application_id")
		end

	json_string_parent_id: JSON_STRING
			-- {JSON_STRING} of "parent_id"
		once("PROCESS")
			create Result.make_from_string_general("parent_id")
		end

	json_string_private_channels: JSON_STRING
			--{JSON_STRING} of "private_channels"
		once("PROCESS")
			create Result.make_from_string_general("private_channels")
		end

	json_string_username: JSON_STRING
			-- {JSON_STRING} of "username"
		once("PROCESS")
			create Result.make_from_string_general("username")
		end

	json_string_discriminator: JSON_STRING
			-- {JSON_STRING} of "discriminator"
		once("PROCESS")
			create Result.make_from_string_general("discriminator")
		end

	json_string_avatar: JSON_STRING
			-- {JSON_STRING} of "avatar"
		once("PROCESS")
			create Result.make_from_string_general("avatar")
		end

	json_string_bot: JSON_STRING
			-- {JSON_STRING} of "bot"
		once("PROCESS")
			create Result.make_from_string_general("bot")
		end

	json_string_mfa_enabled: JSON_STRING
			-- {JSON_STRING} of "mfa_enabled"
		once("PROCESS")
			create Result.make_from_string_general("mfa_enabled")
		end

	json_string_verified: JSON_STRING
			-- {JSON_STRING} of "verified"
		once("PROCESS")
			create Result.make_from_string_general("verified")
		end

	json_string_email: JSON_STRING
			-- {JSON_STRING} of "email"
		once("PROCESS")
			create Result.make_from_string_general("email")
		end

end
