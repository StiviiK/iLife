CItemCategoryManager = inherit(cSingleton)

function CItemCategoryManager:constructor()
	local start = getTickCount()
    local result = CDatabase:getInstance():query("SELECT * FROM item_category")
	if(#result > 0) then
		for key, value in pairs(result) do
			new (CItemCategory, value["ID"], value["Name"], value["Description"])
		end
		outputServerLog("Es wurden "..tostring(#result).." Item Kategorien gefunden! (" .. getTickCount() - start .. "ms)")
	else
		outputServerLog("Es wurden keine Item Kategorien gefunden!")
	end
end

function CItemCategoryManager:destructor()
    
end