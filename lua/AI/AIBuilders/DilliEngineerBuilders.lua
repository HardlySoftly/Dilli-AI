--[[
	File    :   /lua/AI/AIBuilders/DilliEngineerBuilders.lua
    Author  :   Softles
    Summary :
        Engineer Builders for Dilli.
        Includes ACU builders.
]]

local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local TBC = '/lua/editor/ThreatBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'
local MIBC = '/lua/editor/MiscBuildConditions.lua'
local MABC = '/lua/editor/MarkerBuildConditions.lua'
local IBC = '/lua/editor/InstantBuildConditions.lua'
local SAI = '/lua/ScenarioPlatoonAI.lua'
local SIBC = '/lua/editor/SorianInstantBuildConditions.lua'

BuilderGroup {
    BuilderGroupName = 'DilliCommanderBuilder',
    BuildersType = 'EngineerBuilder',
    -- The initial build order
    Builder {
        BuilderName = 'Initial BO',
        PlatoonTemplate = 'CommanderBuilderDilli',
        Priority = 1000,
        BuilderConditions = {
                { IBC, 'NotPreBuilt', {}},
            },
        InstantCheck = true,
        BuilderType = 'Any',
        PlatoonAddBehaviors = { 'CommanderBehaviorSorian' },
        PlatoonAddFunctions = { {SAI, 'BuildOnce'}, },
        BuilderData = {
            Construction = {
                BuildStructures = {
                    'T1LandFactory',
                    'T1EnergyProduction',
                    'T1EnergyProduction',
                    'T1Resource',
                    'T1Resource',
                    'T1EnergyProduction',
                    'T1EnergyProduction',
                    'T1EnergyProduction',
                    'T1Resource',
                    'T1Resource',
                    'T1LandFactory',
                }
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'DilliEngieBuilders',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T1MexEngineerMainInitial',
        PlatoonTemplate = 'EngineerBuilder',
        Priority = 1000,
        InstanceCount = 1,
        BuilderConditions = { },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = false,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1MexEngineerMain',
        PlatoonTemplate = 'EngineerBuilder',
        Priority = 800,
        InstanceCount = 1,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 256, -500, 1000, 0, 'AntiSurface', 1 }},
                { EBC, 'LessThanEconTrend', { 4, 100000}},
            },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = false,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1MexEngineerBackup',
        PlatoonTemplate = 'EngineerBuilder',
        Priority = 100,
        InstanceCount = 6,
        BuilderConditions = { },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = false,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1PgenEngineerMain',
        PlatoonTemplate = 'EngineerBuilder',
        Priority = 600,
        InstanceCount = 2,
        BuilderConditions = {
            { SIBC, 'LessThanEconIncome',  { 100000, 500 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.2, 00.0}},
            },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = false,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1EnergyProduction',
                }
            }
        }
    },
    Builder {
        BuilderName = 'DilliT1PgenEngineerAlt',
        PlatoonTemplate = 'EngineerBuilder',
        Priority = 600,
        InstanceCount = 2,
        BuilderConditions = {
            { SIBC, 'LessThanEconIncome',  { 100000, 500 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.5, 00.0}},
            },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = false,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1EnergyProduction',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1PgenEngineerBackup',
        PlatoonTemplate = 'EngineerBuilder',
        Priority = 600,
        InstanceCount = 1,
        BuilderConditions = {
            { SIBC, 'LessThanEconIncome',  { 100000, 500 } },
            { EBC, 'LessThanEconStorageRatio', { 1.0, 0.75}},
        },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = false,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1EnergyProduction',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1HydroPgenEngineer',
        PlatoonTemplate = 'EngineerBuilder',
        Priority = 650,
        InstanceCount = 3,
        BuilderConditions = {
            { MABC, 'MarkerLessThanDistance',  { 'Hydrocarbon', 100}},
        },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = false,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1HydroCarbon',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T2PgenEngineer',
        PlatoonTemplate = 'T2EngineerBuilder',
        Priority = 700,
        InstanceCount = 1,
        -- UNLIMITED POWER!
        BuilderConditions = { },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = false,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T2EnergyProduction',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1FacEngineer',
        PlatoonTemplate = 'EngineerBuilder',
        Priority = 700,
        InstanceCount = 2,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.1, 0.5}},
            { MIBC, 'GreaterThanGameTime', { 90}},
            { SIBC, 'HaveLessThanUnitsWithCategory', { 13, 'FACTORY TECH1, FACTORY TECH2' } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = false,
            DesiresAssist = true,
            Construction = {
                BuildStructures = {
                    'T1LandFactory',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1AirFacEngineer',
        PlatoonTemplate = 'EngineerBuilder',
        Priority = 700,
        InstanceCount = 1,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.1, 0.9}},
            { UCBC, 'HaveUnitRatio', { 0.2, categories.AIR * categories.FACTORY, '<', categories.LAND * categories.FACTORY } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 2, 'FACTORY TECH1' } },
            { MIBC, 'GreaterThanGameTime', { 90}},
        },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = false,
            DesiresAssist = true,
            Construction = {
                BuildStructures = {
                    'T1AirFactory',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1AirFacEngineerAlt',
        PlatoonTemplate = 'EngineerBuilder',
        Priority = 700,
        InstanceCount = 1,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.1, 0.9}},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 10, 'FACTORY TECH1, FACTORY TECH2' } },
            { MIBC, 'GreaterThanGameTime', { 90}},
            { SIBC, 'HaveLessThanUnitsWithCategory', { 18, 'FACTORY TECH1, FACTORY TECH2' } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = false,
            DesiresAssist = true,
            Construction = {
                BuildStructures = {
                    'T1AirFactory',
                }
            }
        }
    },
    Builder {
        BuilderName = 'Dilli T1 Engineer Assist Engineer',
        PlatoonTemplate = 'EngineerAssistDilli',
        Priority = 50,
        InstanceCount = 5,
        BuilderConditions = { },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                PermanentAssist = false,
                AssisteeType = 'Engineer',
                Time = 30,
            },
        }
    },
}