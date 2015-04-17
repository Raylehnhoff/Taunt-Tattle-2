function TauntTattleFrame_OnLoad()

	TauntTattleFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");


	ChatFrame1:AddMessage("|cffffff00 Taunt Tattle Loaded");

	-- already hidden by default, but just in case...
	TauntTattleFrame:Hide();
end

function TauntTattleFrame_OnEvent(event, ...)
	
	local timestamp, ttype, hideCaster, srcGUID, srcName, srcFlags, sourceRaidFlags, dstGUID, dstName, dstFlags, destRaidFlags, spellid, spellname, spellschool, b_or_d = select(1, ...);

	if (ttype == "SPELL_CAST_SUCCESS") and (
	-- Bear Growl
	(spellid == 6795) 
	
	-- DK Death grip
	or (spellid == 49576) 
	
	-- Warrior Taunt
	or (spellid == 355) 
	
	-- Paladin Reckoning
	or (spellid == 62124) 
	
	-- DK Dark Command
	or (spellid == 56222)
	
	-- Monk Statue
	or (spellid == 115546)
	
	-- Monk Provoke
	or (spellid == 173338)
	) then

			if (dstName) then
		  ChatFrame1:AddMessage(spellname.." used to taunt "..dstName.." by ".. srcName);
			else
		  ChatFrame1:AddMessage(spellname.." used by ".. srcName);
		end

		end

end
