local QuestID = 12
local Quest = Quests[QuestID]

Quest.Texts = {
    ["Accepted"] = "Finde die Schildkr\\oete!",
    ["Finished"] = "Bring die Schildkr\\oete zur\\ueck!"
}

addEventHandler("onClientCallsServerQuestScript", getRootElement(), 
    function(ID, Status, Data) 
        if (ID == QuestID) then
            if (Status == "Turtle_Hit") then
                Quest:playerFinish(client)
            end
        end
    end
)

Quest.playerReachedRequirements = 
    function(thePlayer, bOutput)
        return true
    end

Quest.getTaskPosition = 
    function()
        --Should return int, dim, x, y, z
        return 0, 0, 403.60001, -1908, 0
    end

Quest.onAccept = 
    function(thePlayer)
        return true
    end
        
Quest.onResume = 
    function(thePlayer)
        if ( thePlayer:isQuestActive(Quest) ~= "Finished" ) then
            Quest:triggerClientScript(thePlayer, "Accepted", false)
        end
        return true
    end

Quest.onProgress = 
    function(thePlayer)
        return true
    end

Quest.onFinish = 
    function(thePlayer)
        return true
    end

Quest.onAbort = 
    function(thePlayer)
        return true
    end

--outputDebugString("Loaded Questscript: server/Classes/Quest/Scripts/"..tostring(QuestID)..".lua")