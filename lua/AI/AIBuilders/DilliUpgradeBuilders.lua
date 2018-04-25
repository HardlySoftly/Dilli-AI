--[[
	File    :   /lua/AI/AIBuilders/DilliUpgradeBuilders.lua
    Author  :   Softles
    Summary :
        Upgrade Builders, e.g. Mexes.
]]

local SIBC = '/lua/editor/SorianInstantBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'

BuilderGroup {
    BuilderGroupName = 'DilliUpgradeMex',
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'DilliUpgradeMexT1Storage',
        PlatoonTemplate = 'T1MassExtractorUpgrade',
        InstanceCount = 1,
        Priority = 2000,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageCurrent', { 600, 0 } },
            { SIBC, 'GreaterThanEconIncome',  { 0, 20 } },
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'DilliUpgradeMexT1Trend',
        PlatoonTemplate = 'T1MassExtractorUpgrade',
        InstanceCount = 2,
        Priority = 1000,
        BuilderConditions = {
            { SIBC, 'GreaterThanEconIncome',  { 6, 70 } },
        },
        BuilderType = 'Any',
    },
}