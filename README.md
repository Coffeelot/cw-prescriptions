# cw-prescriptions 💊
Allows creation of presciption cars that can be personalized. The idea is for EMS or doctors to print these for character who want to have prescribed drugs. Simple and easy. ✌

# Preview 📽
[![YOUTUBE VIDEO](http://img.youtube.com/vi/mo_dVqknpeQ/0.jpg)](https://youtu.be/mo_dVqknpeQ)

# Developed by Coffeelot and Wuggie
[More scripts by us](https://github.com/stars/Coffeelot/lists/cw-scripts)  👈

**Support, updates and script previews**:

[![Join The discord!](https://cdn.discordapp.com/attachments/977876510620909579/1013102122985857064/discordJoin.png)](https://discord.gg/FJY4mtjaKr )

**All our scripts are and will remain free**. If you want to support what we do, you can buy us a coffee here:

[![Buy Us a Coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg)](https://www.buymeacoffee.com/cwscriptbois )
# Config 🔧
You can add more card types in `Config.Items` in the config file. Follow the model. By default, the spot is set up in the lab of Gabz Pillbox, and can only be used by any ems or a police officer with rank 4 or higher.

# Add to qb-core ❗
```
["prescription_card"] 					 = {["name"] ="prescription_card", 			  	  		["label"] = "Prescription Card", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "prescription_card.png", 			["unique"] = true,	 	["useable"] = true,			["created"] = nil,		["decay"] =nil, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A prescription card"},
```
Get the image from `ui/assets/img` and copy it to your inventory img folder.
# Dependencies
* qb-target - https://github.com/BerkieBb/qb-target