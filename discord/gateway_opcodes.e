note
	description: "Constants for each possible gateway opcode"
	author: "ZeLarpMaster"
	date: "Fri, 3 Nov 2017 22:06:12 +0000"
	revision: "0.0.1"
	url: "https://discordapp.com/developers/docs/topics/gateway#gateway-opcodespayloads-gateway-opcodes"

class
	GATEWAY_OPCODES

feature -- Basic Operations

	is_valid_opcode(a_opcode: like Dispatch): BOOLEAN
			-- `True' when an arbitrary `a_opcode' is valid
		do
			Result := Dispatch <= a_opcode and a_opcode <= Heartbeat_ack
		ensure
			Result_True_if_in_Range: Result = (Dispatch <= a_opcode and a_opcode <= Heartbeat_ack)
		end

feature -- Constants

	Dispatch: NATURAL_8 = 0
			-- dispatches an event (Receive)

	Heartbeat: like Dispatch = 1
			-- used for ping checking (Send/Receive)

	Identify: like Dispatch = 2
			-- used for client handshake (Send)

	Status_update: like Dispatch = 3
			-- used to update the client status (Send)

	Voice_state_update: like Dispatch = 4
			-- used to join/move/leave voice channels (Send)

	Voice_server_ping: like Dispatch = 5
			-- used for voice ping checking (Send)

	Resume: like Dispatch = 6
			-- used to resume a closed connection (Send)

	Reconnect: like Dispatch = 7
			-- used to tell clients to reconnect to the gateway (Receive)

	Request_guild_members: like Dispatch = 8
			-- used to request guild members (Send)

	Invalid_session: like Dispatch = 9
			-- used to notify client they have an invalid session id

	Hello: like Dispatch = 10
			-- sent immediately after connecting, contains heartbeat and server debug information (Receive)

	Heartbeat_ack: like Dispatch = 11
			-- sent immediately following a client heartbeat that was received (Receive)

end
