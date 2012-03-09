local messages = { 	ERR_MOUNT_SHAPESHIFTED,
					ERR_NO_ITEMS_WHILE_SHAPESHIFTED,
					ERR_NOT_WHILE_SHAPESHIFTED,
					ERR_TAXIPLAYERSHAPESHIFTED,
					ERR_CANT_INTERACT_SHAPESHIFTED
				}

function Humanize()
	local num_forms = GetNumShapeshiftForms()
	local index = nil

	for index = 1, num_forms, 1 do
		local _, _, active, _ = GetShapeshiftFormInfo(index);

		if active ~= nil then
			CastShapeshiftForm(index);
			break;
		end
	end
end

local f = CreateFrame("Frame")
f:RegisterEvent("UI_ERROR_MESSAGE")

f:SetScript("OnEvent", function()
	if arg1 == nil then
		return
	end

	for message in messages do
 		if arg1 == messages[message] then
   			Humanize();
   		end
    end
end);