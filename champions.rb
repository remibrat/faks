joueurs_echecs = [
    { nom: "Alice", age: 25, elo: 2000 },
    { nom: "Bob", age: 32, elo: 1950 },
    { nom: "Charlie", age: 19, elo: 2100 },
    { nom: "David", age: 28, elo: 1880 },
    { nom: "Eve", age: 23, elo: 2050 },
    { nom: "Frank", age: 30, elo: 1900 },
    { nom: "Grace", age: 22, elo: 2150 },
    { nom: "Henry", age: 27, elo: 1920 },
    { nom: "Ivy", age: 26, elo: 2030 },
    { nom: "Jack", age: 31, elo: 1980 },
    { nom: "Kate", age: 29, elo: 2010 },
    { nom: "Liam", age: 24, elo: 1970 },
    { nom: "Mia", age: 20, elo: 2060 },
    { nom: "Noah", age: 33, elo: 1930 },
    { nom: "Olivia", age: 21, elo: 2080 },
    { nom: "Patrick", age: 18, elo: 2140 },
    { nom: "Patrick 2", age: 18, elo: 2140 },
    { nom: "Quinn", age: 34, elo: 1900 },
    { nom: "Rachel", age: 35, elo: 1870 },
    { nom: "Samuel", age: 36, elo: 1860 },
    { nom: "Tara", age: 37, elo: 1850 },
    { nom: "Ursula", age: 38, elo: 1840 },
    { nom: "Victor", age: 39, elo: 1830 },
    { nom: "Wendy", age: 40, elo: 1820 },
    { nom: "Xander", age: 41, elo: 1810 },
    { nom: "Yara", age: 42, elo: 1800 },
    { nom: "Zachary", age: 43, elo: 1790 },
    { nom: "Abigail", age: 44, elo: 1780 },
    { nom: "Benjamin", age: 44, elo: 1770 },
    { nom: "Chloe", age: 26, elo: 1890 },
    { nom: "Daniel", age: 26, elo: 1960 },
    { nom: "Emily", age: 66, elo: 3020 },
]

def get_champions(joueurs)
    joueurs_par_age = joueurs.group_by { |joueur| joueur[:age] }.map do |age, joueurs_age|
        max_elo = joueurs_age.max_by { |joueur| joueur[:elo] }[:elo]
        joueurs_age.select { |joueur| joueur[:elo] == max_elo }
    end.flatten

    joueurs_par_elo = joueurs_par_age.group_by { |joueur| joueur[:elo] }.map do |elo, joueurs_elo|
        min_age = joueurs_elo.min_by { |joueur| joueur[:age] }[:age]
        joueurs_elo.select { |joueur| joueur[:age] == min_age }
    end.flatten

    return joueurs_par_elo.select do |joueur|
        !joueurs_par_elo.any? { |autre_joueur| (joueur[:elo] < autre_joueur[:elo] && joueur[:age] >= autre_joueur[:age]) || 
        (joueur[:age] > autre_joueur[:age] && joueur[:elo] <= autre_joueur[:elo]) }
    end
end

puts get_champions(joueurs_echecs)