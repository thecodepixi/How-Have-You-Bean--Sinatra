21 User.create(username: "TheCodePixi", password: "password")
22 User.create(username: "CoffeeLover", password: "iLoVeCoffee")
23 User.create(username: "JavaJeff", password: "JeffwithaJ")
24 User.create(username: "CafeCrazy", password: "locoforcoco")

User.find(21).coffees << Coffee.new(name: "Ethiopian Yirgacheffe", roaster: "Maiden", roast_level: "Light", tasting_notes: "Citrusy and bright with a silky body. Distinct notes of grapefruit.", rating: 5)
User.find(22).coffees << Coffee.new(name: "Costa Rican Naranjo", roaster: "Modcup", roast_level: "Medium", tasting_notes: "Surprising amount of body with a rich caramel and toffee flavor profile.", rating: 4)
User.find(23).coffees << Coffee.new(name: "Columbia El Obraje", roaster: "Maiden", roast_level: "Light", tasting_notes: "Cocoa, almonds, cherries. Syrupy body. Fell flat, in my opinion", rating: 2)
User.find(24).coffees << Coffee.new(name: "Ken AB", roaster: "ModCup", roast_level: "Medium", tasting_notes: "Intense fruit flavors, brown sugar sweetness, and a slight citrus top note.", rating: 4)
User.find(21).coffees << Coffee.new(name: "Darkest", roaster: "Maiden", roast_level: "Dark", tasting_notes: "Rich, intense, and definitely the darkest Maiden has to offer.", rating: 3)
User.find(21).coffees << Coffee.new(name: "Jersey Diner Style", roaster: "Booskerdoo", roast_level: "Medium", tasting_notes: "Classic diner coffee. Tastes like coffee, in all the right ways.", rating: 3)