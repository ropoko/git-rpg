local lfs = require('lfs')
local Classes = require('src.classes')

local Character = {}

function Character:new(name, class)
	self.name = name

	local existing_class = Classes[class]

	if existing_class then
		self.class = existing_class
		self.stats = existing_class.stats
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
			tonumber(data.xp)
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

return Character
