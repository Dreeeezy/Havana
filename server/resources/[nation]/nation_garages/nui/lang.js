const pt_BR = {
    spawn: "retirar",
    store: "guardar",
    generalData: "dados gerais",
    taxStats: "status da taxa",
    vehicleStats: "status do veículo",
    ready: "Liberado",
    engineStats: "status do motor",
    fuel: "combustível",
    bodyHealthStats: "estado da lataria",
    trunkChestWeight: "capacidade do porta-malas",
    tuning: "tuning",
    engine: "motor",
    brakes: "freios",
    transmission: "transmissão",
    suspension: "suspensão",
    armor: "blindagem",
    turbo: "turbo",
    yes: "sim",
    no: "não",
    storeNearestVehicle: "guardar veículo próximo",
    seized: "Apreendido",
    detained: "Detido",
    coin: "$",
    weightUnit: "kg",
    vehicleDocumentDelayed: "com ipva atrasado",
    documentDelayedStats: "IPVA Atrasado",
    upToDate: "Em dia",
    disabledTuning: "Desativado",
    success: "sucesso",
    paymentFailed: "falha no pagamento!",
    notify: (title) => {
        let titles = {
            guardou: "guardou",
            retirou: "retirou",
            trancado: "trancado",
            destrancado: "destrancado"
    
        }
        if (titles[title]) { return titles[title]; }
        else { return title; }
    },
    popup: (vehicle, tax) => {
        if (tax) { return "Veículo "+tax[1]+", deseja liberar pagando "+tax[0]+" ?"  }
        else { return "Deseja retirar o veículo "+vehicle.name+" por <b>$ "+vehicle.tax+"</b> ?" }
    },
    warnning: "atenção"
}

const en_US = {
    spawn: "spawn",
    store: "store",
    generalData: "general data",
    taxStats: "tax stats",
    vehicleStats: "vehicle stats",
    ready: "Ready",
    engineStats: "engine stats",
    fuel: "fuel level",
    bodyHealthStats: "body health level",
    trunkChestWeight: "trunk chest weight",
    tuning: "tuning",
    engine: "engine",
    brakes: "brakes",
    transmission: "transmission",
    suspension: "suspension",
    armor: "armor",
    turbo: "turbo",
    yes: "yes",
    no: "no",
    storeNearestVehicle: "store nearest vehicle",
    seized: "Seized",
    detained: "Detained",
    coin: "$",
    weightUnit: " lbs",
    vehicleDocumentDelayed: "document delayed",
    documentDelayedStats: "Document Delayed",
    upToDate: "Up do date",
    disabledTuning: "Disabled",
    success: "success",
    paymentFailed: "payment failed!",
    notify: (title) => {
        let titles = {
            guardou: "stored",
            retirou: "spawned",
            trancado: "locked",
            destrancado: "unlocked"
    
        }
        if (titles[title]) { return titles[title]; }
        else { return title; }
    },
    popup: (vehicle, tax) => {
        if (tax) { return ""+tax[1]+" vehicle, do you want to spawn it for "+tax[0]+" ?"  }
        else { return "Do you want to spawn the "+vehicle.name+" vehicle for <b>$ "+vehicle.tax+"</b> ?" }
    },
    warnning: "warnning!"
}

const lang = pt_BR;
