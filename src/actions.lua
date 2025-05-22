local ActionsType = {
	create_player = 'create_player'
}

local ActionsMessage = {
	[ActionsType.create_player] = function(player_name)
		return 'new player created: ' .. player_name
	end
}

return { ActionsType = ActionsType, ActionsMessage = ActionsMessage }
