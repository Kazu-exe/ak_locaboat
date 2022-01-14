Config = {}

Config.maker = false -- Mettez en true pour activer 

Config.pos = {
    location = {
        position = { x = -862.57, y = -1325.02, z = 1.61} -- Modifier la position du menu
    },
    locationspawn = {
        position = { x = -860.04, y = -1328.9, z = 0.42, heading = 107.82} -- Modifier la position du spawn des vehicules
    }
}

Config.vehicule = {
    {nom = "Seashark", modele = "seashark", price = 100},
    {nom = "Suntrap", modele = "suntrap", price = 50},
    {nom = "Tropic", modele = "tropic", price = 500},
}

Config.blips = {
    id = 455, -- Modifier le blips (https://wiki.rage.mp/index.php?title=Blips)
    colour = 3, -- Modifier la couleur du blips (https://wiki.rage.mp/index.php?title=Blips)
    scale = 0.6, -- Modifier la taille du blips
    name = "Location de bateaux" -- Changer le nom du blips
}

Config.ped = {
    pedtype = "ig_money", -- Modifier le ped
    {x = -863.15, y = -1325.41, z = 0.60, a = 302.22}, -- Modifier la position du ped
 }