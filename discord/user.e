note
	description: "Represente a discord user"
	author: "Alexandre Caron"
	date: "Wed 08 Nov 2017 21:25:00 +0000"
	revision: "0.0.1"
	ref: "https://discordapp.com/developers/docs/resources/user#user-object"

class
	USER

inherit
	OBJECT

create {MODEL_FACTORY}
	make

feature {NONE} -- Initialization

	make(a_serializer: SERIALIZER; a_client: CLIENT; a_id: READABLE_STRING_GENERAL; a_username: READABLE_STRING_GENERAL; a_discriminator: READABLE_STRING_GENERAL; a_avatar: READABLE_STRING_GENERAL)
			-- Initializes the `Current'.
		do
			make_object(a_serializer, a_client, a_id)
			username := a_username
			discriminator := a_discriminator
			avatar := a_avatar

			is_bot := False
			is_mfa_enabled := False
			is_verified := False
			email := create {STRING}.make_empty

		end

feature -- Basic Operations

	serialize: ANY
			-- <Precursor>
		do
			Result := serializer.serialize_user(Current)
		end

feature -- Access

	username: READABLE_STRING_GENERAL
			-- The `Current's username, not unique across the platform

	discriminator: READABLE_STRING_GENERAL
			-- The `Current's 4-digit discord-tag

	avatar: READABLE_STRING_GENERAL
			-- The `Current's avatar hash

	is_bot: BOOLEAN assign set_is_bot
			-- Whether the `Current's belongs to an OAuth2 application

	is_mfa_enabled: BOOLEAN assign set_is_mfa_enabled
			-- Whether the `Current's has two factor enabled on their account

	is_verified: BOOLEAN assign set_is_verified
			-- Whether the email on this account has been verified

	email: READABLE_STRING_GENERAL assign set_email
			-- The `Current's email

	set_email(a_email: READABLE_STRING_GENERAL)
			-- Sets the `Current's email to `a_email'
		do
			email := a_email
		ensure
			Email_Is_Set: email ~ a_email
		end

	set_is_bot(a_is_bot: BOOLEAN)
			-- Sets the `Current's is_bot to `a_is_bot'
		do
			is_bot := a_is_bot
		ensure
			Is_bot_Set: is_bot ~ a_is_bot
		end

	set_is_mfa_enabled(a_is_mfa_enabled: BOOLEAN)
			-- Sets the `Current's is_mfa_enabled to `a_is_mfa_enabled'
		do
			is_mfa_enabled := a_is_mfa_enabled
		ensure
			Is_mfa_enabled_Set: is_mfa_enabled ~ a_is_mfa_enabled
		end

	set_is_verified(a_is_verified: BOOLEAN)
			-- Sets the `Current's is_verified to `a_is_verified'
		do
			is_verified := a_is_verified
		ensure
			Is_verified_Set: is_verified ~ a_is_verified
		end


end
