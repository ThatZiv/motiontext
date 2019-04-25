# Motion Text - Draw 3D Text Easily
![main](https://raw.githubusercontent.com/ThatZiv/motiontext/master/screenshots/main.gif)
## What is this?
An easy way of implementing 3D Text on your server, permanent or not. Also, this is a dev tool.
## What can you do?
A bunch of stuff.

![main](https://raw.githubusercontent.com/ThatZiv/motiontext/master/screenshots/3d.PNG)
Place static text anywhere on the map
![main](https://raw.githubusercontent.com/ThatZiv/motiontext/master/screenshots/timeout.gif)
Temporarily draw 3D text using the chat. 
![main](https://raw.githubusercontent.com/ThatZiv/motiontext/master/screenshots/1k.gif)
Draw 3D Text and let it disappear after a specific threshold (with distance).
![main](https://raw.githubusercontent.com/ThatZiv/motiontext/master/screenshots/ped.PNG)
Possibilities are endless. 
## Installation
Download [motiontext](https://github.com/ThatZiv/motiontext) on github.
Place the `motiontext` folder into your `resources` folder.
Add `start motiontext` in your `server.cfg` (above any resources that use this).
## Documentation 
* `Draw3DTextPermanent` - Draws 3D text permanently on specific coordinates (for static purposes) 
 ```lua
exports.motiontext:Draw3DTextPermanent({
    xyz={x = -1377.514282266, y = -2852.64941406, z = 13.9448}, -- At airport 
    text={
        content="Test" --[[This is the string that you want to be displayed]],
        rgb={255 , 255, 255} --[[The color value of the text]],
        textOutline=true --[[ Text outline ]],
        scaleMultiplier=1, --[[ Text Size Multiplier]]
        font=0, --[[ Font type (0-5) ]]
    },
    perspectiveScale=4,
    radius=5000 --[[ The radius of units until the text disappears/reappears ]],
})
```
* `Draw3DText` - Draws 3D text for 1 frame.
 ```lua
Citizen.CreateThread(function()
	while true do --[[ requests every frame ]]
		Citizen.Wait(1)
		exports.motiontext:Draw3DText({
		    xyz= GetEntityCoords(PlayerPedId()), --at your coords 
		    text={
		        content="Test" --[[This is the string that you want to be displayed]],
		        rgb={255 , 255, 255} --[[The color value of the text]],
		        textOutline=true --[[ Text outline ]],
		        scaleMultiplier=1, --[[ Text Size Multiplier]]
		        font=0, --[[ Font type (0-5) ]]
		    },
		    perspectiveScale=4,
		    radius=5000 --[[ The radius of units until the text disappears/reappears ]],
		})
	end
end)
```
* `Draw3DTimeout` - Draws 3D text for a set amount of time.
```lua
-- Uses chat arguments to draw text (temporarily ~2 seconds) at your coords
RegisterCommand("test", function(source, args)
    local argString = table.concat(args, " ") -- concats the args into a string
    exports.motiontext:Draw3DTextTimeout({
	    xyz=GetEntityCoords(PlayerPedId()),
	    timeout=2000, --[[ the amt. of time it takes for the text to disappear (in ms) ]]
	    text={
	        content=argString,
	        rgb={255 , 255, 255},
	        textOutline=true,
	        scaleMultiplier=1,
	        font=0
	    },
	    perspectiveScale=4,
	    radius=5000,
    }) 
end)
```
## Usage
```lua
-- CLIENT SIDED ONLY
local vector =  vector3(-1377.514282266, -2852.64941406, 13.9448)
default = {
    xyz = vector, -- At airport
    text={
        content="Test",
        rgb={255 , 255, 255},
        textOutline=true,
        scaleMultiplier=1,
        font=0
    },
    perspectiveScale=4,
    radius=5000,
    timeout=5000
}
exports.motiontext:Draw3DText(default)
exports.motiontext:Draw3DTextPermanent(default)
exports.motiontext:Draw3DTextTimeout(default)
```
