const pt_BR = {
    buy: "comprar",
    sell: "vender",
    rent: "alugar",
    testDrive: "test drive",
    coin: "$",
    trunk: "Capacidade",
    trunkCapacity: "Capacidade do Porta-Malas",
    stock: "Estoque",
    search: "buscar",
    back: "voltar",
    sort: "ordenar",
    mostWanted: "os mais procurados",
    myVehicles: "meus veículos",
    darkMode: "Modo Escuro",
    lightMode: "Modo Claro",
    selectColor: "escolha a cor do veículo",
    continue: "continuar", 
    warning: "atenção!",
    yes: "sim",
    no: "não",
    related: "relacionados",
    buyVehicle: (veh,price) => {
        return `Deseja comprar um(a) <b>`+veh.modelo+`</b> por <b>$ `+price+`</b> ?`
    },
    sellVehicle: (vehicle,price) => {
        return `deseja vender um(a) <b>`+vehicle+`</b> por <b>$ `+price+`</b> ?`
    },
}

const lang = pt_BR;