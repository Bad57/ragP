 -- Made with 🖤 By Bad
 -- https://github.com/Bad57/ragP
 
 AddRemoteEvent("RagdollPlayer", function (player, currentspeed,vehicle)
    if currentspeed < S_vitesseMin then return end
    for _, v in pairs(S_ignoredVehicles) do
        print(v)
        if tostring(GetVehicleModelName(vehicle)) == v then return end
    end

    local currenthealth = GetPlayerHealth(player)
    SetPlayerHealth(player, currenthealth-(currentspeed*S_ratioDegats))
    Delay(100, function ()
        SetPlayerRagdoll(player,true)
        if currentspeed < S_v1 then
            Delay(S_t1,function()
                SetPlayerRagdoll(player,false)
            end)
        elseif currentspeed < S_v2 then
            Delay(S_t2,function()
                SetPlayerRagdoll(player,false)
            end)
        else
            Delay(S_t3,function()
                SetPlayerRagdoll(player,false)
            end)
        end
    end)
end)

AddEvent("OnPlayerEnterVehicle", function(player, vehicle, seat)
    print(GetVehicleModelName(vehicle))
end)
