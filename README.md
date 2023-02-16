# cw-prescriptions 💊
Allows creation of presciption cars that can be personalized. The idea is for EMS or doctors to print these for character who want to have prescribed drugs. Simple and easy. ✌

# Preview 📽
[![YOUTUBE VIDEO](http://img.youtube.com/vi/mo_dVqknpeQ/0.jpg)](https://youtu.be/mo_dVqknpeQ)

# Developed by Coffeelot and Wuggie
[More scripts by us](https://github.com/stars/Coffeelot/lists/cw-scripts)  👈\
[Support, updates and script previews](https://discord.gg/FJY4mtjaKr) 👈
# Config 🔧
You can add more card types in `Config.Items` in the config file. Follow the model. 

# Add to qb-core ❗
```
["prescription_card"] 					 = {["name"] ="prescription_card", 			  	  		["label"] = "Prescription Card", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "prescription_card.png", 			["unique"] = true,	 	["useable"] = true,			["created"] = nil,		["decay"] =nil, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A prescription card"},
```
Get the image from `ui/assets/img` and copy it to your inventory img folder.
# Dependencies
* qb-target - https://github.com/BerkieBb/qb-target