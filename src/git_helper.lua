local os = require('os')

local config = require('config')

local GitHelper = {
	repo_path = config.git_repo.repo_path,
	repo_branch = config.git_repo.repo_branch
}

function GitHelper:commit(message)
	local command = 'git -C ' .. self.repo_path .. ' commit -m "' .. message .. '"'
end

return GitHelper
