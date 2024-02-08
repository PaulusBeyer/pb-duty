local QBCore = exports['qb-core']:GetCoreObject()
local DutyZones = {}
local PlayerJob = {}
local onDuty = false

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        onDuty = PlayerJob.onduty
        InitiateZones()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    onDuty = PlayerJob.onduty
    SetTimeout(3000, function()
        InitiateZones()
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = JobInfo.onduty
end)

function InitiateZones()
    for k, v in pairs(Config.Duty) do
        if v.name ~= false and v.coords ~= nil then
            local dloc = vec3(v.coords.x, v.coords.y, v.coords.z)
            DutyZones[#DutyZones..k] = BoxZone:Create(dloc, 1.0, 1.0, {
                name = v.name..k..'coords',
                useZ = true,
                heading = v.coords.w,
                debugPoly = Config.Debug
            })

            DutyZones[#DutyZones..k]:onPlayerInOut(function(isPointInside)
                isInEnterZone = isPointInside
                if isPointInside then
                    if (Config.TextUI == "okoktextui") then
                    exports['okokTextUI']:Open('[E] - '..Lang:t("info.dutychange"), 'lightblue', 'right')
                    end
                    if (Config.TextUI == "qb-core") then
                    exports['qb-core']:DrawText('[E] - '..Lang:t("info.dutychange"), 'right')
                    end

                    CreateThread(function()
                        while isInEnterZone do
                            if IsControlJustReleased(0, 38) then
                                    if (v.name ~= false and PlayerJob.name == v.name) then
                                        exports['qb-core']:KeyPressed()
                                        if (Config.TextUI == "okoktextui") then
                                            exports['okokTextUI']:Close()
                                        end
                                        if (Config.TextUI == "qb-core") then
                                            exports['qb-core']:HideText()
                                        end
                                        local PlayData = QBCore.Functions.GetPlayerData()
                                        onDuty = not PlayData.job.onduty
                                        TriggerServerEvent('pb-duty:server:changeDuty', not PlayData.job.onduty)
                                    end
                            end
                            Wait(0)
                        end
                    end)
                else
                    if (Config.TextUI == "okoktextui") then
                        exports['okokTextUI']:Close()
                    end
                    if (Config.TextUI == "qb-core") then
                        exports['qb-core']:HideText()
                    end
                end
            end)
        end
    end
end

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
    for k in pairs(DutyZones) do DutyZones[k]:destroy() end
end)