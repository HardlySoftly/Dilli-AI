--[[
	File    :   /lua/AI/AIBuilders/DilliFactoryBuilders.lua
    Author  :   Softles
    Summary :
        Factory Builders for Dilli.
        If a factory is making units, that behaviour is controlled here.
]]

local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local TBC = '/lua/editor/ThreatBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'
local SIBC = '/lua/editor/SorianInstantBuildConditions.lua'
local SBC = '/lua/editor/SorianBuildConditions.lua'

BuilderGroup {
    BuilderGroupName = 'DilliT1GenericFactory',
    BuildersType = 'FactoryBuilder',

    --[[
        Initial T1 Engineer Builders
    ]]
    Builder {
        BuilderName = 'DilliFactoryInitialT1Engineer',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 2000,
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsWithCategory', { 2, categories.ENGINEER - categories.COMMAND } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'DilliFactorySecondaryT1Engineer',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 1800,
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsWithCategory', { 5, categories.ENGINEER - categories.COMMAND } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'DilliFactoryT1LandEngineer',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 1500,
        BuilderConditions = {
            { UCBC, 'HaveUnitRatio', { 0.05, categories.ENGINEER, '<=', categories.LAND * categories.MOBILE - categories.ENGINEER } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'DilliFactoryT1LandEngineerAlt',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 1500,
        BuilderConditions = {
            { UCBC, 'HaveUnitRatio', { 2.0, categories.ENGINEER, '<', categories.FACTORY * categories.LAND } },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, categories.LAND * categories.ENGINEER } },
        },
        BuilderType = 'All',
    }
}

BuilderGroup {
    BuilderGroupName = 'DilliT2GenericFactory',
    BuildersType = 'FactoryBuilder',

    --[[
        Initial T2 Engineer Builders
    ]]
    Builder {
        BuilderName = 'DilliFactoryInitialT2Engineer',
        PlatoonTemplate = 'T2BuildEngineer',
        Priority = 3000,
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsWithCategory', { 1, categories.ENGINEER * categories.TECH2 - categories.COMMAND } },
        },
        BuilderType = 'All',
    },
}

--[[
    Land Factory Builders
]]
BuilderGroup {
    BuilderGroupName = 'DilliT1LandFactory',
    BuildersType = 'FactoryBuilder',

    --[[
        Initial Land Builders
    ]]
    Builder {
        BuilderName = 'DilliFactoryInitialT1Tanks',
        PlatoonTemplate = 'T1LandDFTank',
        Priority = 1900,
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsWithCategory', { 3, categories.LAND * categories.DIRECTFIRE - categories.SCOUT } },
        },
        BuilderType = 'Land',
    },
    Builder {
        BuilderName = 'DilliFactoryInitialT1Scouts',
        PlatoonTemplate = 'T1LandScout',
        Priority = 1950,
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsWithCategory', { 3, categories.LAND * categories.SCOUT } },
            { UCBC, 'HaveUnitRatio', { 0.5, categories.LAND * categories.SCOUT, '<', categories.LAND * categories.DIRECTFIRE * categories.MOBILE - categories.SCOUT } },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, categories.LAND * categories.SCOUT } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 1, categories.LAND * categories.DIRECTFIRE - categories.SCOUT } },
        },
        BuilderType = 'Land',
    },

    --[[
        High Priority Builders
    ]]
    Builder {
        BuilderName = 'DilliFactoryHiPriT1AA',
        PlatoonTemplate = 'T1LandAA',
        Priority = 2100,
        BuilderConditions = {
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 0, 'Air', 1 } },
            { UCBC, 'HaveLessThanUnitsWithCategory', { 4, categories.LAND * categories.ANTIAIR * categories.MOBILE } },
        },
        BuilderType = 'Land',
    },

    --[[
        Regular Spam Builders
    ]]
    Builder {
        BuilderName = 'DilliFactorySpamT1Tank',
        PlatoonTemplate = 'T1LandDFTank',
        Priority = 1000,
        BuilderConditions = {
            { SIBC, 'GreaterThanEconIncome',  { 6, 70 } },
            { SIBC, 'HaveGreaterThanUnitsWithCategory', { 0, 'FACTORY TECH2' } },
        },
        BuilderType = 'Land'
    },
    Builder {
        BuilderName = 'DilliFactorySpamT1TankAlt',
        PlatoonTemplate = 'T1LandDFTank',
        Priority = 1000,
        BuilderConditions = {
            { SIBC, 'HaveLessThanUnitsWithCategory', { 1, 'FACTORY TECH2' } },
        },
        BuilderType = 'Land'
    },
    Builder {
        BuilderName = 'DilliFactorySpamT1AA',
        PlatoonTemplate = 'T1LandAA',
        Priority = 1500,
        BuilderConditions = {
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 0, 'Air', 1 } },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 2, categories.LAND * categories.ANTIAIR * categories.MOBILE } },
            { UCBC, 'HaveUnitRatio', { 0.15, categories.LAND * categories.ANTIAIR * categories.MOBILE, '<', categories.LAND * categories.DIRECTFIRE * categories.MOBILE - categories.SCOUT } },
        },
        BuilderType = 'Land'
    },
    Builder {
        BuilderName = 'DilliFactorySpamT1Arty',
        PlatoonTemplate = 'T1LandArtillery',
        Priority = 1500,
        BuilderConditions = {
            { UCBC, 'HaveUnitRatio', { 0.22, categories.LAND * categories.INDIRECTFIRE * categories.MOBILE, '<', categories.LAND * categories.DIRECTFIRE * categories.MOBILE - categories.SCOUT } },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 2, categories.LAND * categories.INDIRECTFIRE * categories.MOBILE } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 8, categories.LAND * categories.MOBILE * categories.DIRECTFIRE } },
        },
        BuilderType = 'Land',
    },
    Builder {
        BuilderName = 'DilliFactorySpamT1Scout',
        PlatoonTemplate = 'T1LandScout',
        Priority = 1500,
        BuilderConditions = {
            { UCBC, 'HaveUnitRatio', { 0.075, categories.LAND * categories.SCOUT, '<', categories.LAND * categories.DIRECTFIRE * categories.MOBILE - categories.SCOUT } },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, categories.LAND * categories.SCOUT } },
        },
        BuilderType = 'Land',
    },
    Builder {
        BuilderName = 'DilliFactorySpamT1Scout',
        PlatoonTemplate = 'T1LandScout',
        Priority = 1500,
        BuilderConditions = {
            { UCBC, 'HaveUnitRatio', { 0.25, categories.LAND * categories.SCOUT, '<', categories.LAND * categories.DIRECTFIRE * categories.MOBILE - categories.SCOUT } },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, categories.LAND * categories.SCOUT } },
            { UCBC, 'HaveLessThanUnitsWithCategory', { 30, categories.LAND * categories.MOBILE * categories.DIRECTFIRE } },
        },
        BuilderType = 'Land',
    },
}

BuilderGroup {
    BuilderGroupName = 'DilliT2LandFactory',
    BuildersType = 'FactoryBuilder',

    --[[
        High Priority Builders
    ]]
    Builder {
        BuilderName = 'DilliFactoryHiPriT1AA',
        PlatoonTemplate = 'T2LandAA',
        Priority = 2200,
        BuilderConditions = {
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 0, 'Air', 1 } },
            { UCBC, 'HaveLessThanUnitsWithCategory', { 4, categories.LAND * categories.ANTIAIR * categories.MOBILE } },
        },
        BuilderType = 'Land'
    },

    --[[
        Regular Spam Builders
    ]]
    Builder {
        BuilderName = 'DilliFactorySpamT2Tank',
        PlatoonTemplate = 'T2LandDFTank',
        Priority = 1100,
        BuilderConditions = { },
        BuilderType = 'Land'
    },
    Builder {
        BuilderName = 'DilliFactorySpamT2AA',
        PlatoonTemplate = 'T2LandAA',
        Priority = 1600,
        BuilderConditions = {
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 0, 'Air', 1 } },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 2, categories.LAND * categories.ANTIAIR * categories.MOBILE } },
            { UCBC, 'HaveUnitRatio', { 0.1, categories.LAND * categories.ANTIAIR * categories.MOBILE, '<', categories.LAND * categories.SCOUT } },
        },
        BuilderType = 'Land'
    },
    Builder {
        BuilderName = 'DilliFactorySpamT2Arty',
        PlatoonTemplate = 'T2LandArtillery',
        Priority = 1600,
        BuilderConditions = {
            { UCBC, 'HaveUnitRatio', { 0.05, categories.LAND * categories.INDIRECTFIRE * categories.MOBILE * categories.TECH2, '<', categories.LAND * categories.DIRECTFIRE * categories.MOBILE * categories.TECH2 } },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 2, categories.LAND * categories.INDIRECTFIRE * categories.MOBILE } },
        },
        BuilderType = 'Land',
    },
}

--[[
    Land Factory Upgrades
]]
BuilderGroup {
    BuilderGroupName = 'DilliUpgradeLandFactory',
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'DilliFactoryInitialUpgradeLand',
        PlatoonTemplate = 'T1LandFactoryUpgrade',
        InstanceCount = 1,
        Priority = 2100,
        BuilderConditions = {
            { SIBC, 'GreaterThanEconIncome',  { 6, 50 } },
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, 'FACTORY TECH2' } },
            { SIBC, 'HaveGreaterThanUnitsWithCategory', { 2, 'MASSEXTRACTION TECH2' } },
            { SIBC, 'HaveGreaterThanUnitsWithCategory', { 5, 'FACTORY TECH1' } },
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'DilliFactoryMainUpgradeLand',
        PlatoonTemplate = 'T1LandFactoryUpgrade',
        InstanceCount = 1,
        Priority = 2000,
        BuilderConditions = {
            { SIBC, 'GreaterThanEconIncome',  { 6, 50 } },
            { SIBC, 'HaveGreaterThanUnitsWithCategory', { 2, 'MASSEXTRACTION TECH2' } },
            { SIBC, 'HaveGreaterThanUnitsWithCategory', { 0, 'FACTORY TECH2' } },
        },
        BuilderType = 'Any',
    },
}

--[[
    Air Factory Builders
]]
BuilderGroup {
    BuilderGroupName = 'DilliT1AirFactory',
    BuildersType = 'FactoryBuilder',

    --[[
        Initial T1 Air Builders
    ]]
    Builder {
        BuilderName = 'DilliFactoryInitialT1AirScouts',
        PlatoonTemplate = 'T1AirScout',
        Priority = 1950,
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsWithCategory', { 3, categories.AIR * categories.SCOUT } },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, categories.AIR * categories.SCOUT } },
        },
        BuilderType = 'Air',
    },
    Builder {
        BuilderName = 'DilliFactoryT1Bombers',
        PlatoonTemplate = 'T1AirBomber',
        Priority = 100,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.0, 0.7}},
        },
        BuilderType = 'Air',
    },

    --[[
        Regular Spam Builders
    ]]
    Builder {
        BuilderName = 'DilliFactoryT1Inties',
        PlatoonTemplate = 'T1AirFighter',
        Priority = 200,
        BuilderConditions = {
            { SBC, 'HaveRatioUnitsWithCategoryAndAlliance', { false, 1.5, categories.AIR * categories.ANTIAIR, categories.AIR * categories.MOBILE, 'Enemy'}},
                { EBC, 'GreaterThanEconStorageRatio', { 0.0, 0.7}},
        },
        BuilderType = 'Air',
    },
    Builder {
        BuilderName = 'DilliFactoryT1AirScouts',
        PlatoonTemplate = 'T1AirScout',
        Priority = 250,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 8, categories.AIR } },
            { UCBC, 'HaveLessThanUnitsWithCategory', { 6, categories.AIR * categories.SCOUT } },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, categories.AIR * categories.SCOUT } },
        },
        BuilderType = 'Air',
    },
}