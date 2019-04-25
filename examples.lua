-- Draws on your ped constantly
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(1)
    exports.motiontext:Draw3DText({
        xyz=GetEntityCoords(PlayerPedId()),
        text={
            content="oh no!",
            rgb={255 , 255, 55},
            textOutline=true,
            scaleMultiplier=1,
            font=0
        },
        perspectiveScale=4,
        radius=5000,
    }) 
    end
end)

-- Draws text contantly (w/o the use of a thread on this end) at airport
local v3 = vector3(-1377.514282266, -2852.64941406, 13.9448)
 exports.motiontext:Draw3DTextPermanent({
    xyz=v3,
    text={
        content="Test",
        rgb={255 , 255, 55},
        textOutline=true,
        scaleMultiplier=1,
        font=0
    },
    perspectiveScale=4,
    radius=5000,
}) 

-- Uses chat arguments to draw text (temporarily) at your coords
RegisterCommand("test", function(source, args)
    local argString = table.concat(args, " ")
    exports.motiontext:Draw3DTextTimeout({
    xyz=GetEntityCoords(PlayerPedId()),
    timeout=2000,
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

 
