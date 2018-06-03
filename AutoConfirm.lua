local Name, AutoConfirm = ...;

AutoConfirm.Frame = CreateFrame('Frame');
AutoConfirm.Frame:RegisterEvent('PLAYER_ENTERING_WORLD');

AutoConfirm.popups = {
	['ABANDON_QUEST']                           = true,
	['ABANDON_QUEST_WITH_ITEMS']                = true,
	['ACTIVATE_FOLLOWER']                       = true,
	['AUTOEQUIP_BIND']                          = true,
	['BUYEMALL_CONFIRM']                        = false,
	['CONFIM_BEFORE_USE']                       = false,
	['CONFIRM_ACCEPT_SOCKETS']                  = true,
	['CONFIRM_BINDER']                          = false,
	['CONFIRM_BUY_BANK_SLOT']                   = true,
	['CONFIRM_BUY_REAGENTBANK_TAB']             = true,
	['CONFIRM_DELETE_EQUIPMENT_SET']            = true,
	['CONFIRM_DELETE_SELECTED_MACRO']           = true,
	['CONFIRM_DELETE_TRANSMOG_OUTFIT']          = true,
	['CONFIRM_FOLLOWER_TEMPORARY_ABILITY']      = true,
	['CONFIRM_FOLLOWER_UPGRADE']                = true,
	['CONFIRM_HIGH_COST_ITEM']                  = false,
	['CONFIRM_LEARN_SPEC']                      = true,
	['CONFIRM_LEAVE_INSTANCE_PARTY']            = true,
	['CONFIRM_MAIL_ITEM_UNREFUNDABLE']          = false,
	['CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL']    = true,
	['CONFIRM_PLAYER_CHOICE']                   = true,
	['CONFIRM_PURCHASE_NONREFUNDABLE_ITEM']     = false,
	['CONFIRM_PURCHASE_TOKEN_ITEM']             = true,
	['CONFIRM_RECRUIT_FOLLOWER']                = true,
	['CONFIRM_REFUND_TOKEN_ITEM']               = true,
	['CONFIRM_RELIC_REPLACE']                   = false,
	['CONFIRM_REMOVE_FRIEND']                   = true,
	['CONFIRM_RESET_INSTANCES']                 = true,
	['CONFIRM_RESET_TO_DEFAULT_KEYBINDINGS']    = true,
	['CONFIRM_SAVE_EQUIPMENT_SET']              = true,
	['CONFIRM_UPGRADE_ITEM']                    = true,
	['DANGEROUS_MISSIONS']                      = true,
	['DEACTIVATE_FOLLOWER']                     = true,
	['DEATH']                                   = false,
	['DELETE_GOOD_ITEM']                        = false,
	['DELETE_ITEM']                             = false,
	['DELETE_QUEST_ITEM']                       = false,
	['EQUIP_BIND']                              = true,
	['EQUIP_BIND_TRADEABLE']                    = false,
	['GOSSIP_CONFIRM']                          = true,
	['LOOT_BIND']                               = true,
	['LOOT_BIND_CONFIRM']                       = true,
	['NOT_ENOUGH_POWER_ARTIFACT_RESPEC']        = true,
	['ORDER_HALL_TALENT_RESEARCH']              = false,
	['OUTFITTER_CONFIRM_SET_CURRENT']           = true,
	['PARTY_INVITE']                            = false,
	['PETBM_DELETE_TEAM']                       = true,
	['PREMADEFILTER_CONFIRM_CLOSE']             = true,
	['RECOVER_CORPSE']                          = false,
	['RESURRECT_NO_TIMER']                      = false,
	['SEND_MONEY']                              = false,
	['TALENTS_INVOLUNTARILY_RESET']             = true,
	['TRADE_POTENTIAL_REMOVE_TRANSMOG']         = true,
	['TRANSMOG_APPLY_WARNING']                  = false,
	['VOID_DEPOSIT_CONFIRM']                    = false,
	['VOID_STORAGE_DEPOSIT_CONFIRMATION']       = false,
	['LFG_LIST_ENTRY_EXPIRED_TOO_MANY_PLAYERS'] = false,
	['CALENDAR_ERROR']                          = false,
	['CONFIRM_REPORT_SPAM_CHAT']                = false,
	['BATTLE_PET_PUT_IN_CAGE']                  = false,
	['WORLD_QUEST_ENTERED_PROMT']               = false,
	['EXPERIMENTAL_CVAR_WARNING']               = false,
	['CONFIRM_RELIC_TALENT']                    = false,
	['CONFIRM_SUMMON']                          = false,
	['BUYOUT_AUCTION']                          = false,
};

function AutoConfirm:PopupShow()
	for i = 1, 10 do
		local popupFrame = _G['StaticPopup' .. i];

		if
			popupFrame and
			popupFrame.which and
			AutoConfirm.popups[popupFrame.which] and
			popupFrame:IsShown()
		then
			local button = popupFrame.button1;
			local editBox = popupFrame.editBox;

			if editBox and editBox:IsShown() then
				editBox:SetText(DELETE_ITEM_CONFIRM_STRING);
			end

			button:Click('LeftButton');
		end
	end
end

function AutoConfirm.Frame:OnEvent()
	hooksecurefunc('StaticPopup_Show', AutoConfirm.PopupShow);
end

AutoConfirm.Frame:SetScript('OnEvent', AutoConfirm.Frame.OnEvent);