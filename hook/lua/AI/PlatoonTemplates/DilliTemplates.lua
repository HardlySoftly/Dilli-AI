--[[
    File    :   /lua/AI/PlattonTemplates/DilliTemplates.lua
    Author  :   Softles
    Summary :
        Responsible for defining a mapping from AIBuilders keys -> AIBehaviours (not really AIBehaviours, just platoon.lua functions)
]]


PlatoonTemplate {
    Name = 'CommanderBuilderDilli',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.COMMAND, 1, 1, 'support', 'None' },
    },
}

PlatoonTemplate {
    Name = 'DilliT1Raid',
    Plan = 'HuntAI',
    GlobalSquads = {
        { categories.MOBILE * categories.LAND - categories.EXPERIMENTAL - categories.ENGINEER - categories.xsl0402 + categories.ual0201, 1, 3, 'attack', 'none' },
    },
}

PlatoonTemplate {
    Name = 'DilliT1Attack',
    Plan = 'HuntAI',
    GlobalSquads = {
        { categories.MOBILE * categories.LAND - categories.EXPERIMENTAL - categories.ENGINEER - categories.xsl0402, 5, 20, 'attack', 'none' },
    },
}

PlatoonTemplate {
    Name = 'EngineerAssistDilli',
    Plan = 'SorianManagerEngineerAssistAI',
    GlobalSquads = {
        { categories.ENGINEER, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'IntieAIDilli',
    Plan = 'InterceptorAI',
    GlobalSquads = {
        { categories.AIR * categories.MOBILE * categories.ANTIAIR * (categories.TECH1 + categories.TECH2 + categories.TECH3) - categories.BOMBER - categories.TRANSPORTFOCUS - categories.EXPERIMENTAL, 2, 100, 'attack', 'none' },
    }
}
