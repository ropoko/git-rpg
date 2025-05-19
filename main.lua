local lummander = require('lummander')
local Character = require('src.character')

local app = lummander.new({
	title = 'git-rpg',
	tag = 'git-rpg',
	description = 'A simple RPG game based on git',
	version = '0.0.1',
	author = 'ropoko',
	theme = "acid",
	flag_prevent_help = false
})

app:command('character <command> [args...]', 'handle all character related commands | <new>')
		:action(function(parsed, cmd)
			local command = parsed.command

			if command == 'new' then
				-- TODO: check required arguments
				local name = parsed.args[1]
				local class = parsed.args[2]

				local character = Character:new(name, class)
				character:save()
			end
		end)

app:parse(arg)
