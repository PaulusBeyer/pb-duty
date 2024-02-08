local Translations = {
    info = {
        dutychange = 'Alternar Servicio',
        onduty = 'Estás en servicio',
        offduty = 'Estás fuera de servicio',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
