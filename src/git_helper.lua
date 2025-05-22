local os = require('os')
local ActionsMessage = require('src.actions').ActionsMessage

local config = require('config')

local GitHelper = {
	repo_path = config.git_repo.repo_path,
	repo_branch = config.git_repo.repo_branch
}

function GitHelper:stage()
	local mv_players = 'cp .players/*.lua ' .. self.repo_path .. '/.players/'
	pcall(os.execute, mv_players)

	local mv_quests = 'cp .quests/*.lua ' .. self.repo_path .. '/.quests/'
	pcall(os.execute, mv_quests)

	local add_command = 'git -C ' .. self.repo_path .. ' add .'
	os.execute(add_command)
end

function GitHelper:commit(message)
	local command = 'git -C ' .. self.repo_path .. ' commit -S -m "' .. message .. '"'
	os.execute(command)
end

function GitHelper:push()
	local command = 'git -C ' .. self.repo_path .. ' push'
	os.execute(command)
end

function GitHelper:save(action_type, ...)
	local message = ActionsMessage[action_type](...)

	self:stage()
	self:commit(message)
	-- self:push()
end

return GitHelper
