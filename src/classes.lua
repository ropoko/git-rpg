local Classes = {
	warrior = {
		name = 'Warrior',
		description = 'A warrior is a melee fighter who uses a sword and shield to attack enemies.',
		stats = {
			strength = 10,
			intelligence = 5,
			agility = 8,
			defense = 10
		}
	},

	mage = {
		name = 'Mage',
		description = 'A mage is a magic user who uses spells to attack enemies.',
		stats = {
			strength = 5,
			intelligence = 10,
			agility = 8,
			defense = 5
		}
	},

	archer = {
		name = 'Archer',
		description = 'An archer is a ranged fighter who uses a bow and arrow to attack enemies.',
		stats = {
			strength = 8,
			intelligence = 5,
			agility = 10,
			defense = 8
		}
	}
}

return Classes
