local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if C["misc"].restocker ~= true then return end

--[[
	-- addon by Zxian
	
	## Interface: 40000
	## Title: zRestock
	## Version: 0.5 BETA
	## Author: Zxian
	## Notes: An extremely lightweight reagent restocker
	## RequiredDeps: Tukui
	
	http://www.tukui.org/forums/topic.php?id=9136
--]]

local verbose = false
local items = {}

if T.myclass == "ROGUE" then
	items = {
		[6947]	= 60,		-- Instant Poison
		[2892]	= 60,		-- Deadly Poison
		[3775]	= 100,		-- Cripping Poison
		[5237]	= 60,		-- Mind-Numbing Poison
		[10918]	= 100,		-- Wound Poison
	}
elseif T.myclass == "MAGE" then
	items = {
		[17020] = 200,		-- Arcane Powder
		[17031] = 60, 		-- Rune of Teleportation
		[17032] = 60,		-- Rune of Portals
	}
elseif T.myclass == "SHAMAN" then
	items = {
		[17030] = 40,		-- Ankh
	}
elseif T.myclass == "DRUID" then
	items = {
		[17034] = 40,		-- Maple Seed
	}
end

local function ItemLinkToItemID(itemLink)
	return tonumber(string.match(itemLink, "item:(%d+)"))
end

local function TR_GetItemInventoryCount(itemID)
	local count = 0
	for bag = 0, 4, 1 do
		for slot = 1, GetContainerNumSlots(bag), 1 do
			if itemID == GetContainerItemID(bag,slot) then
				local _, slotCount = GetContainerItemInfo(bag,slot)
				count = count + slotCount
			end
		end
	end
	return count
end


local function TR_GetMerchantItemIndex(itemID)
	for i = 1, GetMerchantNumItems() do
		local merchantIL = GetMerchantItemLink(i)
		if not merchantIL then
			merchantIL = GetMerchantItemLink(i)
		end
		if merchantIL then
			local merchantIID = ItemLinkToItemID(merchantIL)
			if itemID == merchantIID then
				return i
			end
		end
	end
	return
end

local function TR_BuyItemFromMerchant(itemIndex,qty,iStackCount)
	while qty > iStackCount do
		BuyMerchantItem(itemIndex,iStackCount)
		qty = qty - iStackCount	
	end
	BuyMerchantItem(itemIndex,qty)
end

local function eventHandler(self, event, ...)
	for item,stack in pairs(items) do
		local _, itemLink, _, _, _, _, _, iStackCount = GetItemInfo(item)
		local invItemCount = TR_GetItemInventoryCount(item)
		local merchantIndex = TR_GetMerchantItemIndex(item)
		local numPurchase = stack - invItemCount
		if numPurchase > 0 and merchantIndex ~= nil then
			if verbose then print("Buying "..numPurchase.." "..itemLink) end
			TR_BuyItemFromMerchant(merchantIndex,numPurchase,iStackCount)
		end
		
	end
end

local frame = CreateFrame("FRAME", "TinyRestockerFrame")
frame:RegisterEvent("MERCHANT_SHOW")
frame:SetScript("OnEvent", eventHandler)