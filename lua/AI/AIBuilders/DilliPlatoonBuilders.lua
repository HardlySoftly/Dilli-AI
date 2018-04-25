--[[
	File    :   /lua/AI/AIBuilders/DilliPlatoonBuilders.lua
    Author  :   Softles
    Summary :
        Platoon Builders for Dilli
        A platoon is just a group of units taking orders together.
]]

local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local SIBC = '/lua/editor/SorianInstantBuildConditions.lua'

BuilderGroup {
    BuilderGroupName = 'DilliT1Platoons',
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'Dilli T1 Raiding',
        PlatoonTemplate = 'DilliT1Raid',
        Priority = 300,
        InstanceCount = 5,
        BuilderType = 'Any',
        BuilderData = {
            NeverGuardBases = true,
            NeverGuardEngineers = true,
        },        
        BuilderConditions = { },
    },
    Builder {
        BuilderName = 'DilliT1Attack',
        PlatoonTemplate = 'DilliT1Attack',
        Priority = 200,
        InstanceCount = 200,
        BuilderType = 'Any',
        BuilderData = {
            NeverGuardBases = true,
            NeverGuardEngineers = false,
            UseFormation = 'AttackFormation',
        },        
        BuilderConditions = { },
    },
    Builder {
        BuilderName = 'DilliT1AirAttack',
        PlatoonTemplate = 'BomberAttack',
        Priority = 100,
        InstanceCount = 200,
        BuilderType = 'Any',
        BuilderData = {
            NeverGuardBases = true,
            NeverGuardEngineers = true,
            UseFormation = 'AttackFormation',
        },        
        BuilderConditions = { },
    },
    Builder {
        BuilderName = 'DilliT1AirScout',
        PlatoonTemplate = 'T1AirScoutForm',
        Priority = 100,
        InstanceCount = 200,
        BuilderType = 'Any',
        BuilderData = {
            NeverGuardBases = true,
            NeverGuardEngineers = true,
            UseFormation = 'AttackFormation',
        },        
        BuilderConditions = { },
    },
    Builder {
        BuilderName = 'DilliT1LandScout',
        PlatoonTemplate = 'T1LandScoutForm',
        Priority = 400,
        InstanceCount = 4,
        BuilderType = 'Any',
        BuilderData = {
            NeverGuardBases = true,
            NeverGuardEngineers = true,
            UseFormation = 'AttackFormation',
        },        
        BuilderConditions = { },
    },
    Builder {
        BuilderName = 'DilliT1AirDefense',
        PlatoonTemplate = 'IntieAIDilli',
        Priority = 100,
        InstanceCount = 200,
        BuilderType = 'Any',
        BuilderData = {
            NeverGuardBases = true,
            NeverGuardEngineers = true,
            UseFormation = 'AttackFormation',
        },        
        BuilderConditions = { },
    },
    Builder {
        BuilderName = 'DilliT1Assist',
        PlatoonTemplate = 'EngineerAssistDilli',
        Priority = 5,
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