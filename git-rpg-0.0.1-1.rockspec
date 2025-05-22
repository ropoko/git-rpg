package = "git-rpg"
version = "0.0.1-1"

source = {
	url = "*** please add URL for source tarball, zip or repository here ***"
}

description = {
	homepage = "*** please enter a project homepage ***",
	license = "*** please specify a license ***"
}

build = {
	type = "builtin",

	modules = {
		main = "main.lua"
	}
}

dependencies = {
	"lua >= 5.4",
	"luafilesystem >= 1.8.0-1",
	"lummander >= 0.1.0-2",
	"lua-yaml >= 1.2-2",
	"md5 >= 1.3-1",
	"base64 >= 1.5-3"
}
