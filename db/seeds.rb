DATA_plants = {
    :plant_keys =>
        ["name", "genus", "water_frequency", "image_url"],
    :plants => [
        ["Aloe Vera", "Aloe", 15, "https://www.publicdomainpictures.net/pictures/210000/velka/aloe-vera-plant-1484074843rYR.jpg"],
        ["Black Prince", "Echeveria", 15, "https://upload.wikimedia.org/wikipedia/commons/9/9b/Echeveria_%27Black_Prince%27_-_20090226.jpg"],
        ["Bromeliad", "Aechmea", 25, "https://www.publicdomainpictures.net/pictures/240000/velka/tropical-bromeliad.jpg"],
        ["Burro's Tail", "Sedum", 15, "http://4.bp.blogspot.com/-oqf1X7h6ziU/UNoa3YYiyoI/…AABWE/zk6Ohb05iY8/s1600/sedum-morganianum-300.jpg"],
        ["Common Glasswort", "Salicornia", 10, "http://www.hippocampus-bildarchiv.com/images/PFFT0465_Salicornia_europaea.jpg"],
        ["Copper Leaf", "Echeveria", 15, "https://upload.wikimedia.org/wikipedia/commons/thu…a_wilkesiana1.JPG/1200px-Acalypha_wilkesiana1.JPG"],
        ["Ice Plant", "Mesembryanthemum", 17, "https://farm4.staticflickr.com/3075/2857478405_0d45d216eb_z.jpg"],
        ["Panda Plant", "Kalanchoe", 25, "https://farm5.staticflickr.com/4020/4508582330_5809bddf76_z.jpg"],
        ["Papierrosie", "Hawarthia", 10, "https://upload.wikimedia.org/wikipedia/commons/e/e5/Haworthia_decipiens_-_Uniondale_MBB_1.jpg"],
        ["Pinstripe Calathea", "Calathea", 14, "http://www.costafarms.com/CostaFarms/Calathea-Ornata-Costa-Farms-Houseplant.jpg"],
        ["Ponytail Palm", "Beaucarnea", 15, "https://greenerynyc.com/wp-content/uploads/2017/05/Ponytail-Palm-Stone-Polymer-1.jpg"],
        ["Pothos", "Pothosum", 15, "https://www.flowersandfancies.com/files/cache/5dc8fb3b643358a4b39bb555c4b3d581_f8987.jpg"],
        ["Sentry Plant", "Agave", 10, "https://upload.wikimedia.org/wikipedia/commons/thu…4px-Agave_American_with_yellow_close_%28NL%29.jpg"],
        ["Snake Plant", "Sansevieria", 15, "https://upload.wikimedia.org/wikipedia/commons/9/91/Snake_plant.jpg"],
        ["Sweetheart Hoya", "Hoya", 15, "https://upload.wikimedia.org/wikipedia/commons/b/b3/Hoya_kerrii_with_stems.jpg"],
        ["Woolly Senecio", "Senecio", 15, "https://upload.wikimedia.org/wikipedia/commons/6/61/Senecio_haworthii-PICT2616.jpg"],
        ["ZZ Plant", "Zamioculcas", 12, "https://upload.wikimedia.org/wikipedia/commons/c/cf/Zamioculcas_zamiifolia_1.jpg"]
    ]
}

def make_plants
    DATA_plants[:plants].each do |plant|
        new_plant = Plant.new
        plant.each_with_index do |attribute, i|
            new_plant.send(DATA_plants[:plant_keys][i]+"=", attribute)
        end
        new_plant.save
    end
end


DATA_users = {
    :user_keys =>
        ["username", "email", "password"],
    :users => [
        ['Jordan', 'jordan@jordan.gov', 'word'],
        ['Paul', 'paul@paul.gov', 'word'],
        ['Philip', 'philip@philip.gov', 'word'],
        ['Warner', 'warner@warner.gov', 'word'],
        ['David', 'david@david.gov', 'word']
    ]
}

def make_users
    DATA_users[:users].each do |user|
        new_user = User.new
        user.each_with_index do |attribute, i|
            new_user.send(DATA_users[:user_keys][i]+"=", attribute)
        end
        new_user.save
    end
end

def main
    make_plants
    make_users
end

main