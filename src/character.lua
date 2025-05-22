local md5 = require('md5')
local lfs = require('lfs')
local base64 = require('base64')
local Classes = require('src.classes')

local Character = {}

function Character:new(name, class, path_ssh_key)
	self.name = name

	local existing_class = Classes[class]

	if existing_class then
		self.class = existing_class
		self.stats = existing_class.stats
		self.path_ssh_key = path_ssh_key
	else
		error('Invalid class: ' .. class)
	end

	return self
end

function Character:save()
	local data = {
		name = self.name,
		class = self.class.name,
		stats = {
			strength = self.stats.strength,
			intelligence = self.stats.intelligence,
			agility = self.stats.agility,
			defense = self.stats.defense
		},
		level = self.level or 1,
		xp = self.xp or 0,
		ssh_key = self:load_ssh_key()
	}

	lfs.mkdir('./.players')

	local file_path = './.players/' .. self:slugify(self.name) .. '.lua'
	local file = io.open(file_path, 'w')

	if file then
		local player_data = [[
return {
	name = "%s",
	class = "%s",
	stats = {
		strength = %d,
		intelligence = %d,
		agility = %d,
		defense = %d,
	},
	level = %d,
	xp = %d,
	ssh_key = "%s"
}
]]

		file:write(player_data:format(
			data.name,
			data.class,
			tonumber(data.stats.strength),
			tonumber(data.stats.intelligence),
			tonumber(data.stats.agility),
			tonumber(data.stats.defense),
			tonumber(data.level),
			tonumber(data.xp),
			data.ssh_key
		))

		file:close()

		return true
	end

	return false
end

function Character:name_exists(name)
	-- return self.name == name
end

function Character:slugify(name)
	return name:lower():gsub(' ', '_')
end

function Character:load_ssh_key()
	local file = io.open(self.path_ssh_key, 'r')

	if file then
		local ssh_key = file:read('*a')
		local md5_hash = base64.encode(md5.crypt(ssh_key, 'random_key'))

		file:close()

		return md5_hash
	end

	return nil
end

return Character
