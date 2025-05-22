local lummander = require('lummander')
local Character = require('src.character')
local config = require('config')

local app = lummander.new({
	title = 'git-rpg',
	tag = 'git-rpg',
	description = 'A simple RPG game based on git',
	version = '0.0.1',
	author = 'ropoko',
	theme = "acid",
	flag_prevent_help = false
})

app:command('char <command> [args...]', 'handle all character related commands | <new>')
		:action(function(parsed, cmd)
			local command = parsed.command

			if command == 'new' then
				-- TODO: check required arguments
				local name = parsed.args[1]
				local class = parsed.args[2]
				local path_ssh_key = parsed.args[3]

				local character = Character:new(name, class, path_ssh_key)
				character:save()
			end
		end)

app:parse(arg)
