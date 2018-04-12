DATA_plants = {
    :plant_keys =>
        ["name", "species", "genus", "water_frequency"],
    :plants => [
        ["Panda Plant", "pandius", "plantus", 4],
        ["Aloe Vera", "aloe", "barbensis", 5],
        ["Ice Plant", "isum", "plantus", 7]
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