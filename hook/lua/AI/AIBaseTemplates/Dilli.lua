--[[
    File    :   /lua/AI/AIBaseTemplates/Dilli.lua
    Author  :   Softles
    Summary :
        Lists AIs to be included into the lobby, see /lua/AI/CustomAIs_v2/SorianAI.lua for another example.
        Loaded in by /lua/ui/lobby/aitypes.lua, this loads all lua files in /lua/AI/CustomAIs_v2/
]]

BaseBuilderTemplate {
    BaseTemplateName = 'Dilli',
    Builders = {
        -- Engie Builders
        'DilliCommanderBuilder',
        'DilliEngieBuilders',

        --Economy
        'DilliUpgradeMex'

        -- Factory Builders
        'DilliT1GenericFactory',
        'DilliT2GenericFactory',
        'DilliT1LandFactory',
        'DilliT2LandFactory',
        'DilliUpgradeLandFactory',
        'DilliT1AirFactory',

        -- Platoon Builders
        'DilliT1Platoons',
    },
    NonCheatBuilders = {
        -- I'm so good I don't need to cheat
    },
    BaseSettings = {

    },
    ExpansionFunction = function(aiBrain, location, markerType)
        -- Expanding is for casuals
        return 0
    end,
    
    FirstBaseFunction = function(aiBrain)
        local per = ScenarioInfo.ArmySetup[aiBrain.Name].AIPersonality
        if not per then 
            return 1, 'Dilli'
        end

        if per != 'dilli' then
            return 1, 'Dilli'
        else
            return 9000, 'Dilli'
        end
    end,
}