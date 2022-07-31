SV_Config = {
    getUserId = function(source) -- Retorn a user_id do player. (Argumento = source)
        if source then
            return vRP.getUserId(source)
        end
    end,
    hasPermission = function(user_id,perm) -- Retorna se o user_id tem a permissão desejada. (Argumento = user_id)
        if user_id and perm then
            return vRP.hasPermission(user_id,perm)
        end
    end,
    getInventoryWeight = function(user_id) -- Retorna o peso do inventário. (Argumento = user_id)
        if user_id then
            return vRP.getInventoryWeight(user_id)
            -- return vRP.computeInvWeight(user_id) -- Creative
        end
    end,
    getInventoryMaxWeight = function(user_id) -- Retorna o peso maximo do inventário. (Argumento = user_id)
        if user_id then
            return vRP.getInventoryMaxWeight(user_id)
            -- return vRP.getBackpack(user_id) -- Creative
        end
    end,
    giveInventoryItem = function(user_id,item_name,item_amount)
        if user_id and item_name and item_amount then
            vRP.giveInventoryItem(user_id,item_name,item_amount,true)
        end
    end,
    getItemWeight = function(name_item) -- Retorna o peso do item. (Argumento = Nome do item)
        if name_item then
            return vRP.itemWeightList(name_item) or 1
        end
    end
}