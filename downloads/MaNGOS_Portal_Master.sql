/*
MaNGOS Portal Master
By Rochet2
Downloaded from http://rochet2.github.io/
Bugs and contact with E-mail: Rochet2@post.com
*/

SET
@ENTRY          := 190000,
@NAME           := "Portal Master",
@SUBNAME        := "",
@MODEL          := 21572,

@AURA           := "30540 0", -- "35766 0" = casting

@TEXT_ID        := 300000,
@GOSSIP_MENU    := 50000,
@GOSSIP_SCRIPT  := 50000,

@RUNE           := 194394;

SET @CONDITIONID := 750; -- (SELECT max(condition_entry)+1 FROM conditions);

DELETE FROM creature_template WHERE entry = @ENTRY;
DELETE FROM creature_template_addon WHERE Entry = @ENTRY;
DELETE FROM gameobject_template WHERE entry = @ENTRY;
DELETE FROM gossip_menu WHERE entry BETWEEN @GOSSIP_MENU AND @GOSSIP_MENU+8;
DELETE FROM npc_text WHERE ID BETWEEN @TEXT_ID AND @TEXT_ID+4;
DELETE FROM conditions WHERE condition_entry BETWEEN @CONDITIONID AND @CONDITIONID+97;
DELETE FROM gossip_menu_option WHERE menu_id BETWEEN @GOSSIP_MENU AND @GOSSIP_MENU+8;
DELETE FROM dbscripts_on_gossip WHERE id BETWEEN @GOSSIP_SCRIPT AND @GOSSIP_SCRIPT+134;
DELETE FROM creature WHERE ID = @ENTRY;
DELETE FROM gameobject WHERE ID = @RUNE and guid >= 200000;

INSERT INTO creature_template (entry, modelid_1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, minhealth, maxhealth, minmana, maxmana, armor, faction, npcflag, speed_walk, speed_run, scale, rank, dmg_multiplier, unit_flags, type, type_flags, InhabitType, unk16, unk17, RegenHealth, flags_extra) VALUES
(@ENTRY, @MODEL, @NAME, @SUBNAME, "Directions", @GOSSIP_MENU, 71, 71, 13700, 13700, 6540, 6540, 5700, 35, 3, 1, 1.14286, 1.25, 1, 1, 2, 7, 138936390, 3, 1, 1, 1, 2);

INSERT INTO creature_template_addon (entry, mount, bytes1, emote, moveflags, auras) VALUES
(@ENTRY, 0, 0, 0, 0, @AURA);

INSERT INTO gossip_menu (entry, text_id, condition_id) VALUES
(@GOSSIP_MENU+4, @TEXT_ID+3, 0),
(@GOSSIP_MENU+3, @TEXT_ID+2, 0),
(@GOSSIP_MENU+2, @TEXT_ID+2, 0),
(@GOSSIP_MENU+1, @TEXT_ID+2, 0),
(@GOSSIP_MENU+8, @TEXT_ID+4, 0),
(@GOSSIP_MENU+7, @TEXT_ID+4, 0),
(@GOSSIP_MENU+6, @TEXT_ID+4, 0),
(@GOSSIP_MENU+5, @TEXT_ID, 0),
(@GOSSIP_MENU, @TEXT_ID, 21),
(@GOSSIP_MENU, @TEXT_ID+1, 22);

INSERT INTO npc_text (ID, text0_0, em0_1) VALUES
(@TEXT_ID+4, "$BWhere would you like to be ported?$B", 0),
(@TEXT_ID+3, "$BBe careful with choosing raids.$B", 0),
(@TEXT_ID+2, "$BUp for some dungeon exploring?$B", 0),
(@TEXT_ID+1, "$B For The Alliance!$B", 6),
(@TEXT_ID, "$B For the Horde!$B", 6);

INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
-- Area requirements
(@CONDITIONID, 4, 1519, 1),
(@CONDITIONID+1, 4, 1637, 1),
(@CONDITIONID+2, 4, 1662, 1),
(@CONDITIONID+3, 4, 1, 1),
(@CONDITIONID+4, 4, 3580, 1),
(@CONDITIONID+5, 4, 1638, 1),
(@CONDITIONID+6, 4, 1497, 1),
(@CONDITIONID+7, 4, 3487, 1),

(@CONDITIONID+8, 4, 4395, 1),
(@CONDITIONID+9, 4, 3703, 1),
(@CONDITIONID+10, 4, 35, 1),
(@CONDITIONID+11, 4, 1741, 1),

-- Level requirements
-- (@CONDITIONID+20, 15, 10, 1), -- 169
(@CONDITIONID+21, 15, 15, 1),
(@CONDITIONID+22, 15, 17, 1),
(@CONDITIONID+23, 15, 18, 1),
(@CONDITIONID+24, 15, 20, 1),
(@CONDITIONID+25, 15, 21, 1),
(@CONDITIONID+26, 15, 22, 1),
(@CONDITIONID+27, 15, 24, 1),
(@CONDITIONID+28, 15, 25, 1),
(@CONDITIONID+29, 15, 30, 1),
(@CONDITIONID+30, 15, 32, 1),
(@CONDITIONID+31, 15, 34, 1),
(@CONDITIONID+32, 15, 35, 1),
(@CONDITIONID+33, 15, 37, 1),
-- (@CONDITIONID+34, 15, 40, 1), -- 191
(@CONDITIONID+35, 15, 43, 1),
(@CONDITIONID+36, 15, 45, 1),
(@CONDITIONID+37, 15, 47, 1),
(@CONDITIONID+38, 15, 48, 1),
(@CONDITIONID+39, 15, 50, 1),
(@CONDITIONID+40, 15, 51, 1),
(@CONDITIONID+41, 15, 53, 1),
(@CONDITIONID+42, 15, 55, 1),
(@CONDITIONID+43, 15, 57, 1),
(@CONDITIONID+44, 15, 58, 1),
(@CONDITIONID+45, 15, 59, 1),
(@CONDITIONID+46, 15, 60, 1),
(@CONDITIONID+47, 15, 62, 1),
(@CONDITIONID+48, 15, 64, 1),
-- (@CONDITIONID+49, 15, 65, 1), -- 189
(@CONDITIONID+50, 15, 66, 1),
(@CONDITIONID+51, 15, 67, 1),
(@CONDITIONID+52, 15, 68, 1),
(@CONDITIONID+53, 15, 69, 1),
(@CONDITIONID+54, 15, 70, 1),
(@CONDITIONID+55, 15, 71, 1),
(@CONDITIONID+56, 15, 73, 1),
(@CONDITIONID+57, 15, 74, 1),
(@CONDITIONID+58, 15, 75, 1),
(@CONDITIONID+59, 15, 76, 1),
(@CONDITIONID+60, 15, 77, 1),
(@CONDITIONID+61, 15, 79, 1),
-- (@CONDITIONID+62, 15, 80, 1), -- 185

-- 22 A, 21 H
-- Mixed requirements
(@CONDITIONID+70, -1, @CONDITIONID, 22),
(@CONDITIONID+71, -1, @CONDITIONID+1, 21),
(@CONDITIONID+72, -1, @CONDITIONID+2, 22),
(@CONDITIONID+73, -1, @CONDITIONID+3, 22),
(@CONDITIONID+74, -1, @CONDITIONID+4, 22),
(@CONDITIONID+75, -1, @CONDITIONID+5, 21),
(@CONDITIONID+76, -1, @CONDITIONID+6, 21),
(@CONDITIONID+77, -1, @CONDITIONID+7, 21),

(@CONDITIONID+78, -1, @CONDITIONID+8, @CONDITIONID+51),
(@CONDITIONID+79, -1, @CONDITIONID+9, @CONDITIONID+43),
(@CONDITIONID+80, -1, @CONDITIONID+10, @CONDITIONID+29),
(@CONDITIONID+81, -1, @CONDITIONID+11, @CONDITIONID+29),

(@CONDITIONID+82, -1, 21, 169),
(@CONDITIONID+83, -1, 22, 169),
(@CONDITIONID+84, -1, 21, @CONDITIONID+21),
(@CONDITIONID+85, -1, 22, @CONDITIONID+21),
(@CONDITIONID+86, -1, 22, @CONDITIONID+22),
(@CONDITIONID+87, -1, 21, @CONDITIONID+22),
(@CONDITIONID+88, -1, 21, @CONDITIONID+23),
(@CONDITIONID+89, -1, 22, @CONDITIONID+23),
(@CONDITIONID+90, -1, 22, @CONDITIONID+24),
(@CONDITIONID+91, -1, 22, @CONDITIONID+26),
(@CONDITIONID+92, -1, 21, @CONDITIONID+27),
(@CONDITIONID+93, -1, 22, @CONDITIONID+28),
(@CONDITIONID+94, -1, 21, @CONDITIONID+28),
(@CONDITIONID+95, -1, 21, @CONDITIONID+30),
(@CONDITIONID+96, -1, 21, @CONDITIONID+31),
(@CONDITIONID+97, -1, 21, @CONDITIONID+54);

INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(@GOSSIP_MENU, 1, 2, "Stormwind", 1, 1, 0, 0, @GOSSIP_SCRIPT, 0, 0, "Are you sure, that you want to go to Stormwind?", @CONDITIONID+70),
(@GOSSIP_MENU, 2, 2, "Orgrimmar", 1, 1, 0, 0, @GOSSIP_SCRIPT+1, 0, 0, "Are you sure, that you want to go to Orgrimmar?", @CONDITIONID+71),
(@GOSSIP_MENU, 3, 2, "Darnassus", 1, 1, 0, 0, @GOSSIP_SCRIPT+8, 0, 0, "Are you sure, that you want to go to Darnassus?", @CONDITIONID+72),
(@GOSSIP_MENU, 4, 2, "Ironforge", 1, 1, 0, 0, @GOSSIP_SCRIPT+9, 0, 0, "Are you sure, that you want to go to Ironforge?", @CONDITIONID+73),
(@GOSSIP_MENU, 5, 2, "Exodar", 1, 1, 0, 0, @GOSSIP_SCRIPT+10, 0, 0, "Are you sure, that you want to go to Exodar?", @CONDITIONID+74),
(@GOSSIP_MENU, 6, 2, "Thunder bluff", 1, 1, 0, 0, @GOSSIP_SCRIPT+11, 0, 0, "Are you sure, that you want to go to Thunder bluff?", @CONDITIONID+75),
(@GOSSIP_MENU, 7, 2, "Undercity", 1, 1, 0, 0, @GOSSIP_SCRIPT+12, 0, 0, "Are you sure, that you want to go to Undercity?", @CONDITIONID+76),
(@GOSSIP_MENU, 8, 2, "Silvermoon city", 1, 1, 0, 0, @GOSSIP_SCRIPT+13, 0, 0, "Are you sure, that you want to go to Silvermoon city?", @CONDITIONID+77),
(@GOSSIP_MENU, 9, 2, "Dalaran", 1, 1, 0, 0, @GOSSIP_SCRIPT+5, 0, 0, "Are you sure, that you want to go to Dalaran?", @CONDITIONID+78),
(@GOSSIP_MENU, 10, 2, "Shattrath", 1, 1, 0, 0, @GOSSIP_SCRIPT+3, 0, 0, "Are you sure, that you want to go to Shattrath?", @CONDITIONID+79),
(@GOSSIP_MENU, 11, 2, "Booty bay", 1, 1, 0, 0, @GOSSIP_SCRIPT+2, 0, 0, "Are you sure, that you want to go to Booty bay?", @CONDITIONID+80),
(@GOSSIP_MENU, 12, 2, "Gurubashi arena", 1, 1, 0, 0, @GOSSIP_SCRIPT+6, 0, 0, "Are you sure, that you want to go to Arena?", @CONDITIONID+81),
(@GOSSIP_MENU, 13, 3, "Eastern Kingdoms", 1, 1, @GOSSIP_MENU+5, 0, 0, 0, 0, NULL, 0),
(@GOSSIP_MENU, 14, 3, "Kalimdor", 1, 1, @GOSSIP_MENU+6, 0, 0, 0, 0, NULL, 0),
(@GOSSIP_MENU, 15, 3, "Outland", 1, 1, @GOSSIP_MENU+7, 0, 0, 0, 0, NULL, @CONDITIONID+44),
(@GOSSIP_MENU, 16, 3, "Northrend", 1, 1, @GOSSIP_MENU+8, 0, 0, 0, 0, NULL, @CONDITIONID+52),
(@GOSSIP_MENU, 17, 9, "Classic Dungeons", 1, 1, @GOSSIP_MENU+1, 0, 0, 0, 0, NULL, @CONDITIONID+21),
(@GOSSIP_MENU, 18, 9, "BC Dungeons", 1, 1, @GOSSIP_MENU+2, 0, 0, 0, 0, NULL, @CONDITIONID+45),
(@GOSSIP_MENU, 19, 9, "Wrath Dungeons", 1, 1, @GOSSIP_MENU+3, 0, 0, 0, 0, NULL, @CONDITIONID+53),
(@GOSSIP_MENU, 20, 9, "Raid Teleports", 1, 1, @GOSSIP_MENU+4, 0, 0, 0, 0, NULL, @CONDITIONID+43),
(@GOSSIP_MENU+1, 0, 2, "Gnomeregan", 1, 1, 0, 0, @GOSSIP_SCRIPT+14, 0, 0, "Are you sure, that you want to go to Gnomeregan?", @CONDITIONID+93),
(@GOSSIP_MENU+1, 1, 2, "The Deadmines", 1, 1, 0, 0, @GOSSIP_SCRIPT+15, 0, 0, "Are you sure, that you want to go to The Deadmines?", @CONDITIONID+86),
(@GOSSIP_MENU+1, 2, 2, "The Stockade", 1, 1, 0, 0, @GOSSIP_SCRIPT+16, 0, 0, "Are you sure, that you want to go to The Stockade?", @CONDITIONID+91),
(@GOSSIP_MENU+1, 3, 2, "Ragefire Chasm", 1, 1, 0, 0, @GOSSIP_SCRIPT+17, 0, 0, "Are you sure, that you want to go to Ragefire Chasm?", @CONDITIONID+84),
(@GOSSIP_MENU+1, 4, 2, "Razorfen Downs", 1, 1, 0, 0, @GOSSIP_SCRIPT+18, 0, 0, "Are you sure, that you want to go to Razorfen Downs?", @CONDITIONID+96),
(@GOSSIP_MENU+1, 5, 2, "Razorfen Kraul", 1, 1, 0, 0, @GOSSIP_SCRIPT+19, 0, 0, "Are you sure, that you want to go to Razorfen Kraul?", @CONDITIONID+92),
(@GOSSIP_MENU+1, 6, 2, "Scarlet Monastery", 1, 1, 0, 0, @GOSSIP_SCRIPT+20, 0, 0, "Are you sure, that you want to go to Scarlet Monastery?", @CONDITIONID+95),
(@GOSSIP_MENU+1, 7, 2, "Shadowfang Keep", 1, 1, 0, 0, @GOSSIP_SCRIPT+21, 0, 0, "Are you sure, that you want to go to Shadowfang Keep?", @CONDITIONID+88),
(@GOSSIP_MENU+1, 8, 2, "Wailing Caverns", 1, 1, 0, 0, @GOSSIP_SCRIPT+22, 0, 0, "Are you sure, that you want to go to Wailing Caverns?", @CONDITIONID+87),
(@GOSSIP_MENU+1, 9, 2, "Blackfathom Deeps", 1, 1, 0, 0, @GOSSIP_SCRIPT+23, 0, 0, "Are you sure, that you want to go to Blackfathom Deeps?", @CONDITIONID+25),
(@GOSSIP_MENU+1, 10, 2, "Blackrock Depths", 1, 1, 0, 0, @GOSSIP_SCRIPT+24, 0, 0, "Are you sure, that you want to go to Blackrock Depths?", @CONDITIONID+41),
(@GOSSIP_MENU+1, 11, 2, "Blackrock Spire", 1, 1, 0, 0, @GOSSIP_SCRIPT+25, 0, 0, "Are you sure, that you want to go to Blackrock Spire?", @CONDITIONID+43),
(@GOSSIP_MENU+1, 12, 2, "Dire Maul", 1, 1, 0, 0, @GOSSIP_SCRIPT+26, 0, 0, "Are you sure, that you want to go to Dire Maul?", @CONDITIONID+42),
(@GOSSIP_MENU+1, 13, 2, "Maraudon", 1, 1, 0, 0, @GOSSIP_SCRIPT+27, 0, 0, "Are you sure, that you want to go to Maraudon?", @CONDITIONID+36),
(@GOSSIP_MENU+1, 14, 2, "Scholomance", 1, 1, 0, 0, @GOSSIP_SCRIPT+28, 0, 0, "Are you sure, that you want to go to Scholomance?", @CONDITIONID+42),
(@GOSSIP_MENU+1, 15, 2, "Stratholme", 1, 1, 0, 0, @GOSSIP_SCRIPT+29, 0, 0, "Are you sure, that you want to go to Stratholme?", @CONDITIONID+42),
(@GOSSIP_MENU+1, 16, 2, "Sunken Temple", 1, 1, 0, 0, @GOSSIP_SCRIPT+30, 0, 0, "Are you sure, that you want to go to Sunken Temple?", @CONDITIONID+37),
(@GOSSIP_MENU+1, 17, 2, "Uldaman", 1, 1, 0, 0, @GOSSIP_SCRIPT+31, 0, 0, "Are you sure, that you want to go to Uldaman?", @CONDITIONID+33),
(@GOSSIP_MENU+1, 18, 2, "Zul'Farrak", 1, 1, 0, 0, @GOSSIP_SCRIPT+32, 0, 0, "Are you sure, that you want to go to Zul'Farrak?", @CONDITIONID+32),
(@GOSSIP_MENU+1, 19, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0),
(@GOSSIP_MENU+2, 0, 2, "Auchindoun", 1, 1, 0, 0, @GOSSIP_SCRIPT+33, 0, 0, "Are you sure, that you want to go to Auchindoun?", @CONDITIONID+48),
(@GOSSIP_MENU+2, 1, 2, "Caverns of Time", 1, 1, 0, 0, @GOSSIP_SCRIPT+34, 0, 0, "Are you sure, that you want to go to Caverns of Time?", @CONDITIONID+50),
(@GOSSIP_MENU+2, 2, 2, "Coilfang Reservoir", 1, 1, 0, 0, @GOSSIP_SCRIPT+35, 0, 0, "Are you sure, that you want to go to Coilfang Reservoir?", @CONDITIONID+47),
(@GOSSIP_MENU+2, 3, 2, "Hellfire Citadel", 1, 1, 0, 0, @GOSSIP_SCRIPT+36, 0, 0, "Are you sure, that you want to go to Hellfire Citadel?", @CONDITIONID+45),
(@GOSSIP_MENU+2, 4, 2, "Magisters' Terrace", 1, 1, 0, 0, @GOSSIP_SCRIPT+37, 0, 0, "Are you sure, that you want to go to Magisters' Terrace?", @CONDITIONID+54),
(@GOSSIP_MENU+2, 5, 2, "Tempest Keep", 1, 1, 0, 0, @GOSSIP_SCRIPT+38, 0, 0, "Are you sure, that you want to go to Tempest Keep?", @CONDITIONID+54),
(@GOSSIP_MENU+2, 6, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0),
(@GOSSIP_MENU+3, 0, 2, "Azjol-Nerub", 1, 1, 0, 0, @GOSSIP_SCRIPT+39, 0, 0, "Are you sure, that you want to go to Azjol-Nerub?", @CONDITIONID+56),
(@GOSSIP_MENU+3, 1, 2, "The Culling of Stratholme", 1, 1, 0, 0, @GOSSIP_SCRIPT+40, 0, 0, "Are you sure, that you want to go to The Culling of Stratholme?", @CONDITIONID+61),
(@GOSSIP_MENU+3, 2, 2, "Trial of the Champion", 1, 1, 0, 0, @GOSSIP_SCRIPT+41, 0, 0, "Are you sure, that you want to go to Trial of the Champion?", @CONDITIONID+61),
(@GOSSIP_MENU+3, 3, 2, "Drak'Tharon Keep", 1, 1, 0, 0, @GOSSIP_SCRIPT+42, 0, 0, "Are you sure, that you want to go to Drak'Tharon Keep?", @CONDITIONID+57),
(@GOSSIP_MENU+3, 4, 2, "Gundrak", 1, 1, 0, 0, @GOSSIP_SCRIPT+43, 0, 0, "Are you sure, that you want to go to Gundrak?", @CONDITIONID+55),
(@GOSSIP_MENU+3, 5, 2, "Icecrown Citadel Dungeons", 1, 1, 0, 0, @GOSSIP_SCRIPT+44, 0, 0, "Are you sure, that you want to go to Icecrown Citadel Dungeons?", @CONDITIONID+61),
(@GOSSIP_MENU+3, 6, 2, "The Nexus Dungeons", 1, 1, 0, 0, @GOSSIP_SCRIPT+45, 0, 0, "Are you sure, that you want to go to The Nexus Dungeons?", @CONDITIONID+55),
(@GOSSIP_MENU+3, 7, 2, "The Violet Hold", 1, 1, 0, 0, @GOSSIP_SCRIPT+46, 0, 0, "Are you sure, that you want to go to The Violet Hold?", @CONDITIONID+58),
(@GOSSIP_MENU+3, 8, 2, "Halls of Lightning", 1, 1, 0, 0, @GOSSIP_SCRIPT+47, 0, 0, "Are you sure, that you want to go to Halls of Lightning?", @CONDITIONID+61),
(@GOSSIP_MENU+3, 9, 2, "Halls of Stone", 1, 1, 0, 0, @GOSSIP_SCRIPT+48, 0, 0, "Are you sure, that you want to go to Halls of Stone?", @CONDITIONID+60),
(@GOSSIP_MENU+3, 10, 2, "Utgarde Keep", 1, 1, 0, 0, @GOSSIP_SCRIPT+49, 0, 0, "Are you sure, that you want to go to Utgarde Keep?", @CONDITIONID+53),
(@GOSSIP_MENU+3, 11, 2, "Utgarde Pinnacle", 1, 1, 0, 0, @GOSSIP_SCRIPT+50, 0, 0, "Are you sure, that you want to go to Utgarde Pinnacle?", @CONDITIONID+58),
(@GOSSIP_MENU+3, 12, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0),
(@GOSSIP_MENU+4, 0, 2, "Black Temple", 1, 1, 0, 0, @GOSSIP_SCRIPT+51, 0, 0, "Are you sure, that you want to go to Black Temple?", @CONDITIONID+54),
(@GOSSIP_MENU+4, 1, 2, "Blackwing Lair", 1, 1, 0, 0, @GOSSIP_SCRIPT+52, 0, 0, "Are you sure, that you want to go to Blackwing Lair?", @CONDITIONID+46),
(@GOSSIP_MENU+4, 2, 2, "Hyjal Summit", 1, 1, 0, 0, @GOSSIP_SCRIPT+53, 0, 0, "Are you sure, that you want to go to Hyjal Summit?", @CONDITIONID+54),
(@GOSSIP_MENU+4, 3, 2, "Serpentshrine Cavern", 1, 1, 0, 0, @GOSSIP_SCRIPT+54, 0, 0, "Are you sure, that you want to go to Serpentshrine Cavern?", @CONDITIONID+54),
(@GOSSIP_MENU+4, 4, 2, "Trial of the Crusader", 1, 1, 0, 0, @GOSSIP_SCRIPT+55, 0, 0, "Are you sure, that you want to go to Trial of the Crusader?", 185),
(@GOSSIP_MENU+4, 5, 2, "Gruul's Lair", 1, 1, 0, 0, @GOSSIP_SCRIPT+56, 0, 0, "Are you sure, that you want to go to Gruul's Lair?", @CONDITIONID+54),
(@GOSSIP_MENU+4, 6, 2, "Magtheridon's Lair", 1, 1, 0, 0, @GOSSIP_SCRIPT+57, 0, 0, "Are you sure, that you want to go to Magtheridon's Lair?", @CONDITIONID+54),
(@GOSSIP_MENU+4, 7, 2, "Icecrown Citadel", 1, 1, 0, 0, @GOSSIP_SCRIPT+58, 0, 0, "Are you sure, that you want to go to Icecrown Citadel?", 185),
(@GOSSIP_MENU+4, 8, 2, "Karazhan", 1, 1, 0, 0, @GOSSIP_SCRIPT+59, 0, 0, "Are you sure, that you want to go to Karazhan?", @CONDITIONID+54),
(@GOSSIP_MENU+4, 9, 2, "Molten Core", 1, 1, 0, 0, @GOSSIP_SCRIPT+60, 0, 0, "Are you sure, that you want to go to Molten Core?", @CONDITIONID+46),
(@GOSSIP_MENU+4, 10, 2, "Naxxramas", 1, 1, 0, 0, @GOSSIP_SCRIPT+61, 0, 0, "Are you sure, that you want to go to Naxxramas?", 185),
(@GOSSIP_MENU+4, 11, 2, "Onyxia's Lair", 1, 1, 0, 0, @GOSSIP_SCRIPT+62, 0, 0, "Are you sure, that you want to go to Onyxia's Lair?", 185),
(@GOSSIP_MENU+4, 12, 2, "Ruins of Ahn'Qiraj", 1, 1, 0, 0, @GOSSIP_SCRIPT+63, 0, 0, "Are you sure, that you want to go to Ruins of Ahn'Qiraj?", @CONDITIONID+46),
(@GOSSIP_MENU+4, 13, 2, "Sunwell Plateau", 1, 1, 0, 0, @GOSSIP_SCRIPT+64, 0, 0, "Are you sure, that you want to go to Sunwell Plateau?", @CONDITIONID+54),
(@GOSSIP_MENU+4, 14, 2, "The Eye", 1, 1, 0, 0, @GOSSIP_SCRIPT+65, 0, 0, "Are you sure, that you want to go to The Eye?", @CONDITIONID+51),
(@GOSSIP_MENU+4, 15, 2, "Temple of Ahn'Qiraj", 1, 1, 0, 0, @GOSSIP_SCRIPT+66, 0, 0, "Are you sure, that you want to go to Temple of Ahn'Qiraj?", @CONDITIONID+46),
(@GOSSIP_MENU+4, 16, 2, "The Eye of Eternity", 1, 1, 0, 0, @GOSSIP_SCRIPT+67, 0, 0, "Are you sure, that you want to go to The Eye of Eternity?", 185),
(@GOSSIP_MENU+4, 17, 2, "The Obsidian Sanctum", 1, 1, 0, 0, @GOSSIP_SCRIPT+68, 0, 0, "Are you sure, that you want to go to Obsidian sanctum?", 185),
(@GOSSIP_MENU+4, 18, 2, "Ulduar", 1, 1, 0, 0, @GOSSIP_SCRIPT+69, 0, 0, "Are you sure, that you want to go to Ulduar?", 185),
(@GOSSIP_MENU+4, 19, 2, "Vault of Archavon", 1, 1, 0, 0, @GOSSIP_SCRIPT+70, 0, 0, "Are you sure, that you want to go to Vault of Archavon?", 185),
(@GOSSIP_MENU+4, 21, 2, "Zul'Gurub", 1, 1, 0, 0, @GOSSIP_SCRIPT+72, 0, 0, "Are you sure, that you want to go to Zul'Gurub?", @CONDITIONID+43),
(@GOSSIP_MENU+4, 22, 2, "Zul'Aman", 1, 1, 0, 0, @GOSSIP_SCRIPT+73, 0, 0, "Are you sure, that you want to go to Zul'Aman?", @CONDITIONID+54),
(@GOSSIP_MENU+4, 23, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0),
(@GOSSIP_MENU+5, 0, 2, "Elwynn Forest", 1, 1, 0, 0, @GOSSIP_SCRIPT+74, 0, 0, "Are you sure, that you want to go to Elwynn Forest?", 22),
(@GOSSIP_MENU+5, 1, 2, "Eversong Woods", 1, 1, 0, 0, @GOSSIP_SCRIPT+75, 0, 0, "Are you sure, that you want to go to Eversong Woods?", 21),
(@GOSSIP_MENU+5, 2, 2, "Dun Morogh", 1, 1, 0, 0, @GOSSIP_SCRIPT+76, 0, 0, "Are you sure, that you want to go to Dun Morogh?", 22),
(@GOSSIP_MENU+5, 3, 2, "Tirisfal Glades", 1, 1, 0, 0, @GOSSIP_SCRIPT+77, 0, 0, "Are you sure, that you want to go to Tirisfal Glades?", 21),
(@GOSSIP_MENU+5, 4, 2, "Ghostlands", 1, 1, 0, 0, @GOSSIP_SCRIPT+78, 0, 0, "Are you sure, that you want to go to Ghostlands?", @CONDITIONID+82),
(@GOSSIP_MENU+5, 5, 2, "Loch modan", 1, 1, 0, 0, @GOSSIP_SCRIPT+79, 0, 0, "Are you sure, that you want to go to Loch modan?", @CONDITIONID+83),
(@GOSSIP_MENU+5, 6, 2, "Silverpine Forest", 1, 1, 0, 0, @GOSSIP_SCRIPT+80, 0, 0, "Are you sure, that you want to go to Silverpine Forest?", @CONDITIONID+82),
(@GOSSIP_MENU+5, 7, 2, "Westfall", 1, 1, 0, 0, @GOSSIP_SCRIPT+81, 0, 0, "Are you sure, that you want to go to Westfall?", @CONDITIONID+83),
(@GOSSIP_MENU+5, 8, 2, "Redridge mountains", 1, 1, 0, 0, @GOSSIP_SCRIPT+82, 0, 0, "Are you sure, that you want to go to Redridge mountains?", @CONDITIONID+85),
(@GOSSIP_MENU+5, 9, 2, "Duskwood", 1, 1, 0, 0, @GOSSIP_SCRIPT+83, 0, 0, "Are you sure, that you want to go to Duskwood?", @CONDITIONID+89),
(@GOSSIP_MENU+5, 10, 2, "Hillsbrad Foothills", 1, 1, 0, 0, @GOSSIP_SCRIPT+84, 0, 0, "Are you sure, that you want to go to Hillsbrad Foothills?", @CONDITIONID+24),
(@GOSSIP_MENU+5, 11, 2, "Wetlands", 1, 1, 0, 0, @GOSSIP_SCRIPT+85, 0, 0, "Are you sure, that you want to go to Wetlands?", @CONDITIONID+90),
(@GOSSIP_MENU+5, 12, 2, "Alterac Mountains", 1, 1, 0, 0, @GOSSIP_SCRIPT+86, 0, 0, "Are you sure, that you want to go to Alterac Mountains?", @CONDITIONID+29),
(@GOSSIP_MENU+5, 13, 2, "Arathi Highlands", 1, 1, 0, 0, @GOSSIP_SCRIPT+87, 0, 0, "Are you sure, that you want to go to Arathi Highlands?", @CONDITIONID+29),
(@GOSSIP_MENU+5, 14, 2, "Stranglethorn Vale", 1, 1, 0, 0, @GOSSIP_SCRIPT+88, 0, 0, "Are you sure, that you want to go to Stranglethorn Vale?", @CONDITIONID+29),
(@GOSSIP_MENU+5, 15, 2, "Badlands", 1, 1, 0, 0, @GOSSIP_SCRIPT+89, 0, 0, "Are you sure, that you want to go to Badlands?", @CONDITIONID+32),
(@GOSSIP_MENU+5, 16, 2, "Swamp of Sorrows", 1, 1, 0, 0, @GOSSIP_SCRIPT+90, 0, 0, "Are you sure, that you want to go to Swamp of Sorrows?", @CONDITIONID+32),
(@GOSSIP_MENU+5, 17, 2, "The Hinterlands", 1, 1, 0, 0, @GOSSIP_SCRIPT+91, 0, 0, "Are you sure, that you want to go to The Hinterlands?", 191),
(@GOSSIP_MENU+5, 18, 2, "Searing Gorge", 1, 1, 0, 0, @GOSSIP_SCRIPT+92, 0, 0, "Are you sure, that you want to go to Searing Gorge?", @CONDITIONID+35),
(@GOSSIP_MENU+5, 19, 2, "The Blasted Lands", 1, 1, 0, 0, @GOSSIP_SCRIPT+93, 0, 0, "Are you sure, that you want to go to The Blasted Lands?", @CONDITIONID+36),
(@GOSSIP_MENU+5, 20, 2, "Burning Steppes", 1, 1, 0, 0, @GOSSIP_SCRIPT+94, 0, 0, "Are you sure, that you want to go to Burning Steppes?", @CONDITIONID+39),
(@GOSSIP_MENU+5, 21, 2, "Western Plaguelands", 1, 1, 0, 0, @GOSSIP_SCRIPT+95, 0, 0, "Are you sure, that you want to go to Western Plaguelands?", @CONDITIONID+40),
(@GOSSIP_MENU+5, 22, 2, "Eastern Plaguelands", 1, 1, 0, 0, @GOSSIP_SCRIPT+96, 0, 0, "Are you sure, that you want to go to Eastern Plaguelands?", @CONDITIONID+41),
(@GOSSIP_MENU+5, 23, 2, "Isle of Quel'Danas", 1, 1, 0, 0, @GOSSIP_SCRIPT+97, 0, 0, "Are you sure, that you want to go to Isle of Quel'Danas?", @CONDITIONID+54),
(@GOSSIP_MENU+5, 24, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0),
(@GOSSIP_MENU+6, 0, 2, "Azuremyst Isle", 1, 1, 0, 0, @GOSSIP_SCRIPT+98, 0, 0, "Are you sure, that you want to go to Azuremyst Isle?", 22),
(@GOSSIP_MENU+6, 1, 2, "Teldrassil", 1, 1, 0, 0, @GOSSIP_SCRIPT+99, 0, 0, "Are you sure, that you want to go to Teldrassil?", 22),
(@GOSSIP_MENU+6, 2, 2, "Durotar", 1, 1, 0, 0, @GOSSIP_SCRIPT+100, 0, 0, "Are you sure, that you want to go to Durotar?", 21),
(@GOSSIP_MENU+6, 3, 2, "Mulgore", 1, 1, 0, 0, @GOSSIP_SCRIPT+101, 0, 0, "Are you sure, that you want to go to Mulgore?", 21),
(@GOSSIP_MENU+6, 4, 2, "Bloodmyst Isle", 1, 1, 0, 0, @GOSSIP_SCRIPT+102, 0, 0, "Are you sure, that you want to go to Bloodmyst Isle?", @CONDITIONID+85),
(@GOSSIP_MENU+6, 5, 2, "Darkshore", 1, 1, 0, 0, @GOSSIP_SCRIPT+103, 0, 0, "Are you sure, that you want to go to Darkshore?", @CONDITIONID+83),
(@GOSSIP_MENU+6, 6, 2, "The Barrens", 1, 1, 0, 0, @GOSSIP_SCRIPT+104, 0, 0, "Are you sure, that you want to go to The Barrens?", @CONDITIONID+82),
(@GOSSIP_MENU+6, 7, 2, "Stonetalon Mountains", 1, 1, 0, 0, @GOSSIP_SCRIPT+105, 0, 0, "Are you sure, that you want to go to Stonetalon Mountains?", @CONDITIONID+21),
(@GOSSIP_MENU+6, 8, 2, "Ashenvale Forest", 1, 1, 0, 0, @GOSSIP_SCRIPT+106, 0, 0, "Are you sure, that you want to go to Ashenvale Forest?", @CONDITIONID+23),
(@GOSSIP_MENU+6, 9, 2, "Thousand Needles", 1, 1, 0, 0, @GOSSIP_SCRIPT+107, 0, 0, "Are you sure, that you want to go to Thousand Needles?", @CONDITIONID+94),
(@GOSSIP_MENU+6, 10, 2, "Desolace", 1, 1, 0, 0, @GOSSIP_SCRIPT+108, 0, 0, "Are you sure, that you want to go to Desolace?", @CONDITIONID+29),
(@GOSSIP_MENU+6, 11, 2, "Dustwallow Marsh", 1, 1, 0, 0, @GOSSIP_SCRIPT+109, 0, 0, "Are you sure, that you want to go to Dustwallow Marsh?", @CONDITIONID+32),
(@GOSSIP_MENU+6, 12, 2, "Feralas", 1, 1, 0, 0, @GOSSIP_SCRIPT+110, 0, 0, "Are you sure, that you want to go to Feralas?", 191),
(@GOSSIP_MENU+6, 13, 2, "Tanaris Desert", 1, 1, 0, 0, @GOSSIP_SCRIPT+111, 0, 0, "Are you sure, that you want to go to Tanaris Desert?", 191),
(@GOSSIP_MENU+6, 14, 2, "Azshara", 1, 1, 0, 0, @GOSSIP_SCRIPT+112, 0, 0, "Are you sure, that you want to go to Azshara?", @CONDITIONID+36),
(@GOSSIP_MENU+6, 15, 2, "Felwood", 1, 1, 0, 0, @GOSSIP_SCRIPT+113, 0, 0, "Are you sure, that you want to go to Felwood?", @CONDITIONID+38),
(@GOSSIP_MENU+6, 16, 2, "Un'Goro Crater", 1, 1, 0, 0, @GOSSIP_SCRIPT+114, 0, 0, "Are you sure, that you want to go to Un'Goro Crater?", @CONDITIONID+38),
(@GOSSIP_MENU+6, 17, 2, "Silithus", 1, 1, 0, 0, @GOSSIP_SCRIPT+115, 0, 0, "Are you sure, that you want to go to Silithus?", @CONDITIONID+42),
(@GOSSIP_MENU+6, 18, 2, "Winterspring", 1, 1, 0, 0, @GOSSIP_SCRIPT+116, 0, 0, "Are you sure, that you want to go to Winterspring?", @CONDITIONID+42),
(@GOSSIP_MENU+6, 19, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0),
(@GOSSIP_MENU+7, 0, 2, "Hellfire Peninsula", 1, 1, 0, 0, @GOSSIP_SCRIPT+117, 0, 0, "Are you sure, that you want to go to Hellfire Peninsula?", @CONDITIONID+44),
(@GOSSIP_MENU+7, 1, 2, "Zangarmarsh", 1, 1, 0, 0, @GOSSIP_SCRIPT+118, 0, 0, "Are you sure, that you want to go to Zangarmarsh?", @CONDITIONID+46),
(@GOSSIP_MENU+7, 2, 2, "Terokkar Forest", 1, 1, 0, 0, @GOSSIP_SCRIPT+119, 0, 0, "Are you sure, that you want to go to Terokkar Forest?", @CONDITIONID+47),
(@GOSSIP_MENU+7, 3, 2, "Nagrand", 1, 1, 0, 0, @GOSSIP_SCRIPT+120, 0, 0, "Are you sure, that you want to go to Nagrand?", @CONDITIONID+48),
(@GOSSIP_MENU+7, 4, 2, "Blade's Edge Mountains", 1, 1, 0, 0, @GOSSIP_SCRIPT+121, 0, 0, "Are you sure, that you want to go to Blade's Edge Mountains?", 189),
(@GOSSIP_MENU+7, 5, 2, "Netherstorm", 1, 1, 0, 0, @GOSSIP_SCRIPT+122, 0, 0, "Are you sure, that you want to go to Netherstorm?", @CONDITIONID+51),
(@GOSSIP_MENU+7, 6, 2, "Shadowmoon Valley", 1, 1, 0, 0, @GOSSIP_SCRIPT+123, 0, 0, "Are you sure, that you want to go to Shadowmoon Valley?", @CONDITIONID+51),
(@GOSSIP_MENU+7, 7, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0),
(@GOSSIP_MENU+8, 0, 2, "Borean Tundra", 1, 1, 0, 0, @GOSSIP_SCRIPT+124, 0, 0, "Are you sure, that you want to go to Borean Tundra?", @CONDITIONID+52),
(@GOSSIP_MENU+8, 1, 2, "Howling Fjord", 1, 1, 0, 0, @GOSSIP_SCRIPT+125, 0, 0, "Are you sure, that you want to go to Howling Fjord?", @CONDITIONID+52),
(@GOSSIP_MENU+8, 2, 2, "Dragonblight", 1, 1, 0, 0, @GOSSIP_SCRIPT+126, 0, 0, "Are you sure, that you want to go to Dragonblight?", @CONDITIONID+55),
(@GOSSIP_MENU+8, 3, 2, "Grizzly Hills", 1, 1, 0, 0, @GOSSIP_SCRIPT+127, 0, 0, "Are you sure, that you want to go to Grizzly Hills?", @CONDITIONID+56),
(@GOSSIP_MENU+8, 4, 2, "Zul'Drak", 1, 1, 0, 0, @GOSSIP_SCRIPT+128, 0, 0, "Are you sure, that you want to go to Zul'Drak?", @CONDITIONID+57),
(@GOSSIP_MENU+8, 5, 2, "Sholazar Basin", 1, 1, 0, 0, @GOSSIP_SCRIPT+129, 0, 0, "Are you sure, that you want to go to Sholazar Basin?", @CONDITIONID+59),
(@GOSSIP_MENU+8, 6, 2, "Crystalsong Forest", 1, 1, 0, 0, @GOSSIP_SCRIPT+130, 0, 0, "Are you sure, that you want to go to Crystalsong Forest?", @CONDITIONID+60),
(@GOSSIP_MENU+8, 7, 2, "Storm Peaks", 1, 1, 0, 0, @GOSSIP_SCRIPT+132, 0, 0, "Are you sure, that you want to go to Storm Peaks?", @CONDITIONID+60),
(@GOSSIP_MENU+8, 8, 2, "Icecrown", 1, 1, 0, 0, @GOSSIP_SCRIPT+133, 0, 0, "Are you sure, that you want to go to Icecrown?", @CONDITIONID+60),
(@GOSSIP_MENU+8, 9, 2, "Wintergrasp", 1, 1, 0, 0, @GOSSIP_SCRIPT+134, 0, 0, "Are you sure, that you want to go to Wintergrasp?", @CONDITIONID+60),
(@GOSSIP_MENU+8, 10, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0);

INSERT INTO dbscripts_on_gossip (id, delay, command, datalong, x, y, z, o, comments) VALUES
(@GOSSIP_SCRIPT, 0, 6, 0, -8842.09, 626.358, 94.0867, 3.61363, ""),
(@GOSSIP_SCRIPT+1, 0, 6, 1, 1601.08, -4378.69, 9.9846, 2.14362, ""),
(@GOSSIP_SCRIPT+2, 0, 6, 0, -14281.9, 552.564, 8.90422, 0.860144, ""),
(@GOSSIP_SCRIPT+3, 0, 6, 530, -1887.62, 5359.09, -12.4279, 4.40435, ""),

(@GOSSIP_SCRIPT+5, 0, 6, 571, 5809.55, 503.975, 657.526, 2.38338, ""),
(@GOSSIP_SCRIPT+6, 0, 6, 0, -13181.8, 339.356, 42.9805, 1.18013, ""),
(@GOSSIP_SCRIPT+8, 0, 6, 1, 9869.91, 2493.58, 1315.88, 2.78897, ""),
(@GOSSIP_SCRIPT+9, 0, 6, 0, -4900.47, -962.585, 501.455, 5.40538, ""),
(@GOSSIP_SCRIPT+10, 0, 6, 530, -3864.92, -11643.7, -137.644, 5.50862, ""),
(@GOSSIP_SCRIPT+11, 0, 6, 1, -1274.45, 71.8601, 128.159, 2.80623, ""),
(@GOSSIP_SCRIPT+12, 0, 6, 0, 1633.75, 240.167, -43.1034, 6.26128, ""),
(@GOSSIP_SCRIPT+13, 0, 6, 530, 9738.28, -7454.19, 13.5605, 0.043914, ""),
(@GOSSIP_SCRIPT+14, 0, 6, 0, -5163.54, 925.423, 257.181, 1.57423, ""),
(@GOSSIP_SCRIPT+15, 0, 6, 0, -11209.6, 1666.54, 24.6974, 1.42053, ""),
(@GOSSIP_SCRIPT+16, 0, 6, 0, -8799.15, 832.718, 97.6348, 6.04085, ""),
(@GOSSIP_SCRIPT+17, 0, 6, 1, 1811.78, -4410.5, -18.4704, 5.20165, ""),
(@GOSSIP_SCRIPT+18, 0, 6, 1, -4657.3, -2519.35, 81.0529, 4.54808, ""),
(@GOSSIP_SCRIPT+19, 0, 6, 1, -4470.28, -1677.77, 81.3925, 1.16302, ""),
(@GOSSIP_SCRIPT+20, 0, 6, 0, 2873.15, -764.523, 160.332, 5.10447, ""),
(@GOSSIP_SCRIPT+21, 0, 6, 0, -234.675, 1561.63, 76.8921, 1.24031, ""),
(@GOSSIP_SCRIPT+22, 0, 6, 1, -731.607, -2218.39, 17.0281, 2.78486, ""),
(@GOSSIP_SCRIPT+23, 0, 6, 1, 4249.99, 740.102, -25.671, 1.34062, ""),
(@GOSSIP_SCRIPT+24, 0, 6, 0, -7179.34, -921.212, 165.821, 5.09599, ""),
(@GOSSIP_SCRIPT+25, 0, 6, 0, -7527.05, -1226.77, 285.732, 5.29626, ""),
(@GOSSIP_SCRIPT+26, 0, 6, 1, -3520.14, 1119.38, 161.025, 4.70454, ""),
(@GOSSIP_SCRIPT+27, 0, 6, 1, -1421.42, 2907.83, 137.415, 1.70718, ""),
(@GOSSIP_SCRIPT+28, 0, 6, 0, 1269.64, -2556.21, 93.6088, 0.620623, ""),
(@GOSSIP_SCRIPT+29, 0, 6, 0, 3352.92, -3379.03, 144.782, 6.25978, ""),
(@GOSSIP_SCRIPT+30, 0, 6, 0, -10177.9, -3994.9, -111.239, 6.01885, ""),
(@GOSSIP_SCRIPT+31, 0, 6, 0, -6071.37, -2955.16, 209.782, 0.015708, ""),
(@GOSSIP_SCRIPT+32, 0, 6, 1, -6801.19, -2893.02, 9.00388, 0.158639, ""),
(@GOSSIP_SCRIPT+33, 0, 6, 530, -3324.49, 4943.45, -101.239, 4.63901, ""),
(@GOSSIP_SCRIPT+34, 0, 6, 1, -8369.65, -4253.11, -204.272, -2.70526, ""),
(@GOSSIP_SCRIPT+35, 0, 6, 530, 738.865, 6865.77, -69.4659, 6.27655, ""),
(@GOSSIP_SCRIPT+36, 0, 6, 530, -347.29, 3089.82, 21.394, 5.68114, ""),
(@GOSSIP_SCRIPT+37, 0, 6, 530, 12884.6, -7317.69, 65.5023, 4.799, ""),
(@GOSSIP_SCRIPT+38, 0, 6, 530, 3100.48, 1536.49, 190.3, 4.62226, ""),
(@GOSSIP_SCRIPT+39, 0, 6, 571, 3707.86, 2150.23, 36.76, 3.22, ""),
(@GOSSIP_SCRIPT+40, 0, 6, 1, -8756.39, -4440.68, -199.489, 4.66289, ""),
(@GOSSIP_SCRIPT+41, 0, 6, 571, 8590.95, 791.792, 558.235, 3.13127, ""),
(@GOSSIP_SCRIPT+42, 0, 6, 571, 4765.59, -2038.24, 229.363, 0.887627, ""),
(@GOSSIP_SCRIPT+43, 0, 6, 571, 6722.44, -4640.67, 450.632, 3.91123, ""),
(@GOSSIP_SCRIPT+44, 0, 6, 571, 5643.16, 2028.81, 798.274, 4.60242, ""),
(@GOSSIP_SCRIPT+45, 0, 6, 571, 3782.89, 6965.23, 105.088, 6.14194, ""),
(@GOSSIP_SCRIPT+46, 0, 6, 571, 5693.08, 502.588, 652.672, 4.0229, ""),
(@GOSSIP_SCRIPT+47, 0, 6, 571, 9136.52, -1311.81, 1066.29, 5.19113, ""),
(@GOSSIP_SCRIPT+48, 0, 6, 571, 8922.12, -1009.16, 1039.56, 1.57044, ""),
(@GOSSIP_SCRIPT+49, 0, 6, 571, 1203.41, -4868.59, 41.2486, 0.283237, ""),
(@GOSSIP_SCRIPT+50, 0, 6, 571, 1267.24, -4857.3, 215.764, 3.22768, ""),
(@GOSSIP_SCRIPT+51, 0, 6, 530, -3649.92, 317.469, 35.2827, 2.94285, ""),
(@GOSSIP_SCRIPT+52, 0, 6, 229, 152.451, -474.881, 116.84, 0.001073, ""),
(@GOSSIP_SCRIPT+53, 0, 6, 1, -8177.89, -4181.23, -167.552, 0.913338, ""),
(@GOSSIP_SCRIPT+54, 0, 6, 530, 797.855, 6865.77, -65.4165, 0.005938, ""),
(@GOSSIP_SCRIPT+55, 0, 6, 571, 8515.61, 714.153, 558.248, 1.57753, ""),
(@GOSSIP_SCRIPT+56, 0, 6, 530, 3530.06, 5104.08, 3.50861, 5.51117, ""),
(@GOSSIP_SCRIPT+57, 0, 6, 530, -336.411, 3130.46, -102.928, 5.20322, ""),
(@GOSSIP_SCRIPT+58, 0, 6, 571, 5855.22, 2102.03, 635.991, 3.57899, ""),
(@GOSSIP_SCRIPT+59, 0, 6, 0, -11118.9, -2010.33, 47.0819, 0.649895, ""),
(@GOSSIP_SCRIPT+60, 0, 6, 230, 1126.64, -459.94, -102.535, 3.46095, ""),
(@GOSSIP_SCRIPT+61, 0, 6, 571, 3668.72, -1262.46, 243.622, 4.785, ""),
(@GOSSIP_SCRIPT+62, 0, 6, 1, -4708.27, -3727.64, 54.5589, 3.72786, ""),
(@GOSSIP_SCRIPT+63, 0, 6, 1, -8409.82, 1499.06, 27.7179, 2.51868, ""),
(@GOSSIP_SCRIPT+64, 0, 6, 530, 12574.1, -6774.81, 15.0904, 3.13788, ""),
(@GOSSIP_SCRIPT+65, 0, 6, 530, 3088.49, 1381.57, 184.863, 4.61973, ""),
(@GOSSIP_SCRIPT+66, 0, 6, 1, -8240.09, 1991.32, 129.072, 0.941603, ""),
(@GOSSIP_SCRIPT+67, 0, 6, 571, 3784.17, 7028.84, 161.258, 5.79993, ""),
(@GOSSIP_SCRIPT+68, 0, 6, 571, 3472.43, 264.923, -120.146, 3.27923, ""),
(@GOSSIP_SCRIPT+69, 0, 6, 571, 9222.88, -1113.59, 1216.12, 6.27549, ""),
(@GOSSIP_SCRIPT+70, 0, 6, 571, 5453.72, 2840.79, 421.28, 0, ""),
(@GOSSIP_SCRIPT+72, 0, 6, 0, -11916.7, -1215.72, 92.289, 4.72454, ""),
(@GOSSIP_SCRIPT+73, 0, 6, 530, 6851.78, -7972.57, 179.242, 4.64691, ""),
(@GOSSIP_SCRIPT+74, 0, 6, 0, -9449.06, 64.8392, 56.3581, 3.07047, ""),
(@GOSSIP_SCRIPT+75, 0, 6, 530, 9024.37, -6682.55, 16.8973, 3.14131, ""),
(@GOSSIP_SCRIPT+76, 0, 6, 0, -5603.76, -482.704, 396.98, 5.23499, ""),
(@GOSSIP_SCRIPT+77, 0, 6, 0, 2274.95, 323.918, 34.1137, 4.24367, ""),
(@GOSSIP_SCRIPT+78, 0, 6, 530, 7595.73, -6819.6, 84.3718, 2.56561, ""),
(@GOSSIP_SCRIPT+79, 0, 6, 0, -5405.85, -2894.15, 341.972, 5.48238, ""),
(@GOSSIP_SCRIPT+80, 0, 6, 0, 505.126, 1504.63, 124.808, 1.77987, ""),
(@GOSSIP_SCRIPT+81, 0, 6, 0, -10684.9, 1033.63, 32.5389, 6.07384, ""),
(@GOSSIP_SCRIPT+82, 0, 6, 0, -9447.8, -2270.85, 71.8224, 0.283853, ""),
(@GOSSIP_SCRIPT+83, 0, 6, 0, -10531.7, -1281.91, 38.8647, 1.56959, ""),
(@GOSSIP_SCRIPT+84, 0, 6, 0, -385.805, -787.954, 54.6655, 1.03926, ""),
(@GOSSIP_SCRIPT+85, 0, 6, 0, -3517.75, -913.401, 8.86625, 2.60705, ""),
(@GOSSIP_SCRIPT+86, 0, 6, 0, 275.049, -652.044, 130.296, 0.502032, ""),
(@GOSSIP_SCRIPT+87, 0, 6, 0, -1581.45, -2704.06, 35.4168, 0.490373, ""),
(@GOSSIP_SCRIPT+88, 0, 6, 0, -11921.7, -59.544, 39.7262, 3.73574, ""),
(@GOSSIP_SCRIPT+89, 0, 6, 0, -6782.56, -3128.14, 240.48, 5.65912, ""),
(@GOSSIP_SCRIPT+90, 0, 6, 0, -10368.6, -2731.3, 21.6537, 5.29238, ""),
(@GOSSIP_SCRIPT+91, 0, 6, 0, 112.406, -3929.74, 136.358, 0.981903, ""),
(@GOSSIP_SCRIPT+92, 0, 6, 0, -6686.33, -1198.55, 240.027, 0.916887, ""),
(@GOSSIP_SCRIPT+93, 0, 6, 0, -11184.7, -3019.31, 7.29238, 3.20542, ""),
(@GOSSIP_SCRIPT+94, 0, 6, 0, -7979.78, -2105.72, 127.919, 5.10148, ""),
(@GOSSIP_SCRIPT+95, 0, 6, 0, 1743.69, -1723.86, 59.6648, 5.23722, ""),
(@GOSSIP_SCRIPT+96, 0, 6, 0, 2280.64, -5275.05, 82.0166, 4.7479, ""),
(@GOSSIP_SCRIPT+97, 0, 6, 530, 12806.5, -6911.11, 41.1156, 2.22935, ""),
(@GOSSIP_SCRIPT+98, 0, 6, 530, -4192.62, -12576.7, 36.7598, 1.62813, ""),
(@GOSSIP_SCRIPT+99, 0, 6, 1, 9889.03, 915.869, 1307.43, 1.9336, ""),
(@GOSSIP_SCRIPT+100, 0, 6, 1, 228.978, -4741.87, 10.1027, 0.416883, ""),
(@GOSSIP_SCRIPT+101, 0, 6, 1, -2473.87, -501.225, -9.42465, 0.6525, ""),
(@GOSSIP_SCRIPT+102, 0, 6, 530, -2095.7, -11841.1, 51.1557, 6.19288, ""),
(@GOSSIP_SCRIPT+103, 0, 6, 1, 6463.25, 683.986, 8.92792, 4.33534, ""),
(@GOSSIP_SCRIPT+104, 0, 6, 1, -575.772, -2652.45, 95.6384, 0.006469, ""),
(@GOSSIP_SCRIPT+105, 0, 6, 1, 1574.89, 1031.57, 137.442, 3.8013, ""),
(@GOSSIP_SCRIPT+106, 0, 6, 1, 1919.77, -2169.68, 94.6729, 6.14177, ""),
(@GOSSIP_SCRIPT+107, 0, 6, 1, -5375.53, -2509.2, -40.432, 2.41885, ""),
(@GOSSIP_SCRIPT+108, 0, 6, 1, -656.056, 1510.12, 88.3746, 3.29553, ""),
(@GOSSIP_SCRIPT+109, 0, 6, 1, -3350.12, -3064.85, 33.0364, 5.12666, ""),
(@GOSSIP_SCRIPT+110, 0, 6, 1, -4808.31, 1040.51, 103.769, 2.90655, ""),
(@GOSSIP_SCRIPT+111, 0, 6, 1, -6940.91, -3725.7, 48.9381, 3.11174, ""),
(@GOSSIP_SCRIPT+112, 0, 6, 1, 3117.12, -4387.97, 91.9059, 5.49897, ""),
(@GOSSIP_SCRIPT+113, 0, 6, 1, 3898.8, -1283.33, 220.519, 6.24307, ""),
(@GOSSIP_SCRIPT+114, 0, 6, 1, -6291.55, -1158.62, -258.138, 0.457099, ""),
(@GOSSIP_SCRIPT+115, 0, 6, 1, -6815.25, 730.015, 40.9483, 2.39066, ""),
(@GOSSIP_SCRIPT+116, 0, 6, 1, 6658.57, -4553.48, 718.019, 5.18088, ""),
(@GOSSIP_SCRIPT+117, 0, 6, 530, -207.335, 2035.92, 96.464, 1.59676, ""),
(@GOSSIP_SCRIPT+118, 0, 6, 530, -220.297, 5378.58, 23.3223, 1.61718, ""),
(@GOSSIP_SCRIPT+119, 0, 6, 530, -2266.23, 4244.73, 1.47728, 3.68426, ""),
(@GOSSIP_SCRIPT+120, 0, 6, 530, -1610.85, 7733.62, -17.2773, 1.33522, ""),
(@GOSSIP_SCRIPT+121, 0, 6, 530, 2029.75, 6232.07, 133.495, 1.30395, ""),
(@GOSSIP_SCRIPT+122, 0, 6, 530, 3271.2, 3811.61, 143.153, 3.44101, ""),
(@GOSSIP_SCRIPT+123, 0, 6, 530, -3681.01, 2350.76, 76.587, 4.25995, ""),
(@GOSSIP_SCRIPT+124, 0, 6, 571, 2954.24, 5379.13, 60.4538, 2.55544, ""),
(@GOSSIP_SCRIPT+125, 0, 6, 571, 682.848, -3978.3, 230.161, 1.54207, ""),
(@GOSSIP_SCRIPT+126, 0, 6, 571, 2678.17, 891.826, 4.37494, 0.101121, ""),
(@GOSSIP_SCRIPT+127, 0, 6, 571, 4017.35, -3403.85, 290, 5.35431, ""),
(@GOSSIP_SCRIPT+128, 0, 6, 571, 5560.23, -3211.66, 371.709, 5.55055, ""),
(@GOSSIP_SCRIPT+129, 0, 6, 571, 5614.67, 5818.86, -69.722, 3.60807, ""),
(@GOSSIP_SCRIPT+130, 0, 6, 571, 5411.17, -966.37, 167.082, 1.57167, ""),
(@GOSSIP_SCRIPT+132, 0, 6, 571, 6120.46, -1013.89, 408.39, 5.12322, ""),
(@GOSSIP_SCRIPT+133, 0, 6, 571, 8323.28, 2763.5, 655.093, 2.87223, ""),
(@GOSSIP_SCRIPT+134, 0, 6, 571, 4522.23, 2828.01, 389.975, 0.215009, "");

ALTER TABLE creature AUTO_INCREMENT = 200000;
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth, curmana) VALUES
(@ENTRY, 0, 1, 1, 0, -13180.5, 342.503, 43.1936, 4.32977, 25, 0, 13700, 6540), 
(@ENTRY, 530, 1, 1, 0, -3862.69, -11645.8, -137.629, 2.38273, 25, 0, 13700, 6540), 
(@ENTRY, 0, 1, 1, 0, -4898.37, -965.118, 501.447, 2.25986, 25, 0, 13700, 6540), 
(@ENTRY, 0, 1, 1, 0, -8845.09, 624.828, 94.2999, 0.44062, 25, 0, 13700, 6540), 
(@ENTRY, 1, 1, 1, 0, 1599.25, -4375.85, 10.0872, 5.23641, 25, 0, 13700, 6540), 
(@ENTRY, 1, 1, 1, 0, -1277.65, 72.9751, 128.742, 5.95567, 25, 0, 13700, 6540), 
(@ENTRY, 0, 1, 1, 0, 1637.21, 240.132, -43.1034, 3.13147, 25, 0, 13700, 6540), 
(@ENTRY, 530, 1, 1, 0, 9741.67, -7454.19, 13.5572, 3.14231, 25, 0, 13700, 6540), 
(@ENTRY, 571, 1, 1, 0, 5807.06, 506.244, 657.576, 5.54461, 25, 0, 13700, 6540), 
(@ENTRY, 1, 1, 1, 0, 9866.83, 2494.66, 1315.88, 5.9462, 25, 0, 13700, 6540), 
(@ENTRY, 0, 1, 1, 0, -14279.8, 555.014, 8.90011, 3.97606, 25, 0, 13700, 6540), 
(@ENTRY, 530, 1, 1, 0, -1888.65, 5355.88, -12.4279, 1.25883, 25, 0, 13700, 6540);

ALTER TABLE gameobject AUTO_INCREMENT = 200000;
INSERT INTO gameobject (id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation2, rotation3, spawntimesecs, state) VALUES
(@RUNE, 1, 1, 1, 1601.08, -4378.69, 9.9846, 2.14362, 0.878068, 0.478536, 25, 1), 
(@RUNE, 0, 1, 1, -14281.9, 552.564, 8.90382, 0.860144, 0.416936, 0.908936, 25, 1), 
(@RUNE, 0, 1, 1, -8842.09, 626.358, 94.0868, 3.61363, 0.972276, -0.233836, 25, 1), 
(@RUNE, 0, 1, 1, -4900.47, -962.585, 501.455, 5.40538, 0.424947, -0.905218, 25, 1), 
(@RUNE, 1, 1, 1, 9869.91, 2493.58, 1315.88, 5.9462, 0.167696, -0.985839, 25, 1), 
(@RUNE, 530, 1, 1, -3864.92, -11643.7, -137.644, 2.38273, 0.928875, 0.370392, 25, 1), 
(@RUNE, 530, 1, 1, -1887.62, 5359.09, -12.4279, 4.40435, 0.758205, 0.652017, 25, 1), 
(@RUNE, 571, 1, 1, 5809.55, 503.975, 657.526, 5.54461, 0.360952, -0.932584, 25, 1), 
(@RUNE, 530, 1, 1, 9738.28, -7454.19, 13.5605, 3.14231, 1, -0.000358625, 25, 1), 
(@RUNE, 0, 1, 1, 1633.75, 240.167, -43.1034, 3.13147, 0.999987, 0.00506132, 25, 1), 
(@RUNE, 0, 1, 1, -13181.8, 339.356, 42.9805, 1.18013, 0.556415, 0.830904, 25, 1), 
(@RUNE, 1, 1, 1, -1274.45, 71.8601, 128.159, 2.80623, 0.985974, 0.166898, 25, 1);

/*
MaNGOS Portal Master
By Rochet2
Downloaded from http://rochet2.github.io/
Bugs and contact with E-mail: Rochet2@post.com
*/
