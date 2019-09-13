--
--
--	UTF-8 file
--

--	We are using this as the base list of NPC names, so we do not look at the locale
--	to determine whether we should abandon further processing.

local G = Grail.npc.name
local _, release, _, interface = GetBuildInfo()
release = tonumber(release)
interface = tonumber(interface)

if release >= 0 then
G[0]='Self'
G[1]=ADVENTURE_JOURNAL
G[500022]='Candy Bucket'
G[500024]="Anson's Crate"
G[500025]="Edgar's Crate"
G[500032]='Image of Nozdormu'
G[562180]='Klaxxi Warrior'
G[562295]='Omnia Mage'
G[562378]='Omnia Priest'
G[563195]='Blackguard Brewmaster'
G[563196]='Blackguard Battlemaster'
G[563197]='Blackguard Stalwart'
G[563622]='Wu Kao Rogue'
G[563623]='Wu Kao Assassin'
G[563624]='Wu Kao Hawkmaster'
G[565558]='Huojin Monk'
G[600000]='Moss-Covered Chest'
G[600001]='Sturdy Chest'
G[600002]='Smoldering Chest'
G[1000033]='Locked Chest'
G[1000034]='Old Jug'
G[1000035]="Captain's Footlocker"
G[1000036]='Broken Barrel'
G[1000055]='A half-eaten body'
G[1000056]="Rolf's corpse"
G[1000061]='A Weathered Grave'
G[1000068]='Wanted Poster'
G[1000256]='Wanted!'
G[1000259]='Half-buried Barrel'
G[1000261]='Damaged Crate'
G[1002059]='A Dwarven Corpse'
G[1002076]='Bubbling Cauldron'
G[1002083]='Bloodsail Correspondence'
G[1002688]='Keystone'
G[1002701]='Iridescent Shards'
G[1002702]='Stone of Inner Binding'
G[1002713]='Wanted Board'
G[1002908]='Sealed Supply Crate'
G[1003972]='WANTED'
G[1004141]='Control Console'
G[1006751]='Strange Fruited Plant'
G[1006752]='Strange Fronded Plant'
G[1007510]='Sprouted Frond'
G[1007923]="Denalan's Planter"
G[1020985]='Loose Dirt'
G[1020992]='Black Shield'
G[1021042]='Theramore Guard Badge'
G[1024776]="Yuriv's Tombstone"
G[1035251]="Karnitol's Chest"
G[1035591]='Fishing Bobber'
G[1112948]="Intrepid's Locked Strongbox"
G[1131474]='The Discs of Norgannon'
G[1138492]='Shards of Myzrael'
G[1142151]='Sealed Barrel'
G[1142195]='Woodpaw Battle Map'
G[1142487]='The Sparklematic 5200'
G[1151286]='Kaldorei Tome of Summoning'
G[1152097]="Belnistrasz's Brazier"
G[1161521]='Research Equipment'
G[1161526]='Crate of Foodstuffs'
G[1164869]='Spectral Chalice'
G[1164955]='Northern Crystal Pylon'
G[1164956]='Western Crystal Pylon'
G[1164957]='Eastern Crystal Pylon'
G[1176091]='Deadwood Cauldron'
G[1176392]='Scourge Cauldron'
G[1177544]="Joseph's Chest"
G[1179485]='Broken Trap'
G[1179517]="Treasure of the Shen'dralar"
G[1179551]="Hydraxis' Coffer"
G[1179697]='Arena Treasure Chest'
G[1179880]="Drakkisath's Brand"
G[1180025]='Mysterious Eastvale Haystack'
G[1180055]='Mysterious Wailing Caverns Chest'
G[1180056]='Mysterious Tree Stump'
G[1180366]='Battered Tackle Box'
G[1180448]='Wanted Poster: Deathclasp'
G[1180503]='Sandy Cookbook'
G[1180715]='Holly Preserver'
G[1180743]='Carefully Wrapped Present'
G[1180746]='Gently Shaken Gift'
G[1180747]='Gaily Wrapped Present'
G[1180748]='Ticking Present'
G[1180793]='Festive Gift'
G[1180918]='Wanted: Thaelis the Hungerer'
G[1181011]="Magister Duskwither's Journal"
G[1181150]='Dusty Journal'
G[1181153]="Wanted Poster: Kel'gash the Wicked"
G[1181748]='Blood Crystal'
G[1181756]='Battered Ancient Book'
G[1181758]='Mound of Dirt'
G[1182032]="Galaen's Journal"
G[1182392]='Garadar Bulletin Board'
G[1182393]='Telaar Bulletin Board'
G[1182549]='Fel Orc Plans'
G[1182947]='The Codex of Blood'
G[1183770]="B'naar Control Console"
G[1183877]='Ethereal Transporter Control Panel'
G[1184300]='Necromantic Focus'
G[1184825]="Lashh'an Tome"
G[1185126]='Crystal Prison'
G[1185165]='Legion Communicator'
G[1186585]='Dragonskin Scroll'
G[1186887]="Large Jack-o'-Lantern"
G[1187236]='Winter Veil Gift'
G[1187273]='Suspicious Hoofprint'
G[1187559]='Horde Bonfire'
G[1187564]='Alliance Bonfire'
G[1187565]='Elder Atkanok'
G[1187851]='Cultist Shrine'
G[1187905]='Massive Glowing Egg'
G[1188085]='Plagued Grain'
G[1188261]='Battered Journal'
G[1188364]='Wrecked Crab Trap'
G[1188365]='Heart of the Ancients'
G[1188419]="Elder Mana'loa"
G[1188667]='Amberseed'
G[1189311]='Flesh-bound Tome'
G[1189989]='Dark Iron Mole Machine Wreckage'
G[1190535]="Zim'Abwa"
G[1190602]="Zim'Torga"
G[1190657]="Zim'Rhuk"
G[1190768]='Timeworn Coffer'
G[1190777]="Artruis's Phylactery"
G[1190917]='Abandoned Mail'
G[1190936]='Plague Cauldron'
G[1191760]="Inventor's Library Console"
G[1191761]='Prototype Console'
G[1191766]='Orders From Drakuru'
G[1192060]="Fjorn's Anvil"
G[1192072]='Harpoon Crate'
G[1192078]="Hodir's Horn"
G[1192079]="Hodir's Spear"
G[1192080]="Hodir's Helm"
G[1192524]='Arngrim the Insatiable'
G[1192833]="Bridenbrad's Possessions"
G[1193195]='Pulsing Crystal'
G[1193400]='Saronite Bomb Stack'
G[1193905]="Alexstrasza's Gift"
G[1194105]='Buzzbox 413'
G[1194122]='Buzzbox 723'
G[1194378]="Stolen Explorers' League Document"
G[1194555]='Archivum Console'
G[1194714]='Disgusting Workbench'
G[1195134]='The Bomb'
G[1195431]='Headquarters Radio'
G[1195433]='Ancient Tablets'
G[1195435]='Weapons Cabinet'
G[1195438]='Cup of Elune'
G[1195445]='Ancient Vortex Runestone'
G[1195497]="Elune's Brazier"
G[1195517]="Elune's Handmaiden"
G[1195600]='Smouldering Stone'
G[1195642]='Naga Power Stone'
G[1195676]='Secret Lab Squawkbox'
G[1196393]='Broken Relic'
G[1196394]='Crate of Mandrake Essence'
G[1196832]='Upper Scrying Stone'
G[1196833]='Lower Scrying Stone'
G[1201578]='Wrenchmen Recruitment Poster'
G[1201742]='Runeforge'
G[1202135]="Dadanga's Grave"
G[1202264]="Ringo's Sack"
G[1202335]="Paxton's Field Cannon"
G[1202407]="Sandscraper's Chest"
G[1202474]='Antediluvean Chest'
G[1202598]='Big Nasty Plunger'
G[1202613]='Platform Control Panel'
G[1202697]='Eye of Twilight'
G[1202701]='Outhouse Hideout'
G[1202706]='Twilight Cauldron'
G[1202712]='The Twilight Apocrypha'
G[1202714]='Enormous Skull'
G[1202759]='Sunken Horde Chest'
G[1202859]='Half-buried Footlocker'
G[1202871]='Sunken Crate'
G[1202916]='Sandy Mound'
G[1202975]='Submerged Outhouse'
G[1203128]='Broken Bottle'
G[1203134]='Empty Pedestal'
G[1203140]='Broken Prong'
G[1203186]='STAY OUT!'
G[1203207]='Codex of Shadows'
G[1203301]='Naga Tridents'
G[1203305]='Crucible of Nazsharin'
G[1203395]='Alliance S.E.A.L. Equipment'
G[1203733]='Bounty Board'
G[1203734]='Westfall Deed'
G[1204050]='Foebreaker Blueprints'
G[1204274]="Captain's Log"
G[1204351]='Ettin Control Orb'
G[1204406]='Half-Buried Bottle'
G[1204450]="Captain Stillwater's Charts"
G[1204578]='Barrel of Doublerum'
G[1204817]='Lightforged Rod'
G[1204824]='Lightforged Arch'
G[1204825]='Lightforged Crest'
G[1204959]='Gigantic Painite Cluster'
G[1205134]="Forgemaster's Log"
G[1205143]='Abandoned Outhouse'
G[1205198]='Pile of Explosives'
G[1205207]="Maziel's Journal"
G[1205258]='Broken Weapons Crate'
G[1205266]='Elaborate Disc'
G[1205350]='Horde Communication Panel'
G[1205540]='Decrepit Skeleton'
G[1205874]='Sand-Covered Hieroglyphs'
G[1205875]="Crusader's Flare"
G[1206109]="Warchief's Command Board"
G[1206111]="Hero's Call Board"
G[1206293]='A. I. D.A. Terminal'
G[1206335]='Stone Slab'
G[1206336]='Marble Slab'
G[1206374]='Trove of the Watchers'
G[1206504]="Rhea's Final Note"
G[1206585]='Totem of Ruumbo'
G[1206944]='Shovel'
G[1207104]='Master Control Pump'
G[1207125]='Crate of Left Over Supplies'
G[1207179]='Winterfall Cauldron'
G[1207291]='Echo Three'
G[1207303]='Adventure Board'
G[1207359]='Pure Twilight Egg'
G[1207406]='Strange Fountain'
G[1207407]='Broken Pillar'
G[1207408]='Magical Brazier'
G[1207409]="Tol'vir Grave"
G[1207410]='Large Stone Obelisk'
G[1207411]='Dwarven Bone Pile'
G[1207412]='Stone Tablet'
G[1208184]='Earthen Ring Bonfire'
G[1208420]='Treasure Chest'
G[1208535]='Dried Acorn'
G[1208549]='Voodoo Pile'
G[1208825]='Shrine of the Ancestors'
G[1209072]='Stolen Crate'
G[1209673]='Jade Tiger Pillar'
G[1209845]='Mouthwatering Brew'
G[1211316]="The Commander's Cache"
G[1211754]='Curious Text'
G[1212181]='Ancient Statue'
G[1212389]='Scroll of Auspice'
G[1213767]='Hidden Treasure'
G[1213770]='Stolen Sprite Treasure'
G[1213771]='Statue of Xuen'
G[1213793]="Rikktik's Tiny Chest"
G[1214062]='Glowing Amber'
G[1214218]='Clutter'
G[1214438]='Ancient Mogu Tablet'
G[1214562]='Sha-Haunted Crystal'
G[1214871]='Shattered Destroyer'
G[1215705]='Tillers Shrine'
G[1215844]='Flagpole'
G[1216274]='Signal Fire'
G[1216609]='Flare Launcher'
G[1216837]="Wrathion's Jewel Chest"
G[1217848]='Midsummer Bonfire'
G[1218072]='Head of the Keymaster'
G[1218077]='Base of the Chamberlain'
G[1218750]='Work Orders'
G[1218765]='Empty Crate'
G[1218808]='Cache of Ancient Treasures'
G[1220641]='Thunderlord Cache'
G[1220832]='Sunken Treasure'
G[1220901]='Gleaming Treasure Chest'
G[1220902]='Rope-Bound Treasure Chest'
G[1220903]='Gleaming Crane Statue'
G[1220986]="Blackguard's Jetsam"
G[1221036]='Gleaming Treasure Satchel'
G[1221376]='Old Sign Fragment'
G[1221413]='Lin Family Scroll'
G[1221617]='Skull-Covered Chest'
G[1221670]='Moss-Covered Chest'
G[1222684]='Glinting Sand'
G[1223084]='Moss-Covered Chest'
G[1223087]='Moss-Covered Chest'
G[1223088]='Moss-Covered Chest'
G[1223090]='Moss-Covered Chest'
G[1223101]='Moss-Covered Chest'
G[1223107]='Moss-Covered Chest'
G[1223533]='Peaceful Offering'
G[1224217]='Dusty Chest'
G[1224305]="Chaincrafter's Anvil"
G[1224306]='Broken Chains'
G[1224392]="Slave's Stash"
G[1224613]="Spectator's Chest"
G[1224616]='Obsidian Petroglyph'
G[1224623]='Wiggling Egg'
G[1224633]='Iron Horde Supplies'
G[1224686]="Devourer's Gutstone"
G[1224713]='Cragmaul Cache'
G[1224750]='Hanging Satchel'
G[1224753]='Scaly Rylak Egg'
G[1224754]='Waterlogged Chest'
G[1224755]='Iron Horde Tribute'
G[1224756]="Alchemist's Satchel"
G[1224770]='Shadowmoon Exile Treasure'
G[1224780]='Shadowmoon Sacrificial Dagger'
G[1224781]='Rotting Basket'
G[1224783]='False-Bottomed Jar'
G[1224784]="Vindicator's Cache"
G[1224785]='Demonic Cache'
G[1225596]='Prickly Nopal'
G[1225726]='Iron Shredder Decommission Orders'
G[1225778]="Barum's Notes"
G[1226831]="Astrologer's Box"
G[1226854]='Armored Elekk Tusk'
G[1226861]="Ronokk's Belongings"
G[1226862]='Giant Moonwillow Cone'
G[1226865]='Cargo of the Raven Queen'
G[1226888]='Aruunem Berry Bush'
G[1226955]="Arena Master's War Horn"
G[1226976]="Deceptia's Smoldering Boots"
G[1226983]="Crag-Leaper's Cache"
G[1226987]='Ricky'
G[1226990]='Supply Dump'
G[1226993]="Survivalist's Cache"
G[1226994]='Grimfrost Treasure'
G[1226996]='Goren Leftovers'
G[1227067]='Forge'
G[1227069]='Hastily Written Note'
G[1227134]='Iron Horde Cargo Shipment'
G[1227504]='Barbed Thunderlord Spear'
G[1227527]='Lightbearer'
G[1227587]="Yuuri's Gift"
G[1227654]='Viperlash'
G[1227737]='Shadow Council Communicator'
G[1227743]='Fantastic Fish'
G[1227793]="Aarko's Family Treasure"
G[1227806]='Battle-Worn Frostwolf Banner'
G[1227859]='Hope'
G[1227951]="Rook's Tacklebox"
G[1227953]='Jug of Aged Ironwine'
G[1227954]='Luminous Shell'
G[1227955]='Amethyl Crystal'
G[1227956]="Foreman's Lunchbox"
G[1227996]='Curious Deathweb Egg'
G[1227998]="Ockbar's Pack"
G[1228012]='Charred Sword'
G[1228013]="Farmer's Bounty"
G[1228014]='Relic of Aruuna'
G[1228015]='Iron Box'
G[1228016]='Barrel of Fish'
G[1228017]='Draenei Weapons'
G[1228018]="Soulbinder's Reliquary"
G[1228019]='Webbed Sac'
G[1228020]='Relic of Telmor'
G[1228021]="Treasure of Ango'rosh"
G[1228022]='Light of the Sea'
G[1228023]='Bonechewer Remnants'
G[1228024]='Aruuna Mining Cart'
G[1228025]="Keluu's Belongings"
G[1228026]='Pure Crystal Dust'
G[1228483]='Rusted Lockbox'
G[1228493]='True Iron Deposit'
G[1228563]='Blackrock Deposit'
G[1228570]="Ketya's Stash"
G[1228571]='Frostweed'
G[1228572]='Fireweed'
G[1228573]='Gorgrond Flytrap'
G[1228574]='Starflower'
G[1228575]='Nagrand Arrowbloom'
G[1228576]='Talador Orchid'
G[1228991]='Frostblossom'
G[1229314]='Goblin Mind Control Device'
G[1229328]='Bloodmaul Frostbender'
G[1229330]='Mysterious Ring'
G[1229331]='A Mystical Hat'
G[1229333]='Mysterious Boots'
G[1229344]='Buried Timewarped Staff'
G[1229354]='Bright Coin'
G[1229367]='Frozen Orc Skeleton'
G[1229640]='Frostwolf Cold-Singer'
G[1230252]='Burning Pearl'
G[1230401]='Spider'
G[1230402]='Lucky Coin'
G[1230424]='Snow-Covered Strongbox'
G[1230425]='Gnawed Bone'
G[1230611]='Pale Loot Sack'
G[1230643]='Teroclaw Nest'
G[1230664]='The Crystal Blade of Torvath'
G[1230665]='Drafting Table'
G[1230820]='Snapdragon'
G[1230865]='List of Ingredients'
G[1230880]='Drudgeboat Salvage'
G[1230881]='Drudgeboat Salvage'
G[1230882]='Gold-O-Matic 9000'
G[1230909]='Forgotten Supplies'
G[1230933]='Defense Pylon Central Control Console'
G[1231069]='Strange Looking Dagger'
G[1231100]='Icevine'
G[1231103]='Raided Loot'
G[1231183]='Place Eye of Anzu'
G[1231184]='Offering Bowl'
G[1231644]='Horned Skull'
G[1231769]='Glowing Mushroom'
G[1231901]='Ogre Scrolls'
G[1231903]="Razzlebeard's Report"
G[1231918]="Laanda's Scroll"
G[1232024]='Warsong Attack Plans'
G[1232066]='Sunken Treasure'
G[1232067]='Stolen Treasure'
G[1232100]='Nagrand Cherry'
G[1232169]="Varasha's Egg"
G[1232353]="Overseer's Chair"
G[1232360]='Cannonball'
G[1232397]='Bulletin Board'
G[1232458]="Nizzix's Chest"
G[1232489]='Weapon Loader'
G[1232492]='Doomshot'
G[1232494]='Mushroom-Covered Chest'
G[1232571]='Goblin Pack'
G[1232582]="Ashes of A'kumbo"
G[1232583]='Carved Drinking Horn'
G[1232586]="Rovo's Dagger"
G[1232587]="Uzko's Knickknacks"
G[1232588]="Greka's Urn"
G[1232589]="Veema's Herb Bag"
G[1232590]='Void-Infused Crystal'
G[1232591]="Beloved's Offering"
G[1232592]='Swamplighter Hive'
G[1232596]='Ancestral Greataxe'
G[1232597]='Goblin Pack'
G[1232598]='Steamwheedle Glider Pilot'
G[1232599]='Warsong Spoils'
G[1232621]='Strange Spore'
G[1232624]="Mikkal's Chest"
G[1232986]='Tormmok'
G[1232989]='Basket of Arakkoa Goods'
G[1233005]='Bloodmaul Cache'
G[1233032]="Mountain Climber's Pack"
G[1233034]='Steamwheedle Supplies'
G[1233044]='Fungus-Covered Chest'
G[1233048]='Brilliant Dreampetal'
G[1233052]='Steamwheedle Supplies'
G[1233079]='Appropriated Warsong Supplies'
G[1233101]='Sunken Fishing boat'
G[1233103]='Warsong Lockbox'
G[1233113]='Warsong Spear'
G[1233117]='Frostweed'
G[1233126]='Shadowmoon Treasure'
G[1233132]='Freshwater Clam'
G[1233134]='Golden Kaliri Egg'
G[1233135]='Warsong Cache'
G[1233137]='Burning Blade Cache'
G[1233139]='Ancient Titan Chest'
G[1233149]='Laughing Skull Cache'
G[1233206]='Abandoned Cargo'
G[1233218]="Adventurer's Pack"
G[1233229]='Shadow Council Tome of Curses'
G[1233241]='Glowing Cave Mushroom'
G[1233263]='Shamanstone'
G[1233291]='Command Board'
G[1233296]='Ancient Ogre Hoard Jar'
G[1233350]='Warsong Command Brief'
G[1233391]='Weaponization Orders'
G[1233452]='A Pile of Dirt'
G[1233455]='Aged Stone Container'
G[1233457]='Crushed Adventurer'
G[1233492]='Elemental Offering'
G[1233499]="Adventurer's Sack"
G[1233501]='Mysterious Petrified Pod'
G[1233504]='Remains of Grimnir Ashpick'
G[1233505]='Unknown Petrified Egg'
G[1233507]='Forgotten Ogre Cache'
G[1233511]="Adventurer's Pack"
G[1233513]='Forgotten Skull Cache'
G[1233520]='Remains of Explorer Engineer Toldirk Ashlamp'
G[1233521]='Lazy Warsong Scout'
G[1233522]='Obsidian Crystal Formation'
G[1233523]='Mysterious Petrified Pod'
G[1233524]='Unknown Petrified Egg'
G[1233525]='Botani Essence Seed'
G[1233526]='Ancient Titan Chest'
G[1233532]='Bone-Carved Dagger'
G[1233549]='Genedar Debris'
G[1233550]='Unknown Petrified Egg'
G[1233551]='Breezestrider Talbuk'
G[1233552]='Aged Stone Container'
G[1233558]='Mysterious Petrified Pod'
G[1233559]='Forgotten Skull Cache'
G[1233560]="Fragment of Oshu'gun"
G[1233561]='Tormmok'
G[1233593]='Polished Saberon Skull'
G[1233598]='Elemental Shackles'
G[1233611]='Highmaul Sledge'
G[1233613]='Telaar Defender Shield'
G[1233618]='Ogre Beads'
G[1233623]='Clumsy Adventurer'
G[1233626]="Grizzlemaw's Bonepile"
G[1233641]='Watertight Bag'
G[1233642]="Abu'Gar's Favorite Lure"
G[1233645]='Warsong Helm'
G[1233649]="Gambler's Purse"
G[1233650]='Mangled Adventurer'
G[1233651]='Lost Pendant'
G[1233658]='Impaled Adventurer'
G[1233697]='Saberon Stash'
G[1233715]="Goldtoe's Plunder"
G[1233768]='Pale Elixir'
G[1233773]='Bag of Herbs'
G[1233792]='Pile of Rubble'
G[1233917]='Do Not Touch'
G[1233973]='Bounty of the Elements'
G[1233975]="Rooby's Roo"
G[1234054]='Warm Goren Egg'
G[1234105]='Arakkoa Archaeology Find'
G[1234106]='Ogre Archaeology Find'
G[1234147]='Lost Outcast'
G[1234154]='Misplaced Scrolls'
G[1234155]='Relics of the Outcasts'
G[1234157]='Fractured Sunstone'
G[1234159]='Lost Herb Satchel'
G[1234243]='Overly Gaudy Note'
G[1234432]='Ogron Plunder'
G[1234446]='Relics of the Outcasts'
G[1234449]='Relics of the Outcasts'
G[1234451]='Relics of the Outcasts'
G[1234456]='Shattered Hand Lockbox'
G[1234458]='Shattered Hand Cache'
G[1234461]='Toxicfang Venom'
G[1234471]='Spray-O-Matic 5000 XT'
G[1234472]="Sailor Zazzuk's 180-Proof Rum"
G[1234473]='Campaign Contributions'
G[1234474]='Saberon Stash'
G[1234618]='Gift of Anzu'
G[1234704]='Elixir of Shadow Sight'
G[1234740]='Orcish Signaling Horn'
G[1234746]='Cultist Statue'
G[1235073]='Offering to the Raven Mother'
G[1235091]='Lost Ring'
G[1235095]='Misplaced Scroll'
G[1235097]="Ephial's Dark Grimoire"
G[1235103]='Garrison Supplies'
G[1235104]='Sun-Touched Cache'
G[1235127]='Mysterious Petrified Pod'
G[1235129]='Enriched Seeds'
G[1235135]='Smuggled Apexis Artifacts'
G[1235141]='Iron Horde Explosives'
G[1235143]='Arakkoa Outcast'
G[1235168]='Arakkoa Outcast'
G[1235172]="Outcast's Belongings"
G[1235282]='Sethekk Ritual Brew'
G[1235289]="Garrison Workman's Hammer"
G[1235299]="Coinbender's Payment"
G[1235300]='Mysterious Mushrooms'
G[1235307]='Waterlogged Satchel'
G[1235310]='Shredder Parts'
G[1235313]='Abandoned Mining Pick'
G[1235365]="Admiral Taylor's Coffer"
G[1235859]="Brokor's Sack"
G[1235860]='Orc Skeleton'
G[1235869]='Canyon Boulderbreaker'
G[1235881]='Petrified Rylak Egg'
G[1236092]='Stashed Emergency Rucksack'
G[1236096]='Remains of Balldir Deeprock'
G[1236099]='Suntouched Spear'
G[1236138]='Iron Supply Chest'
G[1236139]='Explorer Canister'
G[1236140]='Goren Tunnel'
G[1236141]='Discarded Pack'
G[1236147]="Vindicator's Hammer"
G[1236149]='Seagull'
G[1236158]="Sniper's Crossbow"
G[1236169]='Harvestable Precious Crystal'
G[1236170]='Remains of Balik Orecrusher'
G[1236178]='Evermorn Supply Cache'
G[1236206]='War Planning Map'
G[1236258]='Unknown Petrified Egg'
G[1236259]='Mysterious Petrified Pod'
G[1236260]='Mysterious Petrified Pod'
G[1236264]='Forgotten Skull Cache'
G[1236265]='Aged Stone Container'
G[1236266]='Unknown Petrified Egg'
G[1236267]='Ancient Titan Chest'
G[1236483]='Gift of the Ancients'
G[1236610]="Spirit's Gift"
G[1236633]="Smuggler's Cache"
G[1236693]='Iron Horde Munitions'
G[1236715]='Odd Skull'
G[1236755]='Dusty Lockbox'
G[1236931]="Giants' Stash of Weapons"
G[1236935]='Burning Blade Cache'
G[1237016]="Wanted: Kuu'rat"
G[1237021]="Wanted: Kliaa's Stinger"
G[1237227]='Highmaul Reliquary'
G[1237263]='Stolen Goods'
G[1237453]='Unearthed Reliquary'
G[1237511]='Strange Spore'
G[1237705]="Boneseer's Cauldron"
G[1237790]="Prophet Velen's Memorial"
G[1237821]="Bladefury's Orders"
G[1237946]='Spirit Coffer'
G[1238940]='Academy Bookshelf'
G[1239067]='War Mill Work Order'
G[1239120]="Okuna Longtusk's Pack"
G[1239194]="Norana's Cache"
G[1239328]="Captain's Foot Locker"
G[1239341]='Tidestone Shard'
G[1239768]="Gutrek's Blade"
G[1239771]="Gutrek's Hilt"
G[1239772]="Gutrek's Pommel"
G[1239791]='Relic Hunting Notes'
G[1239803]='Leyscar Scuttler'
G[1239821]='Research Notes'
G[1239889]='Precision Blasting Powder'
G[1239890]='Detonators'
G[1239902]='Tanaan Planning Map'
G[1239923]="Gronnsbane's Haft"
G[1239924]="Gronnsbane's Weight"
G[1239971]='Medical Supplies'
G[1239977]='Steamcap Mushrooms'
G[1240003]='Strange Sapphire'
G[1240016]="Artificer's Journal"
G[1240033]='Dim Ley Crystal'
G[1240267]='Cracked Ley Crystal'
G[1240289]='Weathered Axe'
G[1240317]="Iskar's Tome of Shadows"
G[1240346]='Olive Sprig'
G[1240354]='Genuinely Unguarded Treasure'
G[1240543]="Stolen Captain's Chest"
G[1240547]='Orc Skull'
G[1240552]='Tidestone Core'
G[1240570]='Eye Holder'
G[1240575]='Laz-Tron Disc Reader'
G[1240577]="The Blade of Kra'nak"
G[1240580]='Jewel of Hellfire'
G[1240608]='Small Treasure Chest'
G[1240609]='Stoneblood Ravager'
G[1240616]='Frozen Supplies'
G[1240617]="Lost Sentinel's Pouch"
G[1240625]="High Priestess' Reliquary"
G[1240637]='Glimmering Treasure Chest'
G[1240638]='Disputed Treasure'
G[1240639]='Sneaky Snake'
G[1240643]='Treasure Chest'
G[1240649]='Small Treasure Chest'
G[1240655]='Glimmering Treasure Chest'
G[1240657]='Small Treasure Chest'
G[1240855]='Tome of Secrets'
G[1241128]='Unguarded Thistleleaf Treasure'
G[1241216]='Treasure Chest'
G[1241267]='Small Treasure Chest'
G[1241275]='Skyfire Medical Supplies'
G[1241433]='Forgotten Sack'
G[1241434]='Lodged Hunting Spear'
G[1241449]='Blackfang Island Cache'
G[1241450]='Crystallized Fel Spike'
G[1241504]='Polished Crystal'
G[1241521]="Snake Charmer's Flute"
G[1241522]='The Perfect Blossom'
G[1241524]='Pale Removal Equipment'
G[1241533]="Forgotten Champion's Blade"
G[1241557]='Small Treasure Chest'
G[1241560]='Bleeding Hollow Warchest'
G[1241561]='Jewel of the Fallen Star'
G[1241563]='Tormmok'
G[1241565]='Looted Bleeding Hollow Treasure'
G[1241566]='Rune Etched Femur'
G[1241599]='Strange Fruit'
G[1241600]='Discarded Helm'
G[1241601]="Scout's Belongings"
G[1241602]='Forgotten Iron Horde Supplies'
G[1241605]='Crystallized Essence of the Elements'
G[1241641]='Foxflower'
G[1241656]='Overgrown Relic'
G[1241657]='Jeweled Arakkoa Effigy'
G[1241664]='"Borrowed" Enchanted Spyglass'
G[1241666]='Mysterious Corrupted Obelisk'
G[1241671]='Forgotten Shard of the Cipher'
G[1241674]='Skull of the Mad Chief'
G[1241680]='Small Treasure Chest'
G[1241692]='Axe of the Weeping Wolf'
G[1241699]='Spoils of War'
G[1241712]="Ironbeard's Treasure"
G[1241713]='The Eye of Grannok'
G[1241714]='Stashed Iron Sea Booty'
G[1241717]='Glimmering Treasure Chest'
G[1241726]='Leystone Deposit'
G[1241742]='Leorajh'
G[1241743]='Felslate Deposit'
G[1241745]='Leorajh'
G[1241760]='Sacrificial Blade'
G[1241764]='Bleeding Hollow Looter'
G[1241775]='Brazier of Awakening'
G[1241835]='Bleeding Hollow Mushroom Stash'
G[1241841]='Looted Mystical Staff'
G[1241847]="The Commander's Shield"
G[1241848]='Dazzling Rod'
G[1241866]='Soulthorn'
G[1241870]="Ashildir's Bones"
G[1242249]='Partially Mined Apexis Crystal'
G[1242350]='Treasure Chest'
G[1242633]="Tanithria's Silkweave"
G[1242638]="Tanithria's Red Dye"
G[1242639]="Tanithria's Green Dye"
G[1242645]='Mezzkrast'
G[1242649]='Fel-Tainted Apexis Formation'
G[1242657]="Lyndras' Runic Catgut"
G[1242665]='Addie Fizzlebog'
G[1243334]='Withered Herb'
G[1243402]="Navarrogg's Cage"
G[1243639]='Siphoning Crystal'
G[1243688]='Treasure Chest'
G[1243690]='Bejeweled Egg'
G[1243693]="Dead Man's Chest"
G[1243698]='Glimmering Treasure Chest'
G[1243700]='Forsaken Battle Plans'
G[1243796]='Suspiciously Glowing Chest'
G[1243798]='Bax Freeseeker'
G[1243822]="Yotnar's Right Foot"
G[1243836]="Yotnar's Head"
G[1243852]='Radiating Apexis Shard'
G[1243860]='Gleaming Draenic Chest'
G[1243938]='Naval Equipment Blueprint: Blast Furnace'
G[1243953]='Twisted Root'
G[1244446]="Ram'Pag"
G[1244466]='Fel Portal'
G[1244473]='Thunder Totem Stolen Goods'
G[1244555]='Mysterious Dust'
G[1244559]="Helya's Altar"
G[1244628]="Taurson's Prize"
G[1244694]='Small Treasure Chest'
G[1244708]="Watcher's Journal"
G[1244774]='Aethril'
G[1244775]='Dreamleaf'
G[1244776]='Dreamleaf'
G[1244777]='Fjarnskaggl'
G[1244778]='Starlight Rose'
G[1244786]='Felwort'
G[1244829]='The Tangled Beard'
G[1244830]='Herblore of the Ancients'
G[1244912]='Small Treasure Chest'
G[1244923]='Lever'
G[1244928]='Glimmering Treasure Chest'
G[1244983]='Dirty Pocketwatch'
G[1245126]='Crystallized Ancient Mana'
G[1245245]='Vengeful Warglaive'
G[1245328]='Enchanted Scroll'
G[1245479]='Battered Chest'
G[1245507]='Supply Cache'
G[1245524]='Treasure Chest'
G[1245525]='Small Treasure Chest'
G[1245527]='Treasure Chest'
G[1245541]='Small Treasure Chest'
G[1245543]='Treasure Chest'
G[1245551]='Small Treasure Chest'
G[1245554]='Small Treasure Chest'
G[1245555]='Small Treasure Chest'
G[1245581]='Magic Broom'
G[1245688]='Shattered Burial Urn'
G[1245887]='Driftwood'
G[1245941]='Warp Cache'
G[1246037]='Mezzkrast'
G[1246205]='Quilen'
G[1246254]='Dusty Coffer'
G[1246463]="Hammer of Khaz'goroth"
G[1246465]='Tidestone of Golganneth'
G[1246522]='Fel Reaver Arm'
G[1246524]='Small Treasure Chest'
G[1246664]='Test Kitchen Results'
G[1246703]='Magical Manifest of the Moon'
G[1246710]="Nomi's Silver Mackerel"
G[1246713]='Place Telemancy Beacon'
G[1246804]='Highmountain Tauren Archaeology Find'
G[1246811]='Highborne Archaeology Find'
G[1246812]='Demonic Archaeology Find'
G[1247023]='Shadowbloom'
G[1247398]='Felsoul Keyring'
G[1247605]='Flourishing Aethril'
G[1247607]='Flourishing Fjarnskaggl'
G[1247694]="Kel'danath's Knapsack"
G[1248000]='Felwort'
G[1248001]='Savage Felbat'
G[1248002]='Felwort'
G[1248003]='Felwort'
G[1248005]='Felwort'
G[1248006]='Felwort'
G[1248007]='Felwort'
G[1248008]='Felwort'
G[1248009]='Felwort'
G[1248010]='Felwort'
G[1248011]='Felwort'
G[1248027]='Brambly Fjarnskaggl'
G[1248080]='Needle Coral'
G[1248091]="Lyndras' Threading Needles"
G[1248093]='Box of Bear Fur'
G[1248407]="Kel'danath's Manaflask"
G[1248534]='Tears of Elune'
G[1248554]='Nightborne Artifact Cache'
G[1248781]='Spotted Gloomcap'
G[1249000]='Ripe Pumpkin'
G[1249021]='Silgryn'
G[1249422]='Timeworn Jar'
G[1249514]="Dreamer's Tear"
G[1249524]='Egg of Gangamesh'
G[1249742]='Freshly Dug Grave'
G[1249827]='Highmountain Shoulderpad'
G[1249890]="Tigrid's Arkhana"
G[1250080]='Quilen'
G[1250084]='Hatecoil Riptail'
G[1250088]='Weeping Banshee'
G[1250090]='Azsuna Mana Wyrm'
G[1250104]='Hatecoil Spitespeaker'
G[1250107]='Mojodishu'
G[1250109]='Treasure Chest'
G[1250267]='Felsurge Egg'
G[1250373]='Encyclopedia Azsunica (K-M)'
G[1250383]='Moonshade Relic'
G[1250413]="Oren's Prized Possessions"
G[1250536]='Intact Greatstag Antler'
G[1250541]='Treasure Chest'
G[1250548]="Hammer of Khaz'goroth"
G[1250612]="Snaggle's Note"
G[1250903]='Large Ceremonial Drum'
G[1250904]='Medium Ceremonial Drum'
G[1250987]='Quilen'
G[1250990]='Crate of Ancient Relics'
G[1251032]='Armoire'
G[1251124]='Spiritwalker Ebonhorn'
G[1251191]='Ancient Bones'
G[1251416]='Ancient Mana Chunk'
G[1251425]='Moist Grizzlecomb'
G[1251571]='Ashilvara, Verse 1'
G[1251668]='Treasure Chest'
G[1251669]='Treasure Chest'
G[1251719]='Small Treasure Chest'
G[1251737]='Treasure Chest'
G[1251745]='Treasure Chest'
G[1251746]='Treasure Chest'
G[1251747]='Treasure Chest'
G[1251749]='Treasure Chest'
G[1251751]='Treasure Chest'
G[1251753]='Treasure Chest'
G[1251754]='Glimmering Treasure Chest'
G[1251755]='Glimmering Treasure Chest'
G[1251756]='Glimmering Treasure Chest'
G[1251757]='Glimmering Treasure Chest'
G[1251758]='Glimmering Treasure Chest'
G[1251759]='Glimmering Treasure Chest'
G[1251764]='Thankrit'
G[1251792]='Small Treasure Chest'
G[1251820]='Nether Ray'
G[1251851]='Small Treasure Chest'
G[1251870]="The Sixtriggers' Premium Stash"
G[1251954]='Small Treasure Chest'
G[1251991]='The Aegis of Aggramar'
G[1252184]='Requisitioned Seal of Fate'
G[1252258]='Leyline Feed'
G[1252408]='Ancient Mana Shard'
G[1252447]='Shimmering Ancient Mana Cluster'
G[1252448]='Shimmering Ancient Mana Cluster'
G[1252449]='Shimmering Ancient Mana Cluster'
G[1252450]='Shimmering Ancient Mana Cluster'
G[1252772]='Ancient Mana Chunk'
G[1252774]='Ancient Mana Crystal'
G[1252778]='Enslaving Infernal'
G[1252802]='Small Treasure Chest'
G[1252803]='Small Treasure Chest'
G[1252805]='Treasure Chest'
G[1252812]='Treasure Chest'
G[1252813]='Small Treasure Chest'
G[1252814]='Unpowered Telemancy Beacon'
G[1252819]='Small Treasure Chest'
G[1252820]='Small Treasure Chest'
G[1252821]='Treasure Chest'
G[1252822]='Glimmering Treasure Chest'
G[1252824]='Treasure Chest'
G[1252831]='Glimmering Treasure Chest'
G[1252832]='Small Treasure Chest'
G[1252833]='Treasure Chest'
G[1252834]='Small Treasure Chest'
G[1252837]='Treasure Chest'
G[1252838]='Treasure Chest'
G[1252839]='Small Treasure Chest'
G[1252840]='Small Treasure Chest'
G[1252841]='Small Treasure Chest'
G[1252842]='Treasure Chest'
G[1252844]='Treasure Chest'
G[1252850]='Small Treasure Chest'
G[1252860]='Small Treasure Chest'
G[1252884]='Chronarch Defender'
G[1253081]="Fruit of the Arcan'dor"
G[1253280]='Leystone Seam'
G[1253957]='Treasure Chest'
G[1254008]="Kyrtos's Research Notes"
G[1254023]='Arcane Power Unit'
G[1254128]='Treasure Chest'
G[1255341]="Llorian's Supplies"
G[1255828]='Small Treasure Chest'
G[1255829]='Small Treasure Chest'
G[1257289]='Elven Treasure Chest'
G[1257290]='Highmountain Clan Chest'
G[1257291]='Nightborne Treasure Chest'
G[1257393]='Treasure Chest'
G[1257545]='Treasure Chest'
G[1257546]='Treasure Chest'
G[1257978]='Treasure Chest'
G[1258968]="Hymdall's Cache"
G[1258979]='Fel-Ravaged Tome'
G[1260247]='Ancient Mana Chunk'
G[1260248]='Ancient Mana Shard'
G[1260249]='Ancient Mana Shard'
G[1260494]='Twice-Fortified Arcwine'
G[1260498]='Leypetal Blossom'
G[1260526]='Spoils'
G[1265435]='Doodad_7sr_hubmanatree_seedholder001'
G[1266032]='Nightborne Arms Cache'
G[1266291]='Fel Crystal'
G[1266619]='A Mysterious Note'
G[1267655]='Ravaged Supplies'
G[1267768]='Unearthed Antiquities'
G[1268534]='Curious Wyrmtongue Cache'
G[1268541]='Curious Wyrmtongue Cache'
G[1268545]='Curious Wyrmtongue Cache'
G[1268559]='Curious Wyrmtongue Cache'
G[1268564]='Curious Wyrmtongue Cache'
G[1268568]='Curious Wyrmtongue Cache'
G[1268571]='Curious Wyrmtongue Cache'
G[1268765]='Disturbed Mud'
G[1269056]='Small Treasure Chest'
G[1269065]='Small Treasure Chest'
G[1269068]='Small Treasure Chest'
G[1269075]='Small Treasure Chest'
G[1269080]='Small Treasure Chest'
G[1269278]='Fel-Encrusted Herb'
G[1269887]='Fel-Encrusted Herb Cluster'
G[1270917]='Glenbrook Register'
G[1271124]="Light's Judgment"
G[1271227]='Hidden Wyrmtongue Cache'
G[1271554]='Veiled Wyrmtongue Chest'
G[1271648]="Stolen Idol of Krag'wa"
G[1271668]='Cache of Acuity'
G[1271669]='Cache of Wit'
G[1271670]='Cache of Guile'
G[1271849]='Eredar War Supplies'
G[1271850]='Eredar War Supplies'
G[1271979]='Hearthsteed'
G[1272010]='Crystallized Memory'
G[1272179]="Mayor's Bulletin"
G[1272422]="Gentle's Spellbook"
G[1272455]='Eredar War Supplies'
G[1272456]='Eredar War Supplies'
G[1272562]='Waves of Power'
G[1272633]='Cursed Chest'
G[1272741]='Used Vial'
G[1272770]='Eredar War Supplies'
G[1272771]='Eredar War Supplies'
G[1272782]='Astral Glory'
G[1273052]='Fel-Encrusted Herb'
G[1273053]='Fel-Encrusted Herb Cluster'
G[1273274]='Congealed Void Crystal'
G[1273301]='Ancient Eredar Cache'
G[1273407]='High Exarch Turalyon'
G[1273412]='Ancient Eredar Cache'
G[1273414]='Ancient Eredar Cache'
G[1273439]='Ancient Eredar Cache'
G[1273443]='Void-Seeped Cache'
G[1273523]='Legion War Supplies'
G[1273524]='Legion War Supplies'
G[1273527]='Felfang Basilisk'
G[1273528]='Legion War Supplies'
G[1273533]='Legion War Supplies'
G[1273535]='Legion War Supplies'
G[1273814]='Bladed Charm'
G[1273833]="Heart of Nhal'athoth"
G[1275099]='Saurolisk Egg'
G[1276226]='Void-Tinged Chest'
G[1276228]="Desperate Eredar's Cache"
G[1276230]="Doomseeker's Treasure"
G[1276254]="Beginner's Guide to Archaeology"
G[1276487]='Intact Mudfish'
G[1276488]='Azerite Cannonball'
G[1276513]='Intact Mudfish'
G[1276515]='Fishing Rod'
G[1276616]='Magic Broom'
G[1276617]='Storm Silver Deposit'
G[1276618]='Platinum Deposit'
G[1276619]='Monelite Seam'
G[1276621]='Rich Monelite Deposit'
G[1276622]='Rich Storm Silver Deposit'
G[1276623]="Warlord's Deathwheel"
G[1276735]='Offerings of the Chosen'
G[1276837]='Recipe Rock'
G[1277199]='Weatherd Job List'
G[1277323]='Tome of Silver and Ash'
G[1277336]='Treasure Chest'
G[1277348]='Hati'
G[1277373]='Glimmering Seaweed'
G[1277459]='Pig Effigy'
G[1277561]="Warlord's Cache"
G[1277637]='Void-Seeped Cache'
G[1277715]='Cursed Nazmani Chest'
G[1277885]="Wunja's Trove"
G[1278252]='Job Flyer'
G[1278313]='Sternly Worded Letter'
G[1278342]='Pristine Phylactery'
G[1278436]='Shipwrecked Chest'
G[1278437]='Offering to Bwonsamdi'
G[1278456]='Treasure Chest'
G[1278459]='Treasure Chest'
G[1278460]='Treasure Chest'
G[1278461]='Treasure Chest'
G[1278462]='Treasure Chest'
G[1278585]='Cursed Effigy'
G[1278669]='Fallhaven Ledger'
G[1278694]='Treasure Chest'
G[1278713]='Treasure Chest'
G[1278716]='Treasure Chest'
G[1278793]='Treasure Chest'
G[1278808]='Gryphon Nest'
G[1279042]="Smuggler's Stash"
G[1279253]="Lucky Horace's Lucky Chest"
G[1279260]='"Cleverly" Disguised Chest'
G[1279299]='Venomous Seal'
G[1279325]='Treasure Chest'
G[1279337]='Heartsbane Grimoire'
G[1279366]='Treasure Chest'
G[1279367]='Treasure Chest'
G[1279378]='Treasure Chest'
G[1279379]='Treasure Chest'
G[1279388]="Lucille's Pack"
G[1279609]='Spoils of Pandaria'
G[1279689]='Lost Nazmani Treasure'
G[1279705]='Offering Vessel'
G[1279750]='Hay Covered Chest'
G[1280347]="Scroll of Fate's Hand"
G[1280480]='Titan Keeper Data Core'
G[1280504]='Swallowed Chest'
G[1280522]='Partially-Digested Treasure'
G[1280576]='Encased Scroll'
G[1280619]='Old Ironbound Chest'
G[1280727]='Charred Note'
G[1280736]='Bee Hive'
G[1280815]='Letter from Ms. Graham'
G[1280836]='Letter from Ms. Graham'
G[1280837]='Letter from Ms. Graham'
G[1280838]='Letter from Ms. Graham'
G[1280842]='Letter from Ms. Graham'
G[1280843]='Letter from Ms. Graham'
G[1280844]='Letter from Ms. Graham'
G[1280845]='Gift from Ms. Graham'
G[1280948]='Legion Outhouse'
G[1280951]='Ashvane Spoils'
G[1281092]="Witch Doctor's Hoard"
G[1281137]='Assorted Salvage'
G[1281176]="Jani's Stash"
G[1281230]='Formal Invitation'
G[1281305]='Slagshot Slammer'
G[1281348]='Crumbling Letter'
G[1281379]='Aromatic Onion'
G[1281387]='Blasting Powder'
G[1281388]="Jani's Stash"
G[1281390]="Jani's Stash"
G[1281397]='Cutwater Treasure Chest'
G[1281494]='Frosty Treasure Chest'
G[1281551]='Help Wanted Poster'
G[1281646]='Honey Vat'
G[1281647]='Posted Notice'
G[1281655]='Gift of the Brokenhearted'
G[1281673]="Corlain Citizen's Journal"
G[1281718]='HELP WANTED'
G[1281898]="Dazar's Forgotten Chest"
G[1281903]='Treasure Chest'
G[1282153]='Sunken Strongbox'
G[1282389]='Forgotten Bones'
G[1282432]='Rug'
G[1282448]='Wanted Poster'
G[1282457]='Unfinished Brambleguard Totem'
G[1282478]='Empty Crate'
G[1282662]="Assassin's Orders"
G[1282666]='Urn of Agussu'
G[1282721]='Treasure Chest'
G[1282722]='Treasure Chest'
G[1284426]='Buried Mining Machine'
G[1284448]="Hidden Scholar's Chest"
G[1284454]="Da White Shark's Bounty"
G[1284455]="The Exile's Lament"
G[1286016]="Ship's Log"
G[1286953]='Rod of Tides'
G[1287189]='Wanted: Dangerous Beasts'
G[1287228]='Wanted: Dark Chronicler'
G[1287232]='Scouting Report'
G[1287239]="Grayal's Last Offering"
G[1287304]="Lost Explorer's Bounty"
G[1287318]='Sandfury Reserve'
G[1287320]='Stranded Cache'
G[1287324]="Excavator's Greed"
G[1287326]="Zem'lan's Buried Treasure"
G[1287327]='Scouting Report'
G[1287463]='Old Ship Part'
G[1287958]='Bulletin Board'
G[1288157]="WANTED: Yarsel'ghun"
G[1288167]="Marie's Package"
G[1288214]='Wanted Poster'
G[1288475]='Firelands Slag'
G[1288596]='Cache of Secrets'
G[1288622]='WANTED: Sister Lilias'
G[1288641]="WANTED: Gryphon 'Nappers"
G[1288646]='Prickly Pear'
G[1289310]='WANTED: Living Earthguard'
G[1289313]='WANTED: The Hornet'
G[1289317]='Seaweed'
G[1289361]='WANTED: Quartermaster Ssylis'
G[1289365]='Wanted Poster'
G[1289647]='Weathered Treasure Chest'
G[1290138]='Bot Buster Bomb'
G[1290419]='Wanted Poster'
G[1290537]='Help Wanted'
G[1290725]="Riches of Tor'nowa"
G[1290765]='Large Pile of Gold'
G[1290770]='Treasure Chest'
G[1290820]='River Carnations'
G[1290993]='Irontide Loot'
G[1291013]="Tracker Burke's Hat"
G[1292408]='Mountain of Bacon'
G[1292523]='Wanted Poster'
G[1292673]='A Damp Scroll'
G[1292674]='A Damp Scroll'
G[1292675]='A Damp Scroll'
G[1292676]='A Damp Scroll'
G[1292677]='A Damp Scroll'
G[1292686]='Ominous Altar'
G[1292783]='Zandalari Water Jugs'
G[1293349]='Discarded Lunchbox'
G[1293350]='Carved Wooden Chest'
G[1293568]='Wanted Poster'
G[1293852]='Buried Treasure Chest'
G[1293880]='Buried Treasure Chest'
G[1293881]='Buried Treasure Chest'
G[1293884]='Buried Treasure Chest'
G[1293962]='Precarious Noble Cache'
G[1293964]="Forgotten Smuggler's Stash"
G[1293965]='Scrimshaw Cache'
G[1293985]='Wanted: War Gore'
G[1294173]='Venture Co. Supply Chest'
G[1294174]='Forgotten Chest'
G[1294316]='Lost Offerings of Kimbul'
G[1294317]='Deadwood Chest'
G[1294319]='Sandsunken Treasure'
G[1296574]="Ian's Empty Bottle"
G[1296583]="Navarro's Flask"
G[1296584]="Zach's Canteen"
G[1297071]='Tiny Coin Purse'
G[1297492]='Bulletin Board'
G[1297825]='Web-Covered Chest'
G[1297828]="Merchant's Chest"
G[1297878]='Hexed Chest'
G[1297879]='Bespelled Chest'
G[1297880]='Ensorcelled Chest'
G[1297881]='Enchanted Chest'
G[1297891]='Runebound Cache'
G[1297892]='Runebound Chest'
G[1297893]='Runebound Coffer'
G[1298920]='Stolen Thornspeaker Cache'
G[1303039]='Curious Grain Sack'
G[1319222]='Darkshore Cache'
G[1322533]='Tome of the Elements'
end

if release >= 28153 then
G[1293119]='Seaweed'
end


if release >= 30993 then
G[1325659]='Mechanized Chest'
G[1325660]='Mechanized Chest'
G[1325661]='Mechanized Chest'
G[1325662]='Mechanized Chest'
G[1325667]='Mechanized Chest'
G[1325668]='Mechanized Chest'
G[1326216]='Azerite Trident'
G[1326401]='Arcane Chest'
G[1327548]='Powerpack Blueprints'
G[1327576]='Glimmering Chest'
G[1327577]='Glimmering Chest'
G[1327578]='Glimmering Chest'
G[1330194]='Prismatic Crystal'
end

if release >= 31229 then
G[1322803]='Kelpberry'
G[1325664]='Mechanized Chest'
G[1325976]='Golden Cogpaste'
G[1327586]='Scrap Pile'
G[1327597]='Old Rusty Chest'
end

--	End of localized NPC names
