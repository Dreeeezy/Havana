Translations = {}

function _(str, ...) -- Translate string
    if Translations[Config.TranslationSelected] ~= nil then
        if Translations[Config.TranslationSelected][str] ~= nil then
            return string.format(Translations[Config.TranslationSelected][str], ...)
        else
            return 'Translation [' .. Config.TranslationSelected .. '][' .. str .. '] does not exist'
        end
    else
        return 'Locale [' .. Config.TranslationSelected .. '] does not exist'
    end
end

function _U(str, ...) -- Translate string first char uppercase
    return tostring(_(str, ...):gsub('^%l', string.upper))
end

Translations['en'] = {
    ['help_play'] = '~INPUT_CELLPHONE_CANCEL~ Ficar de pé\n~INPUT_FRONTEND_RDOWN~ ~INPUT_JUMP~ Rodar\n~INPUT_CONTEXT~ Trocar câmera\nValor: ~y~%s~w~ Fichas',
    ['help_sit'] = 'Pressione ~INPUT_CONTEXT~ para jogar no caça-níquel\nValor: ~y~%s~w~ Fichas'
}