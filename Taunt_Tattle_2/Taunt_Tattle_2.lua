function TauntTattle2Frame_OnLoad()
   
   TauntTattle2Frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
   
   
   ChatFrame1:AddMessage("|cffffff00 Taunt Tattle2 Loaded");
   
   -- already hidden by default, but just in case...
   TauntTattle2Frame:Hide();
end

function TauntTattle2Frame_OnEvent(event, ...)
   
   local timestamp, ttype, hideCaster, srcGUID, srcName, srcFlags, sourceRaidFlags, dstGUID, dstName, dstFlags, destRaidFlags, spellid, spellname, spellschool, b_or_d = select(1, ...);
   
	if (ttype == "SPELL_CAST_SUCCESS") and (isTaunt(spellid)) then
		if (dstName) then
			ChatFrame1:AddMessage(spellname.." used to taunt "..dstName.." by ".. srcName, 0, 1, 0);
		else
			ChatFrame1:AddMessage(spellname.." used by ".. srcName, 0, 1, 0);
		end
	end

	if (ttype == "SPELL_CAST_FAILED") and (isTaunt(spellid)) then
		ChatFrame1:AddMessage("TAUNT FAILED: " .. spellname .. " by " .. srcName, 1.0, 0, 0);
	end
end

function isTaunt(spellid)
   if(
      -- Bear Growl
      (spellid == 6795) 
      
      -- DK Death grip
      or (spellid == 49576) 
      
      -- Warrior Taunt
      or (spellid == 355) 
      
      -- Warrior Mocking Banner
      or(spellid == 114198)
      
      -- Paladin Reckoning
      or (spellid == 62124) 
      
      -- DK Dark Command (Blood)
      or (spellid == 56222)
      
      -- DK Dark Command (DPS)
      or (spellid == 172962)
      
      -- Lock VW
      or (spellid == 17735)
      
      -- Monk Statue
      or (spellid == 115546)
      
      -- Monk Provoke
      or (spellid == 173338)
      
      -- Hunter Distracting Shot
      or (spellid == 20736)
      
      -- Hunter Pet - Growl
      or (spellid == 2649)
   ) then
      return true
   end      
   return false
end
