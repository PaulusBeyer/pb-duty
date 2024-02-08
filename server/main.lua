local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('pb-duty:server:changeDuty', function(duty)
    local Player = QBCore.Functions.GetPlayer(source)
    local Job = Player.PlayerData.job

    if Job and Job.onduty and not duty then
        Player.Functions.SetJobDuty(false)
        QBCore.Functions.Notify(source, Lang:t("info.offduty"), 'error')
        TriggerClientEvent('QBCore:Client:SetDuty', source, false)
    elseif Job and not Job.onduty and duty then
        Player.Functions.SetJobDuty(true)
        QBCore.Functions.Notify(source, Lang:t("info.onduty"), 'success')
        TriggerClientEvent('QBCore:Client:SetDuty', source, true)
    end
end)