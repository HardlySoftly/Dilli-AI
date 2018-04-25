--[[
    File    :   /lua/AI/CustomAIs_v2/DilliAI.lua
    Author  :   Softles
    Summary :
        Lists AIs to be included into the lobby, see /lua/AI/CustomAIs_v2/SorianAI.lua for another example.
        Loaded in by /lua/ui/lobby/aitypes.lua, this loads all lua files in /lua/AI/CustomAIs_v2/
]]

AI = {
	Name = 'Dilli',
	Version = '0.1.2.3.aintnobodygottimeforversions',
	AIList = {
		{
			key = 'dilli',
			name = 'AI: Dilli',
		},
	},
	CheatAIList = {
		{
			key = 'dillicheat',
			name = 'AIx: Dilli',
		},
	},
}