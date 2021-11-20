require 'open-uri'

puts("Destroying cocktails..")
puts("Destroying ingridients..")

Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

# puts("Creating ingredients...")
# url_ingridients = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# ingredients = JSON.parse(URI.open(url_ingridients).read)['drinks']
# ingredients.each do |ingredient|
#   Ingredient.create!(name: ingredient['strIngredient1'])
# end
# puts("ingredients ready...")

puts("Creating Cocktails...")

30.times do
  url_cocktail = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
  cocktail = JSON.parse(URI.open(url_cocktail).read)['drinks'][0]
  drink = Cocktail.new(
    name: cocktail['strDrink'],
    image_url: cocktail['strDrinkThumb'],
    category: cocktail['strAlcoholic'],
    instruction: cocktail['strInstructions']
  )
  drink.save unless Cocktail.find_by(name: drink.name)
  if drink.save
    i = 1
    while cocktail["strIngredient#{i}"]
      pg = Ingredient.find_by(name: cocktail["strIngredient#{i}"])
      dose = Dose.new
      if pg
        dose.ingredient = pg
      else
        ingredient = Ingredient.new(name: cocktail["strIngredient#{i}"])
        ingredient.save
        dose.ingredient = ingredient
      end
      dose.cocktail = drink
      dose.save
      i += 1
    end
  end
end
